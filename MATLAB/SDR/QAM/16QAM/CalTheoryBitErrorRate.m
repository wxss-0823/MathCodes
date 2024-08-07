function BER = CalTheoryBitErrorRate(SNR, M)
%16QAM理论误码率
p = 2*(1-1/sqrt(M))*erfc(sqrt(3*SNR/(M-1)));
ser_theory=1-(1-p).^2;
BER = 1/log2(M)*ser_theory;
