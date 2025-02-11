function output_signal = QPhaseDemodulation(input_signal,sys_param)

% ��ȡ�����źŵĳ���
signal_len = length(input_signal);
t_i = 1:signal_len;
% ����Q·��ؽ���ź�cos(wt)
Q_t = cos(2*pi*sys_param.carrier_freq/sys_param.sample_freq*t_i);
 
% Q·�źŻ�Ƶ x(t)*cos(wt)
s_t = input_signal.*Q_t;

output_signal = LowPassFilter(s_t,2*sys_param.band/sys_param.sample_freq);
