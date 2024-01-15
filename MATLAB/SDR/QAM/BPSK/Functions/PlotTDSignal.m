function PlotTDSignal(x,sampling_freq,symbol_rate)

% �����źŵ�ʱ��ͼ��
% ���ݳ���
data_len = length(x);
% ʱ����
time_interval = 1/sampling_freq;
% ʱ��Χ
plotscope = 0:time_interval:(data_len-1)*time_interval;

% ��ͼ
plot(plotscope,x,'Linewidth',1.5);

% ���ؼ��
bit_interval = 1/symbol_rate;
% ��������
bit_num = floor(data_len/sampling_freq*symbol_rate);

for k = 1:bit_num
    hold on
    plot([k*bit_interval k*bit_interval],[min(x) max(x)],'--k','Linewidth',1.5);
end