 %LTE_Wfm2 = load('IQ_6RB_QPSK_CellID11.mat');
 LTE_Wfm_5M = load('IQ_6RB_QPSK_CellID11.mat');

 fs = 7.68e6;
 
 %enable this for Sine Wfm
 %sw = dsp.SineWave;
 sw = LTE_Wfm_5M;
 txWaveform = sw();  
 
 tx = sdrtx('Pluto');
 %tx.CenterFrequency = 2.4e9;
 tx.CenterFrequency = 860e6;
 tx.BasebandSampleRate = fs;
 tx.Gain = -5;
 %transmitRepeat(tx,txWaveform.waveform);
 transmitRepeat(tx,txWaveform.waveStruct);

 %release(tx);
  