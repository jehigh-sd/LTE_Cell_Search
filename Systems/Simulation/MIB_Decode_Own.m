clear all
close all

loadFromFile = 0;

%BCH comes on sub-frame#0 and we need to capture atleast 11 sub-frames to
%make sure that sub-frame#0 is received. Under poor signal conditions we
%might have to collect 4 TTI and for that we need to receive 41 sub-frames

if loadFromFile
    load eNodeBOutput.mat           % Load I/Q capture of eNodeB output
    eNodeBOutput = double(eNodeBOutput)/32768; % Scale samples
    sr = 15.36e6;                   % Sampling rate for loaded samples
else
    rmc = lteRMCDL('R.3');
    rmc.NCellID = 17;
    rmc.TotSubframes = 41;
    rmc.PDSCH.RNTI = 61;
    % SIB parameters
    rmc.SIB.Enable = 'On';
    rmc.SIB.DCIFormat = 'Format1A';
    rmc.SIB.AllocationType = 0;
    rmc.SIB.VRBStart = 8;
    rmc.SIB.VRBLength = 8;
    rmc.SIB.Gap = 0;
    % SIB data field filled with random bits, this is not a valid SIB
    % message
    rmc.SIB.Data = randi([0 1],176,1);
    [eNodeBOutput,~,info] = lteRMCDLTool(rmc,[1;0;0;1]);
    sr = info.SamplingRate;     % Sampling rate of generated samples
end


%Prior to decoding the MIB, the UE does not know the full system bandwidth. The primary and secondary synchronization 
%signals (PSS and SSS) and the PBCH (containing the MIB) all lie in the central 72 subcarriers (6 resource blocks) of the 
%system bandwidth, allowing the UE to initially demodulate just this central region. Therefore the bandwidth is 
%initially set to 6 resource blocks. The I/Q waveform needs to be resampled accordingly. At this stage we also 
%display the spectrum of the input signal eNodeBOutput.

enb = struct;                   % eNodeB config structure
enb.NDLRB = 6;                  % Number of resource blocks
ofdmInfo = lteOFDMInfo(setfield(enb,'CyclicPrefix','Normal')); %#ok this will return sampling rate in ofdmInfo.SamplingRate

%Set sampling rate to 1.92MHz
ofdmInfo.SamplingRate = 1920000;
ofdmInfo.Nfft = 128; %LTE uses 2048-point FFT for 20MHz BW at 30.72MHz. For 1.92MHz, FFT size will be 128
%LTE CP duration 5.2us/10 Samples before first symbol and 4.7us/144 Samples
%before second symbol


% Downsample received signal. We have only one antenna
nSamples = ceil(ofdmInfo.SamplingRate/round(sr)*size(eNodeBOutput,1));
%nRxAnts = size(eNodeBOutput, 2);
nRxAnts = 1;
downsampled = zeros(nSamples, nRxAnts);
for i=1:nRxAnts
    downsampled(:,i) = resample(eNodeBOutput(:,i), ofdmInfo.SamplingRate, round(sr));
end

% Display received signal spectrum
size_fft = 4096;
S_fft = fft(eNodeBOutput,size_fft);
F = linspace(-0.5,0.5-1/size_fft,size_fft)*(sr/1000000);
figure(1)
plot(F,20*log10(fftshift(abs(S_fft)/size_fft)));
title("Spectrum of Input Signal")
xlabel('Frequency in Mhz')
ylabel('Magnitude in dB')
%Perform Cross Correlation to determine peaks
d_buff = zeros(1,9);

cnt = 1;
corr_sum = 0;
z = zeros(1,1088); %One slot worth of data
% for i=129:nSamples
%    inst_corr = downsampled(i)*downsampled(i-128)';
%    temp = inst_corr - d_buff(9);
%    d_buff = [inst_corr d_buff(1:8)];
%    corr_sum = corr_sum + temp;
%    z(i) = abs(corr_sum);
% end

