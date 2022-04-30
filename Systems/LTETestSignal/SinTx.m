 fs = 1e6;
 sw = dsp.SineWave;
 %sw = LTE;
 sw.Amplitude = 0.5;
 sw.Frequency = 100e3;
 sw.ComplexOutput = true;
 sw.SampleRate = fs;
 sw.SamplesPerFrame = 5000;
 txWaveform = sw();  
 
 tx = sdrtx('Pluto');
 tx.CenterFrequency = 2.4e9;
 tx.BasebandSampleRate = fs;
 tx.Gain = -5;
 transmitRepeat(tx,txWaveform);
 
 %release(tx);
  
  