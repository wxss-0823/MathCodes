%% 参数定义
C=3e8;
f0=9e9;  
df=2e6;
N=512;
tao=0.25e-6;
Tr=10e-6;
R0=2000;
v=1800;
SNR=10;%db
m=1;%帧间间隔
%% 两帧距离像以及互相关算法
s0=zeros(1,N);
sm=zeros(1,N);
for i=1:1:N
    s0(i)=s0(i)+exp(-1i*2*pi*(f0+i*df)*2*(R0-i*v*Tr)/C);
    sm(i)=sm(i)+exp(-1i*2*pi*(f0+i*df)*2*(R0-(i+m*N)*v*Tr)/C);
end
%添加噪声
s0=awgn(s0,SNR);
sm=awgn(sm,SNR);
%距离像y0、ym
figure(1)
y0=ifft(s0);
ym=ifft(sm);
plot(abs(y0),"-*r");
ylabel('幅度');
hold on;
plot(abs(ym),"b");
title('两帧距离像（未进行粗补偿）');
legend('第一帧','第二帧');
saveas(gcf,'Range Profile1.emf');
%距离像互相关算法
Rom=ifft(conj(sm).*s0);
figure(2)
plot(N:-1:1,abs(Rom/max(Rom)),"-*b");
ylim([0 1.4]);
title('两帧距离像互相关结果（未进行粗补偿）');
saveas(gcf,'Interdependent1.emf');
%获取最大速度对应的k0值
[kmax,k0]=max(Rom);
%% 二次相位粗补偿
%用测量的速度v0对目标进行二次相位粗补偿
v0=(k0*C)/(2*m*(N^2)*Tr*df);
dv=C/(4*m*(N^2)*Tr*df);
s01=zeros(1,N);
sm1=zeros(1,N);
for i=1:1:N
    % s01(i)=s0(i)+s0(i)*exp(-1i*2*pi*i*df*(2*v0*i*Tr/C));
    % sm1(i)=sm(i)+sm(i)*exp(-1i*2*pi*i*df*(2*v0*i*Tr/C));
    s01(i)=s01(i)+exp(-1i*2*pi*(f0+i*df)*2*(R0-i*v*Tr)/C)*exp(-1i*2*pi*i*df*(2*v0*i*Tr/C));
    sm1(i)=sm1(i)+exp(-1i*2*pi*(f0+i*df)*2*(R0-(i+m*N)*v*Tr)/C)*exp(-1i*2*pi*i*df*(2*v0*i*Tr/C));
end
%添加噪声
s01=awgn(s01,SNR);
sm1=awgn(sm1,SNR);
%距离像y01、ym1
figure(3)
y01=ifft(s01);
ym1=ifft(sm1);
plot(abs(y01),"-*r");
ylabel('幅度');
hold on;
plot(abs(ym1),"b");
title('两帧距离像（粗补偿）');
legend('第一帧','第二帧');
saveas(gcf,'Range Profile3.emf');
%距离像互相关算法
Rom1=ifft(conj(sm1).*s01);
figure(4)
plot(N:-1:1,abs(Rom1/max(Rom1)),"-*b");
ylim([0 1.4]);
title('两帧距离像互相关结果（粗补偿）');
saveas(gcf,'Interdependent2.emf');