t = 10;
% for i=1:1088*t
%     A = downsampled(i:i+8);
%     B = downsampled(i+128:i+128+8);
%     temp = B'*A;
%     z(mod(i-1,960)+1) = z(mod(i-1,960)+1) + temp;
% end

%Low complexity method
for i=1:1088*t
    A = downsampled(i:i+8);
    B = downsampled(i+128:i+128+8);
    temp = B'*A;
    z(mod(i-1,960)+1) = z(mod(i-1,960)+1) + temp;
end

figure(2)
stem(abs(z(1:960)))
title('CP Correlation Plot Identifying symbol boundaries')
xlabel('Sample Index')
ylabel('Correlation value')
cfgdl=struct;
cfgdl.NDLRB = 6;
cfgdl.CyclicPrefix = 'Normal';
cfgdl.DuplexMode = 'FDD';
[foffset, corr] = lteFrequencyOffset(cfgdl,downsampled(1:1088*t));
figure(3)
stem(corr)
title('CP Correlation Plot Identifying symbol boundaries - toolbox')
ind1 = [895 759 621 483 346 209 72];
ind2 = [759 621 483 346 209 72];

%freq_off = ((angle(z(759)) - angle(z(621)))*1920000)/(137*2*pi);

%loadfromfile_0
ind = [2 139 276 414 550 687 824];
%Generate PSS signal Zadoff-Chu Sequences for NID=0
u_shift = [25 29 34];
d_u_0 = [];
d_u_1 = [];
d_u_2 = [];
 
for n = 0:61
    u_0 = u_shift(1); 
    u_1 = u_shift(2); 
    u_2 = u_shift(3); 
    if n <= 30
        d_0 = exp(-j*pi*u_0*n*(n+1)/63);    
        d_1 = exp(-j*pi*u_1*n*(n+1)/63);
        d_2 = exp(-j*pi*u_2*n*(n+1)/63);
    else
        d_0 = exp(-j*pi*u_0*(n+1)*(n+2)/63);
        d_1 = exp(-j*pi*u_1*(n+1)*(n+2)/63);
        d_2 = exp(-j*pi*u_2*(n+1)*(n+2)/63);
    end
    d_u_0 = [d_u_0 d_0];
    d_u_1 = [d_u_1 d_1];
    d_u_2 = [d_u_2 d_2];
end

%Generate time domain series for PSS
td_pss_0 = fftshift([zeros(1,33) d_u_0(1:31) 0 d_u_0(32:62) zeros(1,32)]);
td_pss_1 = fftshift([zeros(1,33) d_u_1(1:31) 0 d_u_1(32:62) zeros(1,32)]);
td_pss_2 = fftshift([zeros(1,33) d_u_2(1:31) 0 d_u_2(32:62) zeros(1,32)]);
%td_pss_2 = [0 d_u_2(32:62) zeros(1,65) d_u_2(1:31)];

td_pss_0 = ifft(td_pss_0,ofdmInfo.Nfft)*sqrt(128/62);
td_pss_1 = ifft(td_pss_1,ofdmInfo.Nfft)*sqrt(128/62);
td_pss_2 = ifft(td_pss_2,ofdmInfo.Nfft)*sqrt(128/62);

%Append 9 samples at the front. Consider only Normal CP for now.
% td_pss_0 = [td_pss_0(end-8:end) td_pss_0];
% td_pss_1 = [td_pss_1(end-8:end) td_pss_1];
% td_pss_2 = [td_pss_2(end-8:end) td_pss_2];

pss_rslts_0 = [];
pss_rslts_1 = [];
pss_rslts_2 = [];


for i=1:1088*t
    A = downsampled(i:i+127);
    temp0 = A.'*td_pss_0';
    temp1 = A.'*td_pss_1';
    temp2 = A.'*td_pss_2';
    pss_rslts_0(i) = abs(temp0);
    pss_rslts_1(i) = abs(temp1);
    pss_rslts_2(i) = abs(temp2);
end

