function PlotFFTSignal(x,sampling_freq)

% ����FFT�任���ͼ��
% ���ݵĳ���
data_len = length(x);
% FFT�任���Ƶ��
fft_x = abs(fft(x));
% Ƶ���źŰ��Ƶ�ϰ�ߵķ�ʽ
fre_x = fftshift(fft_x);

% Ƶ�ʷ�Χ�����ֵ�������ο�˹�ز������������������Ƶ�ʵ�2����
max_fre = sampling_freq/2;

% Ƶ��Χ
plotscope = linspace(-max_fre,max_fre,data_len);

% ��ͼ
plot(plotscope,fre_x,'Linewidth',1.5);