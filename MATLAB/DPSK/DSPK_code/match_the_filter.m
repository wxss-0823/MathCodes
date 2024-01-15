clear all,clc;
%基本变量的申请
fs = 2000 * 100000;   %采样的频率
Ts = 1/fs;   %采样周期
N = 2000;  %采样点数
t = (-N:N)*Ts;    %时间向量
T = 0.00001;   %信号周期

%创建一个LFM信号，
syms S_a S_b real; %申请两个实数变量,a为实部,b为虚部
S_a = 1;            %设置幅度
S_b = 1;
B = 40 * 1000000;
k = B/T;
S_amplitude = 1;  %信号s的幅值
L=length(t);

for ii=1:L
if abs(t(ii)) < T/2 
    S_signal(ii) = exp(1j * pi * k * t(ii)* t(ii));  %创建一个指数信号 
else 
    S_signal(ii) = 0;
end
end

%创建一个高斯白噪声信号 
noise = awgn(S_signal,10);

%创建冲击相应
K = 1;
t0 = 0;
h = conj(S_signal);       %因为载波频率是0，所以这里取共轭

%经过傅里叶变化
N1 = L; %采样点
y = fftshift(fft(noise));
x = fftshift(fft(S_signal));%对原信号进行fft

ff = 0:fs/(L-1):fs;
ff = ff-fs/2;
            
%经过系统的输出信号
Sout = conv(noise,h,'same');
%Sout = Sout/max(Sout);
SoutFFT = fftshift(fft(Sout));

%***************************************%
%下面是画图操作

%LFM信号的幅度谱
figure(1);subplot(1,1,1);plot(ff,abs(x));
title('LFM信号的频谱');
xlabel('w/hz');
ylabel('幅度');


%LFM信号的图
%实数部分
figure(2);subplot(2,1,1);plot(t,real(S_signal));
title('LFM信号real part');
xlabel('t/s');
ylabel('幅度');   
axis([-1/100000/2 1/100000/2 -1.2 1.2]);
%虚数部分
subplot(2,1,2);plot(t,imag(S_signal));
title('LFM信号imainary part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);

%+噪声后输出信号的波形
%实数部分
figure(3);subplot(2,1,1);plot(t,real(noise));
title('LFM信号+高斯高斯白噪声信号real part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -1.5 1.5]);
%虚数部分
subplot(2,1,2);plot(t,imag(noise));
title('LFM信号+高斯高斯白噪声信号imaginary part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -1.5 1.5]);

%频谱图
figure(4);subplot(1,1,1);
plot(ff,abs(y));
title('LFM信号+噪声后频谱图');
xlabel('w/hz');
ylabel('幅度');

%冲激响应的波形
%实数部分
figure(5);subplot(2,1,1);plot(t,real(h));
title('h(t)real part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);
%虚数部分
subplot(2,1,2);plot(t,imag(h));
title('h(t)imaginary part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);

%过系统后输出信号的波形
%实数部分
figure(6);subplot(2,1,1);plot(t,real(Sout));
title('Sout real part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -150 150]);
%虚数部分
subplot(2,1,2);plot(t,imag(Sout));
title('Sout imaginary part');
xlabel('t/s');
ylabel('幅度');
axis([-1/100000/2 1/100000/2 -120 120]);

%频谱
figure(7);subplot(1,1,1);
plot(ff,abs(SoutFFT));
title('经过匹配滤波器后的频谱');
xlabel('w/hz');
ylabel('幅度');
