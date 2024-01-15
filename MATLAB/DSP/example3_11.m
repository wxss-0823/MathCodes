%利用FFT实现线性滤波
%计算系统的冲激响应
b=[0.0181,0.0543,0.0543,0.0181];
a=[1,-1.7600,1.1829,-0.2781];
ch=impseq(0,0,20);n=0:20;
h=filter(b,a,ch)
%输入信号序列
x=cos(0.1*pi*n)+0.32*randn(size(n));
%计算线性卷积
L=length(x)+length(h)-1;
H=fft(h,L);
X=fft(x,L);
y=ifft(X.*H);
%画图
subplot(3,1,1);plot(n,x);axis([0 20 -1.5 1.5]);
ylabel('信号X(n)');xlabel('n');
subplot(3,1,2);stem(n,h);axis([0 20 -0.5 0.5]);
ylabel('系统冲激响应h(n)');xlabel('n');
n=0:L-1;
subplot(3,1,3);plot(n,y);axis([0 20 -1.5 1.5]);
ylabel('x(n)滤波的结果y(n)');xlabel('n');