clear

close all

clc

C=3e8;PI=3.1415926;

%参数定义：脉宽

Fc=5.321e9;B=3e6;

%载频

%%

%%-----------------------------------------------------------%%

%%----修改步进数目Nf，以得到不同频率步进值下的仿真效果---------%%

%%-----------------------------------------------------------%%

Nf=512;

%%

Deltaf=B/(Nf-1);

% Rn=500;Rf=5000; RM=2000;

%处理窗口范围

% Tp=2*RM/C;

Tp=1e-5;

%脉冲周期

% Tw=Tp;

% 脉宽

Ts=1/B;

%采样频率

Nfft=2048;

for k=1:1:3

R=8500;

%目标位置坐标

Sigma=[1 1.5 2.25 3.375];

%目标散射系数

v=[0 100 800];

%目标相对移动速度
%%

NV=length(v);

St=zeros(1,Nfft);

tt=2*R/C;

for i=1:Nf

   St(i)=St(i)+Sigma(k)*exp(-1i*2*PI*(Fc+i*Deltaf)*tt)*exp(1i*4*PI*Fc*v(k)*i*Tp/C);

end
%%

Z=ifft(St);

ZZ=abs(Z);

max(ZZ);

ZZ=ZZ/max(ZZ);

Z0=20*log10(ZZ);

XX=circshift(ZZ,0);

%%

plot(1:2:2*Nfft,XX);

xlabel('相对距离/m')

ylabel('功率谱/w')

title('一次相位的影响')

hold on;


end
    
legend('v=0','v=100','v=800');

saveas(gcf,'One Phase.emf');