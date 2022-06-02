clear all
close all
loadFromFile = 0;

%BCH comes on sub-frame#0 and we need to capture atleast 11 sub-frames to
%make sure that sub-frame#0 is received. Under poor signal conditions we
%might have to collect 4 TTI and for that we need to receive 41 sub-frames

if loadFromFile
    load eNodeBOutput.mat          % Load I/Q capture of eNodeB output
    eNodeBOutput = double(eNodeBOutput); % Scale samples
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
F = linspace(-0.5,0.5-1/size_fft,size_fft)*sr;
plot(F,20*log10(fftshift(abs(S_fft))));

%Duplex modes
duplexModes = {'TDD' 'FDD'};

%CP lengths
cyclicPrefixes = {'Normal' 'Extended'};

% Perform cell search across duplex mode and cyclic prefix length
% combinations and record the combination with the maximum correlation; if
% multiple cell search is configured, this example will decode the first
% (strongest) detected cell
searchalg.MaxCellCount = 1;
searchalg.SSSDetection = 'PostFFT';
peakMax = -Inf;
for duplexMode = duplexModes
    for cyclicPrefix = cyclicPrefixes
        enb.DuplexMode = duplexMode{1};
        enb.CyclicPrefix = cyclicPrefix{1};
        [enb.NCellID, offset, peak] = lteCellSearch(enb, downsampled, searchalg);
        enb.NCellID = enb.NCellID(1);
        offset = offset(1);
        peak = peak(1);
        if (peak>peakMax)
            enbMax = enb;
            offsetMax = offset;
            peakMax = peak;
        end
    end
end

% Use the cell identity, cyclic prefix length, duplex mode and timing
% offset which gave the maximum correlation during cell search
enb = enbMax;
offset = offsetMax;

% Compute the correlation for each of the three possible primary cell
% identities; the peak of the correlation for the cell identity established
% above is compared with the peak of the correlation for the other two
% primary cell identities in order to establish the quality of the
% correlation.
corr = cell(1,3);
idGroup = floor(enbMax.NCellID/3);
for i = 0:2
    enb.NCellID = idGroup*3 + mod(enbMax.NCellID + i,3);
    [~,corr{i+1}] = lteDLFrameOffset(enb, downsampled);
    corr{i+1} = sum(corr{i+1},2);
end
threshold = 1.3 * max([corr{2}; corr{3}]); % multiplier of 1.3 empirically obtained
if (max(corr{1})<threshold)
    warning('Synchronization signal correlation was weak; detected cell identity may be incorrect.');
end
% Return to originally detected cell identity
enb.NCellID = enbMax.NCellID;

% Plot PSS/SSS correlation and threshold
synchCorrPlot.YLimits = [0 max([corr{1}; threshold])*1.1];
%synchCorrPlot([corr{1} threshold*ones(size(corr{1}))]);

% Perform timing synchronization
fprintf('Timing offset to frame start: %d samples\n',offset);
downsampled = downsampled(1+offset:end,:);
enb.NSubframe = 0;

% Show cell-wide settings
fprintf('Cell-wide settings after cell search:\n');
disp(enb);

% For TDD, TDDConfig and SSC are defaulted to 0. These parameters are not
% established in the system until SIB1 is decoded, so at this stage the
% values of 0 make the most conservative assumption (fewest downlink
% subframes and shortest special subframe).
if (strcmpi(enb.DuplexMode,'TDD'))
    enb.TDDConfig = 0;
    enb.SSC = 0;
end
delta_f = lteFrequencyOffset(enb, downsampled);
fprintf('Frequency offset: %0.3fHz\n',delta_f);
downsampled = lteFrequencyCorrect(enb, downsampled, delta_f);

% Channel estimator configuration
cec.PilotAverage = 'UserDefined';     % Type of pilot averaging
cec.FreqWindow = 13;                  % Frequency window size
cec.TimeWindow = 9;                   % Time window size
cec.InterpType = 'cubic';             % 2D interpolation type
cec.InterpWindow = 'Centered';        % Interpolation window type
cec.InterpWinSize = 1;                % Interpolation window size

% Assume 4 cell-specific reference signals for initial decoding attempt;
% ensures channel estimates are available for all cell-specific reference
% signals
enb.CellRefP = 4;

fprintf('Performing OFDM demodulation...\n\n');

griddims = lteResourceGridSize(enb); % Resource grid dimensions
L = griddims(2);                     % Number of OFDM symbols in a subframe
% OFDM demodulate signal
rxgrid = lteOFDMDemodulate(enb, downsampled);
if (isempty(rxgrid))
    fprintf('After timing synchronization, signal is shorter than one subframe so no further demodulation will be performed.\n');
    return;
end
% Perform channel estimation
[hest, nest] = lteDLChannelEstimate(enb, cec, rxgrid(:,1:L,:));

%To validate my demodulate function
%Indices of first subframe
sym_ind = [11,148,285,422,559,696,833,971,1108,1245,1382,1519,1656,1793];

rxgrid1 = zeros(72,14);
%Perform FFT and store the output in rxgrid
for i = 1:length(sym_ind)
    temp = fftshift(fft(downsampled(sym_ind(i):sym_ind(i)+127),128));
    rxgrid1(:,i) = [temp(1:28).' zeros(1,44)].';
    rxgrid1(:,i) = temp(29:100);
end


figure(2)
plot(rxgrid1(:,1),'o')
xlabel('I - Inphase Component')
ylabel('Q - Quadrature Component')
title('Generated using our code - Symbol0')

figure(3)
plot(rxgrid(:,1),'o')
xlabel('I - Inphase Component')
ylabel('Q - Quadrature Component')
title('Generated using toolbox - Symbol0')
delta_f