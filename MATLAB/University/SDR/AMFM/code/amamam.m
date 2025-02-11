clear;clc
load amdata0.mat
Fs=10e6;  %����Ƶ��10MHz
N=1e6;    %��������?
n=0:N-1;t=n/Fs;  %ʱ������0.1s
f=n*Fs/N;  %Ƶ��

%����AM����뻭ͼ
xn = sqrt(idata.*idata+qdata.*qdata)-0.5;
xnf = abs(fft(xn));
figure;
subplot(2,1,1);plot(t,xn);
subplot(2,1,2);plot(f,xnf);set(gca,'XLim',[0,400]);
