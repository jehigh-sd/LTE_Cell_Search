 load('eNodeBWaveform');
 
 fs = 7.68e6;
 
 tx = sdrtx('Pluto');
 tx.CenterFrequency = 800e6;
 tx.BasebandSampleRate = fs;
 tx.Gain = -5;
 transmitRepeat(tx,rxWaveform);
 
 
 %To stop the transmission from Pluto, run below command.
 %release(tx);
