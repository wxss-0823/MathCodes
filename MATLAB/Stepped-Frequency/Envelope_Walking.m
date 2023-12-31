clear

close all

clc

C=3e8;PI=3.1415926;

%参数定义：脉宽

B=3e6;

%载频

Fc=5.321e9;

%%

%%-----------------------------------------------------------%%

%%----修改步进数目Nf，以得到不同频率步进值下的仿真效果---------%%

%%-----------------------------------------------------------%%

Nf=256;

%%

Deltaf=B/(Nf-1);

% Rn=500;Rf=5000; RM=2000;

%处理窗口范围

Tp=1e-6;

%脉冲周期

% Tw=Tp;

%脉宽

Ts=1/B;

%采样频率

fs=3e9;

%采样点数

N=fs/B;

%总长度

Nfft=fs*Tp;

for k=1:1:3

R=1500;

%目标位置坐标

Sigma=[1 1.5 2.25 3.375];

%目标散射系数

v=[0 100 800];

%目标相对移动速度

%%

NV=length(v);

N1=fs/B;

N0=Nfft-N1;

tt=2*R/C;

signal=[ones(1,N1),zeros(1,N0)];

St=zeros(1,length(signal));

for i=1:Nf

    %脉冲包络走动

    deltai=2*R/(C*Ts)-2*i*v(k)/(C*Ts);

    St=St+circshift(signal,i*3*N-deltai);

end

%%

St=circshift(St,100);

plot(St);

xlabel('相对距离/m')

ylabel('幅度')

title('包络走动')

hold on;

end
    
legend('v=0','v=100','v=800');

saveas(gcf,'Envelope Walking.emf');

%% 加窗后的目标像

% Window=hamming(Nfft);
% 
% St=St.*Window';
% 
% Z=ifft(St);
% 
% ZZ=abs(Z);
% 
% max(ZZ);
% 
% ZZ=ZZ/max(ZZ);
% 
% Z0=20*log10(ZZ);
% 
% XX=circshift(ZZ,0);
