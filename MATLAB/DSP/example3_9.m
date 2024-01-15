%信号的FFT分析
N=21;
L=256;
f1=150;f2=100;fs=400;
T=1/fs;ws=2*pi*fs;
n=0:N-1;
x=0.12*cos(2*pi*f1*n*T)+cos(2*pi*f2*n*T);
wh=(boxcar(N))';
x=x.*wh;
Xb=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
figure(1)
subplot(2,1,1);plot(w,abs(Xb));axis([-200 200 0 20]);
ylabel('幅度谱');xlabel('频率(Hz) 矩形窗 N=21');
%
wh=(hamming(N))';
x=x.*wh;
Xh=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
figure(1)
subplot(2,1,2);plot(w,abs(Xh));axis([-200 200 0 20]);
ylabel('幅度谱');xlabel('频率(Hz) 哈明窗 N=21');
%
N=51;
n=0:N-1;
x=0.12*cos(2*pi*f1*n*T)+cos(2*pi*f2*n*T);
wh=(boxcar(N))';
x=x.*wh;
Xb=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
figure(2)
subplot(2,1,1);plot(w,abs(Xb));axis([-200 200 0 25]);
ylabel('幅度谱');xlabel('频率(Hz) 矩形窗 N=51');
%
wh=(hamming(N))';
x=x.*wh;
Xh=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
figure(2)
subplot(2,1,2);plot(w,abs(Xh));axis([-200 200 0 25]);
ylabel('幅度谱');xlabel('频率(Hz) 哈明窗 N=51');