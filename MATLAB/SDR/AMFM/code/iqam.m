clear;clc
load amdata.mat
Fs = 125e3;          %采样频率
N=length(idata);     %采样点
n=0:N-1;
t=n/Fs;              %时间序列
f=n*Fs/N;            %频率

%补充AM解调部分
xn = sqrt(idata.*idata+qdata.*qdata)-0.45;
xnf = abs(fft(xn));
figure;
subplot(2,1,1);plot(t,xn);
subplot(2,1,2);plot(f,xnf);set(gca,'XLim',[0 1000]);
audiowrite('iqam.wav',xn,Fs);