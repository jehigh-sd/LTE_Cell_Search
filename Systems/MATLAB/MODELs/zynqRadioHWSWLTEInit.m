
% ADC sampling rate.
FsIn = 61.44e6;

load eNodeBWaveform;
tb_dataIn = resample(rxWaveform,FsIn,fs);

% Simulink simulation parameters.
simParams.Ts       = 1/FsIn;
simParams.stopTime = (length(tb_dataIn)-1) * simParams.Ts;

% Embedded test waveform. Generate one radio frame with LST and loop in HW.
% Test waveform is sampled at 1.92 Msps and then upsampled on FPGA.

% Generate waveform #RX.
testWaveformCellID = 51;
testWaveform = generateDLRXWaveform(FsIn,'R.6',testWaveformCellID,'Off',0.0,1000,10);
testWaveform = (1/16) * (0.95 / max(abs(testWaveform))) * testWaveform;
testWaveform = resample(testWaveform,1.92e6,FsIn);

% Create LUT data from waveform #RX0.
testWaveformLength                      = length(testWaveform);
testWaveformtableLength                 = 2^nextpow2(testWaveformLength);
testWaveformData                        = zeros(testWaveformtableLength,1,'like',fi(0,1,16,15));
testWaveformData(1:testWaveformLength) = testWaveform;

% Generate waveform #TX0.
testWaveform0CellID = 51;
testWaveform0 = generateDLRXWaveform(FsIn,'R.6',testWaveform0CellID,'Off',0.0,1000,10);
testWaveform0 = (1/16) * (0.95 / max(abs(testWaveform0))) * testWaveform0;
testWaveform0 = resample(testWaveform0,1.92e6,FsIn);

% Create LUT data from waveform #TX0.
testWaveform0Length                      = length(testWaveform0);
testWaveform0tableLength                 = 2^nextpow2(testWaveform0Length);
testWaveform0Data                        = zeros(testWaveform0tableLength,1,'like',fi(0,1,16,15));
testWaveform0Data(1:testWaveform0Length) = testWaveform0;

% Generate waveform #TX1.
testWaveform1CellID = 101;
testWaveform1 = generateDLRXWaveform(FsIn,'R.6',testWaveform1CellID,'Off',0.0,1000,10);
testWaveform1 = (1/16) * (0.95 / max(abs(testWaveform1))) * testWaveform1;
testWaveform1 = resample(testWaveform1,1.92e6,FsIn);

% Create LUT data from waveform #TX1.
testWaveform1Length                      = length(testWaveform1);
testWaveform1tableLength                 = 2^nextpow2(testWaveform1Length);
testWaveform1Data                        = zeros(testWaveform1tableLength,1,'like',fi(0,1,16,15));
testWaveform1Data(1:testWaveform1Length) = testWaveform1;

% Generate waveform #TX2.
testWaveform2CellID = 501;
testWaveform2 = generateDLRXWaveform(FsIn,'R.6',testWaveform2CellID,'Off',0.0,1000,10);
testWaveform2 = (1/16) * (0.95 / max(abs(testWaveform2))) * testWaveform2;
testWaveform2 = resample(testWaveform2,1.92e6,FsIn);

% Create LUT data from waveform #TX2.
testWaveform2Length                      = length(testWaveform2);
testWaveform2tableLength                 = 2^nextpow2(testWaveform2Length);
testWaveform2Data                        = zeros(testWaveform2tableLength,1,'like',fi(0,1,16,15));
testWaveform2Data(1:testWaveform2Length) = testWaveform2;

% Front End FIR Decimator @ 30.72 Msps
dlDetConfig.frontEndFIRDecim = designFrontEndFIRDecim();

% Front End FIR Decimator @ 1.92 Msps
dlDetConfig2.frontEndFIRDecim = designFrontEndFIRDecim2();

samplecontrolbus;

