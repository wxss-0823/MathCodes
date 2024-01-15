clear all;
close all;
clc;

load data.mat            %% ��ȡԭʼ��������
N = length(data);        %% ���ݳ���
fs = 16e6;               %% ԭʼ������
Bw = 40e3;               %% ����ȡ�źŴ���
f_Lo = 2e6;              %% ����ȡ�ź�����Ƶ��

Power_xdBm(data(1:2^20),fs);  %��ԭʼ�����źŹ�����ͼ��dataΪ��data.mat�ж�����ԭʼ��������
title('�����źŹ�����ͼ ������16MHz Ƶ�׷ֱ���15.259Hz');


%% NCO mixing ������Ƶ
Lo = exp( - 1j * 2 * pi * f_Lo * ( 0 : N - 1 ) / fs ); %% ����������Ƶ�ı����ź�

mixing_data = data .* Lo;

Power_xdBm_complex(mixing_data,fs);
%% ��һ��CIC�˲�+��ȡ
Hcic =  dsp.CICDecimator(10,1,3);
y_1 = Hcic(mixing_data');
Power_xdBm_complex(y_1',fs/20);
%% HB1 Filter+2����ȡ
Dpass = 0.17099735734;  % Passband Ripple
b1  = firhalfband('minorder', (Bw/2)/(fs/10), Dpass);
Hd1 = dfilt.dffir(b1);
y_2 = filter(Hd1,y_1); 
y22=double(y_2);
y2 = downsample(y22, 2);
Power_xdBm_complex(y2',fs/20);
%% HB2 Filter+2����ȡ
Dpass = 0.17099735734;  % Passband Ripple
b2  = firhalfband('minorder', (Bw/2)/(fs/20), Dpass);
Hd2 = dfilt.dffir(b2);
y_3 = filter(Hd2,y2);
y33=double(y_3);
y3 = downsample(y33, 2);
Power_xdBm_complex(y3',fs/40);
%% ����HB�˲����������ݷ���ȷ��
Dpass = 0.17099735734;  % Passband Ripple
b3  = firhalfband('minorder', (Bw/2)/(fs/40), Dpass);
Hd3 = dfilt.dffir(b3);
y_4 = filter(Hd3,y3);
y44=double(y_4);
y4 = downsample(y44, 2);
Power_xdBm_complex(y4',fs/80);
%% ���һ��FIR�˲�+��ȡ 
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
%% ����ÿһ���˲����ķ�Ƶ��Ӧ
% % ��һ��CIC�˲�+��ȡ
% fvtool(Hcic);
% % HB1
% fvtool(Hd1);
% %HB2
% fvtool(Hd2);
% %HB3
% fvtool(Hd3);
% %HB4
% fvtool(Hd4);
%% ������źŹ����ף�����fir_dataΪ���һ���˲���ȡ������ݣ�fs_outΪ���һ��������ݲ�����
fs_out=1e5;
Power_xdBm_complex(fir_data',fs_out);  %
title('DDC����źŹ�����ͼ ������100kHz Ƶ�׷ֱ���24.414Hz');