% for i = 1:length(ind)
%     temp = downsampled(ind(i)+9:ind(i)+127+9).'*td_pss_0';
%     pss_rslts_0 = [pss_rslts_0 abs(temp)];
%     
%     temp = downsampled(ind(i)+9:ind(i)+127+9).'*td_pss_1';
%     pss_rslts_1 = [pss_rslts_1 abs(temp)];
%     
%     temp = downsampled(ind(i)+9:ind(i)+127+9).'*td_pss_2';
%     pss_rslts_2 = [pss_rslts_2 abs(temp)];
% end

figure(4)
subplot(3,1,1)
stem(1:length(pss_rslts_0),pss_rslts_0)
title('Correlation with PSS Sequence-0')
xlabel('Sample Index')
ylabel('Correlation value')
subplot(3,1,2)
stem(1:length(pss_rslts_1),pss_rslts_1)
title('Correlation with PSS Sequence-1')
xlabel('Sample Index')
ylabel('Correlation value')
subplot(3,1,3)
stem(1:length(pss_rslts_2),pss_rslts_2)
title('Correlation with PSS Sequence-2')
xlabel('Sample Index')
ylabel('Correlation value')
%Assuming its FDD
sss_loc = [696 10296];

sss_recv_1 = fftshift(fft(downsampled(696:823)));
sss_recv_2 = fftshift(fft(downsampled(10296:10423)));

n_id_2_est = 2;
results_sss_1_PSS_1 = [];
results_sss_1_PSS_2 = [];
results_sss_2_PSS_1 = [];
results_sss_2_PSS_2 = [];
for t=0:167
  sss_1_try=sss(t,n_id_2_est,0);
  sss_2_try=sss(t,n_id_2_est,10);

  sss_1_try = [zeros(1,33) sss_1_try(1:31) 0 sss_1_try(32:62) zeros(1,32)];
  sss_2_try = [zeros(1,33) sss_2_try(1:31) 0 sss_2_try(32:62) zeros(1,32)];
   
  temp_sss = sss_1_try*conj(sss_recv_1);
  results_sss_1_PSS_1 = [results_sss_1_PSS_1 temp_sss];

  temp_sss = sss_2_try*conj(sss_recv_1);
  results_sss_2_PSS_1 = [results_sss_2_PSS_1 temp_sss];

  temp_sss = sss_1_try*conj(sss_recv_2);
  results_sss_1_PSS_2 = [results_sss_1_PSS_2 temp_sss];

  temp_sss = sss_2_try*conj(sss_recv_2);
  results_sss_2_PSS_2 = [results_sss_2_PSS_2 temp_sss];
end

figure(5)
subplot(4,1,1)
stem(abs(results_sss_1_PSS_1));
ylabel('Correlation value')
xlabel('SSS sequence number')
title('SSS - first slot, PSS - first peak')
subplot(4,1,2)
stem(abs(results_sss_1_PSS_2));
ylabel('Correlation value')
xlabel('SSS sequence number')
title('SSS - first slot, PSS - second peak')
subplot(4,1,3)
stem(abs(results_sss_2_PSS_1));
ylabel('Correlation value')
xlabel('SSS sequence number')
title('SSS - second slot, PSS - first peak')
subplot(4,1,4)
stem(abs(results_sss_2_PSS_2));
ylabel('Correlation value')
xlabel('SSS sequence number')
title('SSS - second slot, PSS - second peak')

computed_cell_id = 3*5 + 2;
%Duplex modes
duplexModes = {'TDD' 'FDD'};

%CP lengths
cyclicPrefixes = {'Normal' 'Extended'};

%Buffer to hold resource grid
rxgrid = zeros(72,14);

%To validate my demodulate function
%Indices of first subframe
sym_ind = [11,148,285,422,559,696,833,971,1108,1245,1382,1519,1656,1793];

rxgrid1 = zeros(72,14);
%Perform FFT and store the output in rxgrid
for i = 1:length(sym_ind)
    temp = fftshift(fft(downsampled(sym_ind(i):sym_ind(i)+127),128));
    rxgrid1(:,i) = temp(29:100);
end

figure(6)
plot(rxgrid1(:,1),'o')
xlabel('I- Inphase Component')
ylabel('Q - Quadrature Component')