interp_coeff = [0 -2.5762581491757149E-5 -5.8831821680514759E-5 -9.3312161185059878E-5 ...
                -0.00012086163085409433 -0.00013205270976779482 -0.00011834743116057382 ...
                -7.4366825754989437E-5 0 9.8160915307191784E-5 0.00020653032645552219 ...
                0.00030569884691874328 0.00037312606030348193 0.00038710567399410266 ...
                0.00033143343994865174 0.00019995023815725909 0 -0.00024611644953130535 ...
                -0.00050237406876756942 -0.00072320914773199184 -0.00086038268936497941 ...
                -0.00087166788797456607 -0.00073000105198961778 -0.00043141174353976327 ...
                0 0.00051149159396842369 0.0010263594832950844 0.0014538625812232689 ...
                0.0017033853517477954 0.0017008871462745852 0.0014049583413437243 ...
                0.00081947197501865956 0 -0.00094810607847870226 -0.0018808492888220838 ...
                -0.0026352624613329868 -0.0030553081816828832 -0.0030202428411423995 ...
                -0.00247072865220911 -0.0014277474612946694 0 0.0016230413454147042 ...
                0.0031930796109812462 0.00443802591741113 0.0051056581078908472 ...
                0.0050093785155702775 0.0040683784677133959 0.0023345651421505286 ...
                0 -0.0026187539064786284 -0.0051193984472911441 -0.0070718134335119327 ...
                -0.00808739941083554 -0.0078893031903380026 -0.0063716582505391091 ...
                -0.0036365506713397764 0 0.0040374115839548 0.0078540829737719763 ...
                0.010798012443441477 0.012292073245047443 0.011937778189025024 ...
                0.0095999760380976757 0.0054563636732276643 0 -0.00601028167306135 ...
                -0.011648449375858055 -0.015957241826634484 -0.018102591848754991 ...
                -0.017522692405904365 -0.014046537497763033 -0.007959475987989087 ...
                0 0.008718104923122711 0.01685235137753412 0.023029139138304663 ...
                0.026064622673058715 0.025174843574555367 0.020139852028642682 ...
                0.011390947438140097 0 -0.012436079757686049 -0.024006222786136334 ...
                -0.032765654100451284 -0.03704666586468406 -0.035752212682362922 ...
                -0.028583560689952235 -0.01615969653056519 0 0.017638825193237648 ...
                0.034058051458235795 0.046508756928501517 0.052626172604575812 ...
                0.050841305470613 0.040702766275549772 0.023050307008179838 ...
                0 -0.025272869236065459 -0.048936761752801212 -0.067046073615192756 ...
                -0.07615058129553684 -0.073883911648887329 -0.05943876854292833 ...
                -0.033846317708509245 0 0.0376024236443906 0.073384893960547079 ...
                0.10143269424548541 0.11635564505557951 0.11415986456169339 ...
                0.093003185804921784 0.053716748922668422 0 -0.061764245016254132 ...
                -0.12307869991479406 -0.17423577931097833 -0.20545948334743191 ...
                -0.20814945771861357 -0.17607037667070338 -0.10632880802090262 ...
                0 0.13769341192513965 0.29769467708537439 0.46790031420225453 ...
                0.63434243500199439 0.78263423378671237 0.89951021019816191 ...
                0.97427716367867034 1 0.97427716367867034 0.89951021019816191 ...
                0.78263423378671237 0.63434243500199439 0.46790031420225453 ...
                0.29769467708537439 0.13769341192513965 0 -0.10632880802090262 ...
                -0.17607037667070338 -0.20814945771861357 -0.20545948334743191 ...
                -0.17423577931097833 -0.12307869991479406 -0.061764245016254132 ...
                0 0.053716748922668422 0.093003185804921784 0.11415986456169339 ...
                0.11635564505557951 0.10143269424548541 0.073384893960547079 ...
                0.0376024236443906 0 -0.033846317708509245 -0.05943876854292833 ...
                -0.073883911648887329 -0.07615058129553684 -0.067046073615192756 ...
                -0.048936761752801212 -0.025272869236065459 0 0.023050307008179838 ...
                0.040702766275549772 0.050841305470613 0.052626172604575812 ...
                0.046508756928501517 0.034058051458235795 0.017638825193237648 ...
                0 -0.01615969653056519 -0.028583560689952235 -0.035752212682362922 ...
                -0.03704666586468406 -0.032765654100451284 -0.024006222786136334 ...
                -0.012436079757686049 0 0.011390947438140097 0.020139852028642682 ...
                0.025174843574555367 0.026064622673058715 0.023029139138304663 ...
                0.01685235137753412 0.008718104923122711 0 -0.007959475987989087 ...
                -0.014046537497763033 -0.017522692405904365 -0.018102591848754991 ...
                -0.015957241826634484 -0.011648449375858055 -0.00601028167306135 ...
                0 0.0054563636732276643 0.0095999760380976757 0.011937778189025024 ...
                0.012292073245047443 0.010798012443441477 0.0078540829737719763 ...
                0.0040374115839548 0 -0.0036365506713397764 -0.0063716582505391091 ...
                -0.0078893031903380026 -0.00808739941083554 -0.0070718134335119327 ...
                -0.0051193984472911441 -0.0026187539064786284 0 0.0023345651421505286 ...
                0.0040683784677133959 0.0050093785155702775 0.0051056581078908472 ...
                0.00443802591741113 0.0031930796109812462 0.0016230413454147042 ...
                0 -0.0014277474612946694 -0.00247072865220911 -0.0030202428411423995 ...
                -0.0030553081816828832 -0.0026352624613329868 -0.0018808492888220838 ...
                -0.00094810607847870226 0 0.00081947197501865956 0.0014049583413437243 ...
                0.0017008871462745852 0.0017033853517477954 0.0014538625812232689 ...
                0.0010263594832950844 0.00051149159396842369 0 -0.00043141174353976327 ...
                -0.00073000105198961778 -0.00087166788797456607 -0.00086038268936497941 ...
                -0.00072320914773199184 -0.00050237406876756942 -0.00024611644953130535 ...
                0 0.00019995023815725909 0.00033143343994865174 0.00038710567399410266 ...
                0.00037312606030348193 0.00030569884691874328 0.00020653032645552219 ...
                9.8160915307191784E-5 0 -7.4366825754989437E-5 -0.00011834743116057382 ...
                -0.00013205270976779482 -0.00012086163085409433 -9.3312161185059878E-5 ...
                -5.8831821680514759E-5 -2.5762581491757149E-5];

