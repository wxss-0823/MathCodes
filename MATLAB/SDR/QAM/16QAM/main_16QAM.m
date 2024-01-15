clear
close all
%% ϵͳ��������
sys_param = Parameter();
M=16;
k=log2(M);
% �����鶨��
m = [];
n = [];
% ����������
N=5*10e3;
% ����ı���������
input_data = randi([0,1],1,N);
%% �źŵ���
modulated_signal = QAM_Modulation(input_data,sys_param);
%% �����ź�ʱ���� ǰ300������
figure(1)
subplot(2,1,1);
PlotTDSignal(modulated_signal(1:300),sys_param.sample_freq,sys_param.symbol_rate);
title('�����ź�ʱ����(ǰ300������)');
% �����ź�Ƶ��
subplot(2,1,2);
PlotFFTSignal(modulated_signal,sys_param.sample_freq);
title('�����ź�Ƶ��');
%% ����ŵ�����
for j=1:20
signal_noise = awgn(modulated_signal,sys_param.SNR(j));
% ����������ɽ����ʽ
[decode_data,I,Q] = QAM_Demodulation(signal_noise,sys_param);
% ����������
error_ratio(j) = CalBitErrorRate(input_data,decode_data);
m = [m;I];
n = [n;Q];
end
figure
plot(sys_param.SNR,error_ratio,'.-k');hold on;grid on;
xlabel('SNR/dB');
ylabel('������');
title('AWGN�ŵ��µ�������');
%% ����ͼ
figure
k = 1;
for i = 1:5:20
subplot(2,2,k)
plot(m(i,:),n(i,:),'.');
title(['�����Ϊ',num2str(i),'������ͼ']);
k=k+1;
end
%% �����ź�ͼ��
figure
subplot(2,1,1);
stem(input_data(1:50));
title('ԭʼ���͵Ķ������ź�');
subplot(2,1,2);
stem(decode_data(1:50));
title('����(���)�Ķ������ź�');