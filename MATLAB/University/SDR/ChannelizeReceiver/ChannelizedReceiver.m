clear all;
close all;
clc;

load data.mat            %% 读取原始采样数据
N = length(data);        %% 数据长度
fs = 16e6;               %% 原始采样率
Bw = 40e3;               %% 待提取信号带宽
f_Lo = 2e6;              %% 待提取信号中心频率

Power_xdBm(data(1:2^20),fs);  %画原始采样信号功率谱图，data为从data.mat中读出的原始采样数据
title('输入信号功率谱图 采样率16MHz 频谱分辨率15.259Hz');


%% NCO mixing 正交混频
Lo = exp( - 1j * 2 * pi * f_Lo * ( 0 : N - 1 ) / fs ); %% 用于正交混频的本振信号

mixing_data = data .* Lo;

Power_xdBm_complex(mixing_data,fs);
%% 第一级CIC滤波+抽取
Hcic =  dsp.CICDecimator(10,1,3);
y_1 = Hcic(mixing_data');
Power_xdBm_complex(y_1',fs/20);
%% HB1 Filter+2倍抽取
Dpass = 0.17099735734;  % Passband Ripple
b1  = firhalfband('minorder', (Bw/2)/(fs/10), Dpass);
Hd1 = dfilt.dffir(b1);
y_2 = filter(Hd1,y_1); 
y22=double(y_2);
y2 = downsample(y22, 2);
Power_xdBm_complex(y2',fs/20);
%% HB2 Filter+2倍抽取
Dpass = 0.17099735734;  % Passband Ripple
b2  = firhalfband('minorder', (Bw/2)/(fs/20), Dpass);
Hd2 = dfilt.dffir(b2);
y_3 = filter(Hd2,y2);
y33=double(y_3);
y3 = downsample(y33, 2);
Power_xdBm_complex(y3',fs/40);
%% 级联HB滤波器数量根据方案确定
Dpass = 0.17099735734;  % Passband Ripple
b3  = firhalfband('minorder', (Bw/2)/(fs/40), Dpass);
Hd3 = dfilt.dffir(b3);
y_4 = filter(Hd3,y3);
y44=double(y_4);
y4 = downsample(y44, 2);
Power_xdBm_complex(y4',fs/80);
%% 最后一级FIR滤波+抽取 
DpassFIR = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;                % Density Factor
[N, Fo, Ao, W] = firpmord([20e3, 30e3]/(fs/160), [1 0], [DpassFIR, Dstop]);
% Calculate the coefficients using the FIRPM function.
b4  = firpm(N, Fo, Ao, W, {dens});
Hd4 = dfilt.dffir(b4);
y_5 = filter(Hd4,y4);
y55=double(y_5);
fir_data = downsample(y55, 2);
Power_xdBm_complex(fir_data',fs/160);
%% 画出每一级滤波器的幅频响应
% % 第一级CIC滤波+抽取
% fvtool(Hcic);
% % HB1
% fvtool(Hd1);
% %HB2
% fvtool(Hd2);
% %HB3
% fvtool(Hd3);
% %HB4
% fvtool(Hd4);
%% 画输出信号功率谱，其中fir_data为最后一级滤波抽取输出数据，fs_out为最后一级输出数据采样率
fs_out=1e5;
Power_xdBm_complex(fir_data',fs_out);  %
title('DDC输出信号功率谱图 采样率100kHz 频谱分辨率24.414Hz');
