function sampled_signal = ReceiverSampling(orignal_signal,sys_param)

% �����ı���(ÿ���sampling_ratio�������һ��)
sampling_ratio = sys_param.sim_freq/sys_param.sample_freq;

% ���ݵ��ܵ���
data_len = length(orignal_signal);
%������ĵ���
sampled_len = floor(data_len/sampling_ratio);
% �������
sample_location = 1 + 0:sampling_ratio:sampling_ratio*(sampled_len-1);
% ����
sampled_signal = orignal_signal(sample_location);
