clear
close all

%%%%% ��������
%  ϵͳ��������
sys_param = SystemParaDef();
%  �����������
input_data = [0 1 0 0 1 0 1 1 0 0 1];
%input_data = [0 1 0 0 1 0 1 1 0 0 1 1 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0 1 0 1 1 0 1 0 1 0 0 1 0 1 1 0 0 1 1 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0];
%input_data = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%%%% �������
% ----------�źŷ���˲���
% �ŵ�����
% *******
% �źŵ���
modulated_signal = BPSKMudulation(input_data,sys_param);
% ��ͨ�˲�
% *******
% ��װ��֡�ṹ
% *******

% ----------�ŵ�����
% ����ŵ�����
SNR = 2;
SIGPOWER = 10;
noisy_signal = awgn(modulated_signal,SNR,SIGPOWER);

% ----------�źŽ��ն˲���
% �������������ʽ
% ���Q·�źŵĻ����ź� 
received_signal = QPhaseDemodulation(noisy_signal,sys_param);
% �������źŵ�ʱ��ͼ
figure()
PlotTDSignal(received_signal,sys_param.sample_freq,sys_param.symbol_rate);
title('�����źŵ�ʱ��ͼ');
figure()
PlotFFTSignal(received_signal,sys_param.sample_freq);
title('�����źŵ�Ƶ��ͼ');
% ����
decode_data = BPSKDecoder(received_signal,sys_param);

% ----------ͳ������
error_ratio = CalBitErrorRate(input_data,decode_data)


