clear

close all

clc

C=3e8;PI=3.1415926;

%参数定义：脉宽

Fc=5.321e9;B=400e6;

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

Tp=5e-9;

%脉冲周期

% Tw=Tp;

% 脉宽

Ts=1/B;

%采样频率

Nfft=2048;

for k=1:1:4

R=8500;

%目标位置坐标

Sigma=[1 1.5 2.25 3.375];

%目标散射系数

v=[0 100 500 1500];

%目标相对移动速度
%%

NV=length(v);

St=zeros(1,Nf);

tt=2*R/C;

for i=1:Nf

   St(i)=St(i)+Sigma(k)*exp(-1i*2*PI*(Fc+i*Deltaf)*tt)*exp(1i*4*PI*Fc*v(k)*i*i*Tp/C);

end
%%

St=[St,zeros(1,Nfft-Nf)];

Z=ifft(St);

ZZ=abs(Z);

max(ZZ);

ZZ=ZZ/0.1464;

Z0=20*log10(ZZ);

XX=circshift(ZZ,750);

%%

Ru=C/2/Deltaf;

Dx=Ru/Nfft;

X=0:Dx:Ru-Dx;

plot(XX);

xlabel('相对距离/m')

ylabel('功率谱/w')

title('二次相位的影响')

hold on;


end
    
legend('v=0','v=100','v=500','v=1500');

saveas(gcf,'Second Phase.emf')