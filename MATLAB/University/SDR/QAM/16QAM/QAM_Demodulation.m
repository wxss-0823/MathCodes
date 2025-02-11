function [signal,In,Qn] = QAM_Demodulation(input_data,sys_param)

N=length(input_data);
dt=1/sys_param.sample_freq; %�������
t=0:dt:(N-1)*dt;
m=4*sys_param.sample_freq/sys_param.symbol_rate;
n=N/m;

I_noise=input_data.*cos(2*pi*sys_param.carrier_freq*t);
Q_noise=input_data.*sin(2*pi*sys_param.carrier_freq*t);

%��ͨ�˲�
[b,a]=butter(2,2*sys_param.symbol_rate/sys_param.sample_freq); %��ư�����˹�˲���
I=filtfilt(b,a,I_noise);
Q=filtfilt(b,a,Q_noise);


%��ʱ��ȡ
nn=(0.6:1:n)*m;
nn=fix(nn);%ȡ��
In=2*I(nn);
Qn=2*Q(nn);

%4-2��ƽת��
I_bin=four2two(In);
Q_bin=four2two(Qn);
xn=[I_bin;Q_bin];
xn=xn(:);

signal=xn';
end