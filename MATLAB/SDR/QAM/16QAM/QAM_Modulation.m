function modulated_signal = QAM_Modulation(input,sys_param)
%����������
n=length(input);
m=sys_param.sample_freq/sys_param.symbol_rate;% һ�����صĵ���
dt=1/sys_param.sample_freq; %����ʱ����
T=n/sys_param.symbol_rate;
t=0:dt:T-dt;
%I·
I=input(1:2:n-1);
%2-4��ƽת��
X=two2four(I,4*m);

%Q·
Q=input(2:2:n);
Y=two2four(Q,4*m);
% ���������˲�
rcos=firrcos(16,sys_param.symbol_rate/4,sys_param.symbol_rate/4,sys_param.sample_freq);
I=filter(rcos,1,X);
Q=filter(rcos,1,Y);

modulated_signal=I.*cos(2*pi*sys_param.carrier_freq*t)-Q.*sin(2*pi*sys_param.carrier_freq*t);


