%(1)
n=0:10;L=256;N=11;
f1=0.235;f2=0.265;fs=0.6;
T=1/fs;ws=2*pi*fs;
x=cos(0.47*pi*n)+cos(0.53*pi*n);
X=fftshift(fft(x,L));
figure(1)
subplot(2,1,1);stem(n,x);
ylabel('x(n)');xlabel('n');axis([0 10 0 2]);
%y=dft(x,N);
%subplot(3,1,2);stem(n,abs(y));
%ylabel('DFT·ù¶ÈÆ×');xlabel('n');axis([0 10 0 10]);
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(2,1,2);plot(w,abs(X));
ylabel('FFT·ù¶ÈÆ×');xlabel('ÆµÂÊ(Hz)');axis([-0.3 0.3 0 12]);
%(2)
N=90;
x=[x zeros(1,N-length(x))];
figure(2)
n=0:89;
subplot(2,1,1);stem(n,x);
ylabel('x(n)');xlabel('n');axis([0 90 0 2]);
X=fftshift(fft(x,L));
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(2,1,2);plot(w,abs(X));
ylabel('FFT·ù¶ÈÆ×');xlabel('ÆµÂÊ(Hz)');axis([-0.3 0.3 0 12]);
%(3)
n=0:499;L=256;N=500;
f1=0.235;f2=0.265;fs=0.6;
T=1/fs;ws=2*pi*fs;
x=cos(0.47*pi*n)+cos(0.53*pi*n);
X=fftshift(fft(x,L));
figure(3)
subplot(2,1,1);stem(n,x);
ylabel('x(n)');xlabel('n');axis([0 10 0 2]);
%y=dft(x,N);
%subplot(3,1,2);stem(n,abs(y));
%ylabel('DFT·ù¶ÈÆ×');xlabel('n');axis([0 500 0 10]);
w=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(2,1,2);plot(w,abs(X));
ylabel('FFT·ù¶ÈÆ×');xlabel('ÆµÂÊ(Hz)');axis([-0.3 0.3 0 130]);






