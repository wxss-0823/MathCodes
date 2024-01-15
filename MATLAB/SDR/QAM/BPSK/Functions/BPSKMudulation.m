function modulated_signal = BPSKMudulation(input,sys_param)

% ��ȡ���ݳ���
len = length(input);
% һ�����صĳ���(����)
symbol_len = sys_param.sample_freq/sys_param.symbol_rate;
% ��ʼ��
modulated_signal = [];
% ��ɢʱ���
t_i = 1:symbol_len;
% ��÷��ű��
for k = 1:len
    if input(k) == 1
        bit_representation =  cos(2*pi*sys_param.carrier_freq/sys_param.sample_freq*t_i);
    end
    if input(k) == 0
        bit_representation = -cos(2*pi*sys_param.carrier_freq/sys_param.sample_freq*t_i);
    end
    modulated_signal = [modulated_signal bit_representation];
end
    
%modulated_signal = LowPassFilter(modulated_signal,1/sys_param.sampling_interval/2,sys_param.band);
% ��ֹƵ�ʱ���

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


