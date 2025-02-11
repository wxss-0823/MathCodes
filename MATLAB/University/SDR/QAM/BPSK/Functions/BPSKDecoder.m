function decode_data = BPSKDecoder(x,sys_param)


% ����BPSK��������
% ���ݳ���
data_len = length(x);
% �������ı�������
bit_num = floor(data_len/sys_param.sample_freq*sys_param.symbol_rate);
% һ�����صĲ���������
bit_interval_num = floor(sys_param.sample_freq/sys_param.symbol_rate);
% ��ʼ��
decode_data = zeros(1,bit_num);

for k = 1:bit_num
    % ��k�����صĲ�����
    sample_points = x([1+(k-1)*bit_interval_num:k*bit_interval_num-1]);
    % ȥ�������ƽ��ֵ
    average_value = mean(sample_points);
    % �������0��Ϊ1,���С��0��Ϊ0
    if average_value > 0
        decode_data(k) = 1;
    end
    if average_value < 0
        decode_data(k) = 0;
    end
    
end