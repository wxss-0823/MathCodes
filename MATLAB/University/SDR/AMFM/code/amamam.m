clear;clc
load amdata0.mat
Fs=10e6;  %采样频率10MHz
N=1e6;    %采样点数?
n=0:N-1;t=n/Fs;  %时间序列0.1s
f=n*Fs/N;  %频率

%补充AM解调与画图
xn = sqrt(idata.*idata+qdata.*qdata)-0.5;
xnf = abs(fft(xn));
figure;
subplot(2,1,1);plot(t,xn);
subplot(2,1,2);plot(f,xnf);set(gca,'XLim',[0,400]);
