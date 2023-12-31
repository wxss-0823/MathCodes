%信号的FFT分析
N=21;L=256;
f1=120;f2=140;fs=400;
T=1/fs;ws=2*pi*fs;
n=0:N-1;
x=cos(2*pi*f1*n*T)+cos(2*pi*f2*n*T);
X=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(2,1,1);plot(w,abs(X));
ylabel('幅度谱');xlabel('频率(Hz)  N=21');axis([-200 200 0 15]);
%N=11
N=11;n=0:N-1;
x=cos(2*pi*f1*n*T)+cos(2*pi*f2*n*T);
x=cos(2*pi*f1*n*T)+cos(2*pi*f2*n*T);
X=fftshift(fft(x,L));
subplot(2,1,2);plot(w,abs(X));
ylabel('幅度谱');xlabel('频率(Hz)  N=11');axis([-200 200 0 15]);