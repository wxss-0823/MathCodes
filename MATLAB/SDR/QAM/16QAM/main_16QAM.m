clear
close all
%% 系统参数定义
sys_param = Parameter();
M=16;
k=log2(M);
% 空数组定义
m = [];
n = [];
% 数据流长度
N=5*10e3;
% 输入的比特数据流
input_data = randi([0,1],1,N);
%% 信号调制
modulated_signal = QAM_Modulation(input_data,sys_param);
%% 调制信号时域波形 前300个比特
figure(1)
subplot(2,1,1);
PlotTDSignal(modulated_signal(1:300),sys_param.sample_freq,sys_param.symbol_rate);
title('调制信号时域波形(前300个比特)');
% 调制信号频谱
subplot(2,1,2);
PlotFFTSignal(modulated_signal,sys_param.sample_freq);
title('调制信号频谱');
%% 添加信道噪声
for j=1:20
signal_noise = awgn(modulated_signal,sys_param.SNR(j));
% 采用正交相干解调方式
[decode_data,I,Q] = QAM_Demodulation(signal_noise,sys_param);
% 误码率曲线
error_ratio(j) = CalBitErrorRate(input_data,decode_data);
m = [m;I];
n = [n;Q];
end
figure
plot(sys_param.SNR,error_ratio,'.-k');hold on;grid on;
xlabel('SNR/dB');
ylabel('误码率');
title('AWGN信道下的误码率');
%% 星座图
figure
k = 1;
for i = 1:5:20
subplot(2,2,k)
plot(m(i,:),n(i,:),'.');
title(['信噪比为',num2str(i),'的星座图']);
k=k+1;
end
%% 数字信号图像
figure
subplot(2,1,1);
stem(input_data(1:50));
title('原始发送的二进制信号');
subplot(2,1,2);
stem(decode_data(1:50));
title('接收(解调)的二进制信号');