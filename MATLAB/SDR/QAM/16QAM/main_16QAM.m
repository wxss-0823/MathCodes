clear
close all
%% ϵͳ��������
sys_param = Parameter();
M=16;
k=log2(M);
% �����鶨��
m = [];
n = [];
output_data = [];
origin_output = [];
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
error_ratio = zeros(1,length(sys_param.SNR));
theory_ber = zeros(1,length(sys_param.SNR));
for j=1:20
signal_noise = awgn(modulated_signal,sys_param.SNR(j));
% ����������ɽ����ʽ
[decode_data,I,Q] = QAM_Demodulation(signal_noise,sys_param);
% ����������
error_ratio(j) = CalBitErrorRate(input_data,decode_data);
% ��������������
theory_ber(j) = CalTheoryBitErrorRate(sys_param.SNR(j), M);
m = [m;I];
n = [n;Q];
output_data = [output_data;decode_data];
origin_output = [I;Q];
end
% ��ͼ
figure
plot(sys_param.SNR,error_ratio,'.-k');hold on;grid on;
plot(sys_param.SNR,theory_ber,'.-r');grid on;
xlabel('SNR/dB');
ylabel('������');
legend("real ber","theory ber");
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
%% ��ͼ
% ���������������ͼ
short_input_data = input_data(1 : 1000);
figure
subplot(3,1,1)
for k = 1:length(short_input_data)/log2(M)
    hold on
    plot(1:log2(M), short_input_data(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("��Ԫ������");
ylabel("��Ԫ����");
title("�����������ͼ");
legend("Input Data Eyediagram");
% ���������������ͼ
short_output_data = output_data(1, 1 : 1000);
subplot(3,1,2)
for k = 1:length(short_output_data)/log2(M)
    hold on
    plot(1:log2(M), short_output_data(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("��Ԫ������");
ylabel("��Ԫ����");
title("�����������ͼ");
legend("Output Data Eyediagram");
% ����δ���о��������Ԫ��ͼ
short_origin_output = origin_output(1, 1 : 1000);
subplot(3,1,3)
for k = 1:length(short_origin_output)/log2(M)
    hold on
    plot(1:log2(M), short_origin_output(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("��Ԫ������");
ylabel("��Ԫ����");
title("�����Ԫ����ͼ");
legend("Output Data Eyediagram");
%% �����ź�ͼ��
figure
subplot(2,1,1);
stem(input_data(1:50));
title('ԭʼ���͵Ķ������ź�');
subplot(2,1,2);
stem(decode_data(1:50));
title('����(���)�Ķ������ź�');