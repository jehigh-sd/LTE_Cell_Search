Sig = load('IQ_6RB_QPSK.mat')

sig_I = real(Sig.waveStruct.waveform);
sig_q = imag(Sig.waveStruct.waveform);
