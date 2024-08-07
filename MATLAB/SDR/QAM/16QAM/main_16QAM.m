clear
close all
%% 系统参数定义
sys_param = Parameter();
M=16;
k=log2(M);
% 空数组定义
m = [];
n = [];
output_data = [];
origin_output = [];
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
error_ratio = zeros(1,length(sys_param.SNR));
theory_ber = zeros(1,length(sys_param.SNR));
for j=1:20
signal_noise = awgn(modulated_signal,sys_param.SNR(j));
% 采用正交相干解调方式
[decode_data,I,Q] = QAM_Demodulation(signal_noise,sys_param);
% 误码率曲线
error_ratio(j) = CalBitErrorRate(input_data,decode_data);
% 理想误码率曲线
theory_ber(j) = CalTheoryBitErrorRate(sys_param.SNR(j), M);
m = [m;I];
n = [n;Q];
output_data = [output_data;decode_data];
origin_output = [I;Q];
end
% 画图
figure
plot(sys_param.SNR,error_ratio,'.-k');hold on;grid on;
plot(sys_param.SNR,theory_ber,'.-r');grid on;
xlabel('SNR/dB');
ylabel('误码率');
legend("real ber","theory ber");
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
%% 眼图
% 基带输入比特流眼图
short_input_data = input_data(1 : 1000);
figure
subplot(3,1,1)
for k = 1:length(short_input_data)/log2(M)
    hold on
    plot(1:log2(M), short_input_data(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("码元比特数");
ylabel("码元波形");
title("输入比特流眼图");
legend("Input Data Eyediagram");
% 基带输出比特流眼图
short_output_data = output_data(1, 1 : 1000);
subplot(3,1,2)
for k = 1:length(short_output_data)/log2(M)
    hold on
    plot(1:log2(M), short_output_data(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("码元比特数");
ylabel("码元波形");
title("输出比特流眼图");
legend("Output Data Eyediagram");
% 基带未经判决处理的码元眼图
short_origin_output = origin_output(1, 1 : 1000);
subplot(3,1,3)
for k = 1:length(short_origin_output)/log2(M)
    hold on
    plot(1:log2(M), short_origin_output(1+log2(M)*(k-1):k*log2(M)), '-b', LineWidth=1.5);
end
xlabel("码元比特数");
ylabel("码元波形");
title("输出码元流眼图");
legend("Output Data Eyediagram");
%% 数字信号图像
figure
subplot(2,1,1);
stem(input_data(1:50));
title('原始发送的二进制信号');
subplot(2,1,2);
stem(decode_data(1:50));
title('接收(解调)的二进制信号');