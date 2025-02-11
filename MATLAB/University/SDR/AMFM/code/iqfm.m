clear;clc
load fmdata.mat
Fs=125e3;          %采样频率
N=length(idata);     %采样点?
n=0:N-1;
t=n/Fs;              %时间序列
f=n*Fs/N;            %频率
%补充FM解调部分
%% 传统正交解调法
for k = 2 : N
   % xn_1(k) =2 * (qdata(k-1)/idata(k) - (qdata(k)*idata(k-1))/idata(k)^2)/(qdata(k)^2/idata(k)^2 + 1);
   xn_1(k) = atan(qdata(k)/idata(k))-atan(qdata(k-1)/idata(k-1));
end 
xn1 = filter(LP44100_Fs125e3,xn_1);
xn1f = abs(fft(xn1));
figure(1)
subplot(2,1,1);plot(t,xn1);set(gca,'YLim',[-0.4 0.4]);
subplot(2,1,2);plot(f,xn1f);set(gca,'XLim',[0 1000]);
audiowrite('iqfm1.wav',xn1,Fs);
%% 改进的正交解调法
for k = 2 : N
   xn_2(1) = 0;
   xn_2(k) = 2*(idata(k-1)*qdata(k)-idata(k)*qdata(k-1))/(idata(k)^2+qdata(k)^2);
end 
xn2 = filter(LP44100_Fs125e3,xn_2);
xn2f = abs(fft(xn2));
figure(2)
subplot(2,1,1);plot(t,xn2);set(gca,'YLim',[-0.4 0.4]);
subplot(2,1,2);plot(f,xn2f);set(gca,'XLim',[0 1000]);
audiowrite('iqfm2.wav',xn2,Fs);
%% 小角度近似解调法
for k = 2 : N
    xn_1(1) = 0;
    xn_3(k) =6 * (qdata(k)*idata(k-1) - idata(k)*qdata(k-1));
end
xn3 = filter(LP44100_Fs125e3,xn_3);
xn3f = abs(fft(xn3));
figure(3)
subplot(2,1,1);plot(t,xn3);
subplot(2,1,2);plot(f,xn3f);set(gca,'XLim',[0 1000]);
audiowrite('iqfm3.wav',xn3,Fs);