%----------------------------------------------------------------------------
% Generate a synthetic waveform with LTE Toolbox
%----------------------------------------------------------------------------

function [waveform, rmccfg] = generateDLRXWaveform(Fs,RC,NCellID,DelayProfile,DopplerFreq,SNRdB,numSubframes,cellRefp)
    %   waveform is the complex output waveform, sampled at fs Hz.
    %   rmccfg is the reference measurement channel configuration used to generate the waveform.
    %   RC           = {'R.6' 'R.9' 'R.10' 'R.12'};
    %   DelayProfile = {'Off' 'EPA' 'EVA' 'ETU'};
    %   DopplerFreq  = {0.0 5.0 70.0};
    %   SNRdB        = {-1.0 10.0};
    %   numSubframs  = Number of subframes to generate.
    %   cellRefp     = Number of cell reference ports, 1 or 2.
    
    rng(0);
    
    %configuration from test parameters
    
    rmcOverride.NCellID      = NCellID;
    rmcOverride.RC           = RC;
    rmcOverride.DuplexMode   = 'FDD';
    rmcOverride.CyclicPrefix = 'Normal';
    if exist('numSubframes','var')
        rmcOverride.TotSubframes = numSubframes;
    else
        rmcOverride.TotSubframes = 50;
    end
    
    rmcOverride.PDSCH.RNTI = 61;
    % SIB parameters
    rmcOverride.SIB.Enable         = 'On';
    rmcOverride.SIB.DCIFormat      = 'Format1A';
    rmcOverride.SIB.AllocationType = 0;
    rmcOverride.SIB.VRBStart       = 8;
    rmcOverride.SIB.VRBLength      = 8;
    rmcOverride.SIB.Gap            = 0;
    % SIB data field filled with random bits, this is not a valid SIB
    % message
    rmcOverride.SIB.Data = randi([0 1],176,1);
    
    channel.DelayProfile = DelayProfile;
    channel.DopplerFreq  = DopplerFreq;
    
    SNR = 10^(SNRdB/20);
    
    % additional configuration
    
    rmccfg = lteRMCDL(rmcOverride);
    
    % check if cellRefp is passed as an input argument
    if exist('cellRefp','var')
        rmccfg.CellRefP = cellRefp;
    else
        rmccfg.CellRefP =1;
    end
    
    if (rmccfg.CellRefP==1)
        rmccfg.PDSCH.TxScheme = 'Port0';
    else
        rmccfg.PDSCH.TxScheme = 'TxDiversity';
    end
    
    channel.NRxAnts            = 1;
    channel.Seed               = 1;
    channel.MIMOCorrelation    = 'Low';
    channel.NormalizeTxAnts    = 'On';
    channel.InitPhase          = 'Random';
    channel.ModelType          = 'GMEDS';
    channel.NTerms             = 16;
    channel.NormalizePathGains = 'On';
    
    % stimulus generation
    
    data        = randi([0 1],100,1);
    [tx,~,info] = lteRMCDLTool(rmccfg,data);
    
    txu = resample(tx,Fs,info.SamplingRate);
    
    channel.SamplingRate = Fs;
    channel.InitTime     = 0.0;
    signal               = lteFadingChannel(channel,txu);
    
    % compensate for instantaneous channel gain due to fading,
    % otherwise the SNR could be different and hence unfair
    % (the noise setup below is designed to give the correct SNR
    % when averaging over the long term fading).
    gain   = mean(var(signal))/mean(var(tx));
    signal = signal / gain;
    
    N0    = 1/(sqrt(2.0*rmccfg.CellRefP*double(info.Nfft))*SNR);
    noise = N0*complex(randn(size(signal)),randn(size(signal)));
    
    waveform = signal + noise;
    
