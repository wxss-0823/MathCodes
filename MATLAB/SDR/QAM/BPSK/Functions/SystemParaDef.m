function sys_param = SystemParaDef()

%%ϵͳ���������sys_param

% ��Ƶ�źŵ�����Ƶ��
sys_param.center_freq  = 2.4e9;
% �ź���������ĵ��ز�Ƶ��
sys_param.carrier_freq = 200e3;
% �źű�������
sys_param.symbol_rate = 100e3;


% �����źŲ���Ƶ��
sys_param.sample_freq = 800e3;
% �źŷ��ʹ���
sys_param.band = 150e3;

% ����������(dB)
sys_param.SNR = 20;

% һ�����ص�ʱ�䳤��
sys_param.bit_duration = 1/sys_param.symbol_rate;
% ����ʱ����
sys_param.sampling_interval = 1/sys_param.sample_freq;


