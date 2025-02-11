clc;
clear all;
close all;
carrier_count=200; %这个程序中OFDM子载波个数为512，其中400即carrier_count*2为数据符号，其余赋值为0
symbols_per_carrier=100;  %每个子载波上的符号数，在这里即为OFDM符号个数
bits_per_symbol=4;    %OFDM符号的每个子载波上传输的比特数。4bit通常采用16QAM调制
IFFT_bin_length=512;  %FFT长度，也即一个OFDM符号子载波个数
PrefixRatio=1/4;  %循环前缀的比值，即循环前缀与OFDM符号长度的比值，通常在1/6~1/4之间
GI=PrefixRatio*IFFT_bin_length;  %保护间隔的长度，这里为128
beta=1/32;  %升余弦窗的滚降系数
GIP=beta*(IFFT_bin_length+GI);  %循环前缀的长度，这里为20
%%
for SNR = 0:5:15   %本程序考虑加性高斯白噪声信道，这里信噪比为30dB
%% OFDM信号的产生
%计算传输数据总的比特数，200×100×4bit=80000bit。 80000bit的构成
baseband_out_length=carrier_count*symbols_per_carrier*bits_per_symbol; 
%100个OFDM符号，每个OFDM符号200个子载波，每个子载波传输4bit信息
carriers=(1:carrier_count) + (floor(IFFT_bin_length/4) - floor(carrier_count/2)); %计算OFDM符号子载波的序号，carriers中存放的序号是29-228
conjugate_carriers=IFFT_bin_length - carriers + 2;  %计算OFDM符号子载波的序号，conjugate_carries中存放的序号是282-481,  实际是485-286
rand('twister',0);
baseband_out=round(rand(1,baseband_out_length));  %产生80000bit待传输的二进制比特流。
%这里存放的是发送的二进制信号与后面解调后的二进制信号比较，可以计算误码率。
%% 子路信号调制和串并转换
complex_carrier_matrix=qam16(baseband_out);
%调用子程序qam16进行16QAM调制。将baseband_out中的二进制比特流，每4bit转换为一个16QAM信号，即将二进制比特流每4bit转换为-3-3j,-3+3j,3-3j,3+3j,-1-3j
%-1+3j,1-3j,1+3j,-3-j,-3+j,3-j,3+j,-1-j,-1+j,1-j,1+j中的一个。转换后complex_carrier_matrix为1×4000矩阵
complex_carrier_matrix=reshape...
    (complex_carrier_matrix',carrier_count,symbols_per_carrier)';
%转换complex_carrier_matrix中的数据为carrier_count*symbols_per_carrier矩阵，这里为20×200矩阵
%% OFDM调制
%IFFT,即进行OFDM调制
IFFT_modulation=zeros(symbols_per_carrier,IFFT_bin_length);   %将symbols_per_carrier*IFFT_bin_length矩阵赋0值，这里将20×512矩阵赋0值
%这里512是IFFT的长度，也是OFDM符号的子载波个数
IFFT_modulation(:,carriers)=complex_carrier_matrix; %将100×200的complex_carrier_matrix的数据赋给IFFT_modulation的第29-228列，
%即给512个子载波中的29-229个子载波赋值
IFFT_modulation(:,conjugate_carriers) = conj(complex_carrier_matrix); %将20×200的complex_carrier_matrix的数据赋值给512个子载波中的的282-481个
%子载波这段程序构造了512个子载波的OFDM符号，并且各个子载波上的数据是共轭对称的。这样做的目的是经过IFFT后形成的OFDM符号均为实数。
%另外，在512个子载波中，仅有400个子载波为数据，其余为0值，相当于补0。补零的目的是通常IFFT的长度应该为2的整数次幂
signal_after_IFFT=ifft(IFFT_modulation,IFFT_bin_length,2);     %IFFT实现OFDM调制
time_wave_matrix=signal_after_IFFT;

%% 添加循环前缀与循环后缀
XX=zeros(symbols_per_carrier,IFFT_bin_length + GI + GIP);
%IFFT_bin_length + GI + GIP为OFDM、循环前缀、循环后缀长度之和
for k=1:symbols_per_carrier
    for i=1:IFFT_bin_length
        XX(k,i+GI)=signal_after_IFFT(k,i);
    end
    for i=1:GI
        XX(k,i)=signal_after_IFFT(k,i+IFFT_bin_length - GI);
%添加循环前缀
    end
    for j=1:GIP
        XX(k,IFFT_bin_length + GI + j) = signal_after_IFFT(k,j);
        %添加循环后缀
    end
end
time_wave_matrix_cp=XX;  %带循环前缀与循环后缀的OFDM符号

%% OFDM符号加窗
windowed_time_wave_matrix_cp=zeros(1,IFFT_bin_length + GI + GIP);
for i=1:symbols_per_carrier
    windowed_time_wave_matrix_cp(i,:)=real(time_wave_matrix_cp(i,:)).*rcoswindow(beta,IFFT_bin_length + GI)';
    %调用rcoswindow产生升余弦窗，对带循环前缀与循环后缀的OFDM符号加窗
end

%% 生成发送信号，并串转换
windowed_Tx_data=zeros(1,symbols_per_carrier*(IFFT_bin_length + GI) + GIP);  %注意这里并串转换后数据长度为
%symbols_per_carrier*(IFFT_bin_length + GI) + GIP,这里考虑了循环前缀与循环后缀的重叠相加
windowed_Tx_data(1:IFFT_bin_length + GI + GIP)=windowed_time_wave_matrix_cp(1,:);   %1:IFFT_bin_length + GI + GIP=1:（IFFT_bin_length + GI + GIP）
%赋给第一个加窗带循环前缀后缀的OFDM符号至windowed_Tx_data,即发送串行数据
for i=1:symbols_per_carrier - 1
    windowed_Tx_data((IFFT_bin_length + GI)*i + 1:(IFFT_bin_length + GI)*(i+1)+GIP) = windowed_time_wave_matrix_cp(i+1,:);
    %并串转换，循环前缀与循环后缀重叠相加
end
Tx_data_withoutwindow=reshape(time_wave_matrix_cp',(symbols_per_carrier)*(IFFT_bin_length + GI + GIP),1)';
%不加窗数据并串转换
Tx_data=reshape(windowed_time_wave_matrix_cp',(symbols_per_carrier)*(IFFT_bin_length + GI + GIP),1)';
%加窗数据，但按照循环前缀与循环后缀不重叠相加进行并串转换。此时数据长度为
%（symbols_per_carrier)*(IFFT_bin_length + GI + GIP)
temp_timel=(symbols_per_carrier)*(IFFT_bin_length + GI + GIP);
%加窗，循环前缀与循环后缀不重叠数据长度，即为发送的总数据比特数

temp_time2 = symbols_per_carrier*(IFFT_bin_length + GI) + GIP;
%% 未加窗发送信号频谱
%对发送数据分段，分段计算频谱，去平均作为OFDM信号的频谱
symbols_per_average=ceil(symbols_per_carrier/5);   %4
avg_temp_time=(IFFT_bin_length + GI + GIP)*symbols_per_average;    %分成五段，每段的长度
averages = floor(temp_timel/avg_temp_time);
%将发送数据分5段，每段数据长度为avg_temp_time
average_fft(1:avg_temp_time) = 0;  %存放平均后的OFDM信号的谱，先置零
 for a=0:(averages - 1)
     subset_ofdm = Tx_data_withoutwindow(((a*avg_temp_time)+1):((a+1)*avg_temp_time));    %分段
     subset_ofdm_f = abs(fft(subset_ofdm));   %对分段后的OFDM信号计算频谱
     average_fft = average_fft + (subset_ofdm_f/averages);  %取平均
 end
 average_fft_log = 20*log10(average_fft);   %求对数平均谱

%% ====================经过加性高斯白噪声信道========================
Tx_signal_power = var(windowed_Tx_data);   %计算信号功率,var均方差函数 %windowed_Tx_data是并串转换，循环前缀与循环后缀重叠相加的
linear_SNR = 10^(SNR/10);    %转换对数信噪比为线性幅度值
noise_sigma = Tx_signal_power./linear_SNR;   %计算噪声功率，也就是方差
noise_scale_factor = sqrt(noise_sigma);     %计算标准差
noise = randn(1,((symbols_per_carrier)*(IFFT_bin_length + GI)) + GIP)*noise_scale_factor; %产生功率为noise_scale_factor高斯噪声
Rx_data = windowed_Tx_data + noise;
%在发送数据上加噪声，相当于OFDM信号经过加性高斯白噪声信道
%% ==============OFDM信号解调===========================
Rx_data_matrix = zeros(symbols_per_carrier,IFFT_bin_length + GI + GIP);  %存放并行接收数据
for i=1:symbols_per_carrier
    Rx_data_matrix(i,:) = Rx_data(1,(i-1)*(IFFT_bin_length + GI)+1:i*(IFFT_bin_length + GI) + GIP);   %串并转换
end
Rx_data_complex_matrix = Rx_data_matrix(:,GI + 1:GI + IFFT_bin_length);
%去掉循环前缀与循环后缀，取出OFDM符号传输的数据
Y1 = fft(Rx_data_complex_matrix,IFFT_bin_length,2);
%求FFT，即OFDM信号解调
Rx_carriers = Y1(:,carriers);
%取出carriers序号对应的子载波上的发送数据，去掉加入的零及共轭对称部分
Rx_phase = angle(Rx_carriers);  %计算接收信号的相位特性
Rx_mag = abs(Rx_carriers);     %计算接收信号的幅度特性
[M,N] = pol2cart(Rx_phase,Rx_mag);   %转换极坐标数据为直角坐标数据
Rx_complex_carrier_matrix = complex(M,N);   %两个直角坐标的实数据为构成复数据
figure(3);
subplot(2,2,SNR/5+1);
plot(Rx_complex_carrier_matrix,'.b'); %画接收信号的星座图
grid on;
axis([-4,4,-4,4]);
title(['SNR=',num2str(SNR),'dB接收数据星座图']);
%% 16QAM解调
Rx_serial_complex_symbols = reshape(Rx_complex_carrier_matrix',...
    size(Rx_complex_carrier_matrix,1)*size(Rx_complex_carrier_matrix,2),1)';
%将矩阵Rx_complex_carrier_matrix转换为1的数组
Rx_decoded_binary_symbols = demoduqam16(Rx_serial_complex_symbols);
%进行16QAM解调
baseband_in = Rx_decoded_binary_symbols;
%将解调恢复的二进制信号存放在baseband_in
%% 误码率计算
bit_errors = find(baseband_in ~= baseband_out);
%解调恢复的二进制信号与发送二进制信号比较，查找误码
bit_error_count=size(bit_errors,2);   %计算误码个数
error_rate = bit_error_count/baseband_out_length;  %计算误码率
figure(4)
plot(linear_SNR,error_rate,'*-k');hold on;grid on;
text(linear_SNR,error_rate,['(',num2str(roundn(linear_SNR,-2)),',',num2str(roundn(error_rate,-2)),')']);
xlabel('SNR/dB');
ylabel('误码率');
title('AWGN信道下的误码率');
end
%% 各种OFDM信号时域图
figure(1);
subplot(3,1,1);
plot(0:2:2*IFFT_bin_length-1,time_wave_matrix(2,:));
%画一个OFDM信号的时域表现
axis([0,1400,-0.4,0.4]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('OFDM时域波形（一个符号周期）');

subplot(3,1,2);
plot(0:2:2*length(time_wave_matrix_cp)-1,time_wave_matrix_cp(2,:)); %画带有循环前缀和循环后缀的OFDM信号的时域波形
axis([0,1400,-0.3,0.3]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('带循环前缀后缀OFDM时域波形（一个符号周期）');

subplot(3,1,3);
plot(0:2:2*(IFFT_bin_length - 1 + GI + GIP),windowed_time_wave_matrix_cp(2,:));
%加窗后的OFDM符号
axis([0,1400,-0.2,0.2]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('加窗带循环前缀后缀OFDM时域波形（一个符号周期）');
%% 加窗处理的时域、频域波形
figure(2)
subplot(2,1,1);
plot(0:temp_timel - 1,Tx_data);    %加了窗的,但不重叠
%画循环前缀与循环后缀不重叠相加OFDM信号的时域波形
grid on
ylabel('Amplitude (volts)')
xlabel('Time (samples)')
title('OFDM 时域波形')

subplot(2,1,2);
plot((0:(avg_temp_time-1))/avg_temp_time,average_fft_log);
%画未加窗OFDM符号对数平均谱
hold on
grid on
axis([0 1 -20 max(average_fft_log)])
ylabel('Magnitude (dB)')
xlabel('Normalized Frequency (0.5 = fs/2)')
title('OFDM频域波形')