end

function filt = designFrontEndFIRDecim()
    % Design the front end decimating FIR filter for resampling from
    % 61.44 MHz down to 30.72 MHz on the HSP.
    
    %   Retain 20 MHz out of 30.72 MHz.
    
    M   = 2;         % Decimation factor
    Fp  = 20e6/2;    % Passband-edge frequency
    Fst = 30.72e6/2; % Stopband-edge frequency
    Ap  = 0.1;       % Passband peak-to-peak ripple
    Ast = 60;        % Minimum stopband attenuation
    Fs  = 61.44e6;   % Sampling frequency
    
    fdDecim = fdesign.decimator(M,'lowpass',Fp,Fst,Ap,Ast,Fs);
    filt    = design(fdDecim,'equiripple', 'SystemObject', true);
    
end


function filt = designFrontEndFIRDecim2()
    % Design the front end decimating FIR filter for resampling from
    % 61.44 MHz down to 1.92 MHz on the HSP.
    
    M   = 4;         % Decimation factor
    Fp  = 0.768e6;   % Passband-edge frequency
    Fst = 0.96e6;    % Stopband-edge frequency
    Ap  = 0.1;       % Passband peak-to-peak ripple
    Ast = 60;        % Minimum stopband attenuation
    Fs  = 7.68e6;    % Sampling frequency
    
    fdDecim = fdesign.decimator(M,'lowpass',Fp,Fst,Ap,Ast,Fs);
    filt    = design(fdDecim,'equiripple', 'SystemObject', true);
    
end

