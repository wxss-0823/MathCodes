clear;clc
load amdata.mat
Fs = 125e3;          %����Ƶ��
N=length(idata);     %������
n=0:N-1;
t=n/Fs;              %ʱ������
f=n*Fs/N;            %Ƶ��

%����AM�������
xn = sqrt(idata.*idata+qdata.*qdata)-0.45;
xnf = abs(fft(xn));
figure;
subplot(2,1,1);plot(t,xn);
subplot(2,1,2);plot(f,xnf);set(gca,'XLim',[0 1000]);
audiowrite('iqam.wav',xn,Fs);