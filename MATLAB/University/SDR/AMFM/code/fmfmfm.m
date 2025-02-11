clear;clc
load fmdata0.mat
Fs=10e6;  %采样频率
N=1e6;    %采样点
n=0:N-1;t=n/Fs;  %时间序列
f=n*Fs/N;  %频率
%补充FM解调部分
%% 传统正交解调法
for k = 2 : N
   xn1(k) = atan(qdata(k)/idata(k))-atan(qdata(k-1)/idata(k-1));
end 
xn1f = abs(fft(xn1));
figure(1)
subplot(2,1,1);plot(t,xn1);
subplot(2,1,2);plot(f,xn1f);set(gca,'XLim',[0 1000]);
%% 改进的正交解调法
for k = 2 : N
   xn2(k) =(qdata(k)/idata(k)-qdata(k-1)/idata(k-1))/(1+qdata(k)*qdata(k)/idata(k)/idata(k));
end 
xn2f = abs(fft(xn2));
figure(2)
subplot(2,1,1);plot(t,xn2);
subplot(2,1,2);plot(f,xn2f);set(gca,'XLim',[0 1000]);
%% 小角度近似解调法
for k = 2 : N
    xn3(k) =5 * (qdata(k)*idata(k-1) - idata(k)*qdata(k-1));
end
xn3f = abs(fft(xn3));
figure(3)
subplot(2,1,1);plot(t,xn3);
subplot(2,1,2);plot(f,xn3f);set(gca,'XLim',[0 1000]);