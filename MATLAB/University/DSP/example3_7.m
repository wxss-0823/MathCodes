%计算x(n)的FFT
N=32;fs=100;T=1/fs;
n=0:N-1;r=n*T;x=r.*exp(r);
X=fft(x,N);
magX=abs(X),phaX=angle(X)
subplot(3,1,1);stem(n,x);axis([0 32 0 1]);
xlabel('n');title('序列x(n)');
k=0:N-1;
subplot(3,1,2);stem(k,magX);axis([0 32 0 8]);
xlabel('k');ylabel('DFT的幅度');
subplot(3,1,3);stem(k,phaX);axis([0 32 -4 4]);
xlabel('k');ylabel('DFT的相位');