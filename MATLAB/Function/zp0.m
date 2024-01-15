function [ H ] = zp0( signal )
%对称零极点向量的传递函数
[fft_max,N_max]=max(abs(signal));
r=0.1;
N=length(signal);
w=2*pi*(0:N-1)/N;
w_max=2*pi*N_max/N;
z1=(1-exp(i*w_max)*exp((-i)*w));            p1=1./(1-r*exp(i*w_max)*exp((-i)*w));
z2=(1-exp(i*(2*pi-w_max))*exp((-i)*w));     p2=1./(1-r*exp(i*(2*pi-w_max))*exp((-i)*w));
H=(((z1.*p1).*z2).*p2)';
end

