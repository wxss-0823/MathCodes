clc;
clear all;
close all;
carrier_count=200; %���������OFDM���ز�����Ϊ512������400��carrier_count*2Ϊ���ݷ��ţ����ำֵΪ0
symbols_per_carrier=100;  %ÿ�����ز��ϵķ������������ＴΪOFDM���Ÿ���
bits_per_symbol=4;    %OFDM���ŵ�ÿ�����ز��ϴ���ı�������4bitͨ������16QAM����
IFFT_bin_length=512;  %FFT���ȣ�Ҳ��һ��OFDM�������ز�����
PrefixRatio=1/4;  %ѭ��ǰ׺�ı�ֵ����ѭ��ǰ׺��OFDM���ų��ȵı�ֵ��ͨ����1/6~1/4֮��
GI=PrefixRatio*IFFT_bin_length;  %��������ĳ��ȣ�����Ϊ128
beta=1/32;  %�����Ҵ��Ĺ���ϵ��
GIP=beta*(IFFT_bin_length+GI);  %ѭ��ǰ׺�ĳ��ȣ�����Ϊ20
%%
for SNR = 0:5:15   %�������Ǽ��Ը�˹�������ŵ������������Ϊ30dB
%% OFDM�źŵĲ���
%���㴫�������ܵı�������200��100��4bit=80000bit�� 80000bit�Ĺ���
baseband_out_length=carrier_count*symbols_per_carrier*bits_per_symbol; 
%100��OFDM���ţ�ÿ��OFDM����200�����ز���ÿ�����ز�����4bit��Ϣ
carriers=(1:carrier_count) + (floor(IFFT_bin_length/4) - floor(carrier_count/2)); %����OFDM�������ز�����ţ�carriers�д�ŵ������29-228
conjugate_carriers=IFFT_bin_length - carriers + 2;  %����OFDM�������ز�����ţ�conjugate_carries�д�ŵ������282-481,  ʵ����485-286
rand('twister',0);
baseband_out=round(rand(1,baseband_out_length));  %����80000bit������Ķ����Ʊ�������
%�����ŵ��Ƿ��͵Ķ������ź����������Ķ������źűȽϣ����Լ��������ʡ�
%% ��·�źŵ��ƺʹ���ת��
complex_carrier_matrix=qam16(baseband_out);
%�����ӳ���qam16����16QAM���ơ���baseband_out�еĶ����Ʊ�������ÿ4bitת��Ϊһ��16QAM�źţ����������Ʊ�����ÿ4bitת��Ϊ-3-3j,-3+3j,3-3j,3+3j,-1-3j
%-1+3j,1-3j,1+3j,-3-j,-3+j,3-j,3+j,-1-j,-1+j,1-j,1+j�е�һ����ת����complex_carrier_matrixΪ1��4000����
complex_carrier_matrix=reshape...
    (complex_carrier_matrix',carrier_count,symbols_per_carrier)';
%ת��complex_carrier_matrix�е�����Ϊcarrier_count*symbols_per_carrier��������Ϊ20��200����
%% OFDM����
%IFFT,������OFDM����
IFFT_modulation=zeros(symbols_per_carrier,IFFT_bin_length);   %��symbols_per_carrier*IFFT_bin_length����0ֵ�����ｫ20��512����0ֵ
%����512��IFFT�ĳ��ȣ�Ҳ��OFDM���ŵ����ز�����
IFFT_modulation(:,carriers)=complex_carrier_matrix; %��100��200��complex_carrier_matrix�����ݸ���IFFT_modulation�ĵ�29-228�У�
%����512�����ز��е�29-229�����ز���ֵ
IFFT_modulation(:,conjugate_carriers) = conj(complex_carrier_matrix); %��20��200��complex_carrier_matrix�����ݸ�ֵ��512�����ز��еĵ�282-481��
%���ز���γ�������512�����ز���OFDM���ţ����Ҹ������ز��ϵ������ǹ���ԳƵġ���������Ŀ���Ǿ���IFFT���γɵ�OFDM���ž�Ϊʵ����
%���⣬��512�����ز��У�����400�����ز�Ϊ���ݣ�����Ϊ0ֵ���൱�ڲ�0�������Ŀ����ͨ��IFFT�ĳ���Ӧ��Ϊ2����������
signal_after_IFFT=ifft(IFFT_modulation,IFFT_bin_length,2);     %IFFTʵ��OFDM����
time_wave_matrix=signal_after_IFFT;

%% ���ѭ��ǰ׺��ѭ����׺
XX=zeros(symbols_per_carrier,IFFT_bin_length + GI + GIP);
%IFFT_bin_length + GI + GIPΪOFDM��ѭ��ǰ׺��ѭ����׺����֮��
for k=1:symbols_per_carrier
    for i=1:IFFT_bin_length
        XX(k,i+GI)=signal_after_IFFT(k,i);
    end
    for i=1:GI
        XX(k,i)=signal_after_IFFT(k,i+IFFT_bin_length - GI);
%���ѭ��ǰ׺
    end
    for j=1:GIP
        XX(k,IFFT_bin_length + GI + j) = signal_after_IFFT(k,j);
        %���ѭ����׺
    end
end
time_wave_matrix_cp=XX;  %��ѭ��ǰ׺��ѭ����׺��OFDM����

%% OFDM���żӴ�
windowed_time_wave_matrix_cp=zeros(1,IFFT_bin_length + GI + GIP);
for i=1:symbols_per_carrier
    windowed_time_wave_matrix_cp(i,:)=real(time_wave_matrix_cp(i,:)).*rcoswindow(beta,IFFT_bin_length + GI)';
    %����rcoswindow���������Ҵ����Դ�ѭ��ǰ׺��ѭ����׺��OFDM���żӴ�
end

%% ���ɷ����źţ�����ת��
windowed_Tx_data=zeros(1,symbols_per_carrier*(IFFT_bin_length + GI) + GIP);  %ע�����ﲢ��ת�������ݳ���Ϊ
%symbols_per_carrier*(IFFT_bin_length + GI) + GIP,���￼����ѭ��ǰ׺��ѭ����׺���ص����
windowed_Tx_data(1:IFFT_bin_length + GI + GIP)=windowed_time_wave_matrix_cp(1,:);   %1:IFFT_bin_length + GI + GIP=1:��IFFT_bin_length + GI + GIP��
%������һ���Ӵ���ѭ��ǰ׺��׺��OFDM������windowed_Tx_data,�����ʹ�������
for i=1:symbols_per_carrier - 1
    windowed_Tx_data((IFFT_bin_length + GI)*i + 1:(IFFT_bin_length + GI)*(i+1)+GIP) = windowed_time_wave_matrix_cp(i+1,:);
    %����ת����ѭ��ǰ׺��ѭ����׺�ص����
end
Tx_data_withoutwindow=reshape(time_wave_matrix_cp',(symbols_per_carrier)*(IFFT_bin_length + GI + GIP),1)';
%���Ӵ����ݲ���ת��
Tx_data=reshape(windowed_time_wave_matrix_cp',(symbols_per_carrier)*(IFFT_bin_length + GI + GIP),1)';
%�Ӵ����ݣ�������ѭ��ǰ׺��ѭ����׺���ص���ӽ��в���ת������ʱ���ݳ���Ϊ
%��symbols_per_carrier)*(IFFT_bin_length + GI + GIP)
temp_timel=(symbols_per_carrier)*(IFFT_bin_length + GI + GIP);
%�Ӵ���ѭ��ǰ׺��ѭ����׺���ص����ݳ��ȣ���Ϊ���͵������ݱ�����

temp_time2 = symbols_per_carrier*(IFFT_bin_length + GI) + GIP;
%% δ�Ӵ������ź�Ƶ��
%�Է������ݷֶΣ��ֶμ���Ƶ�ף�ȥƽ����ΪOFDM�źŵ�Ƶ��
symbols_per_average=ceil(symbols_per_carrier/5);   %4
avg_temp_time=(IFFT_bin_length + GI + GIP)*symbols_per_average;    %�ֳ���Σ�ÿ�εĳ���
averages = floor(temp_timel/avg_temp_time);
%���������ݷ�5�Σ�ÿ�����ݳ���Ϊavg_temp_time
average_fft(1:avg_temp_time) = 0;  %���ƽ�����OFDM�źŵ��ף�������
 for a=0:(averages - 1)
     subset_ofdm = Tx_data_withoutwindow(((a*avg_temp_time)+1):((a+1)*avg_temp_time));    %�ֶ�
     subset_ofdm_f = abs(fft(subset_ofdm));   %�Էֶκ��OFDM�źż���Ƶ��
     average_fft = average_fft + (subset_ofdm_f/averages);  %ȡƽ��
 end
 average_fft_log = 20*log10(average_fft);   %�����ƽ����

%% ====================�������Ը�˹�������ŵ�========================
Tx_signal_power = var(windowed_Tx_data);   %�����źŹ���,var������� %windowed_Tx_data�ǲ���ת����ѭ��ǰ׺��ѭ����׺�ص���ӵ�
linear_SNR = 10^(SNR/10);    %ת�����������Ϊ���Է���ֵ
noise_sigma = Tx_signal_power./linear_SNR;   %�����������ʣ�Ҳ���Ƿ���
noise_scale_factor = sqrt(noise_sigma);     %�����׼��
noise = randn(1,((symbols_per_carrier)*(IFFT_bin_length + GI)) + GIP)*noise_scale_factor; %��������Ϊnoise_scale_factor��˹����
Rx_data = windowed_Tx_data + noise;
%�ڷ��������ϼ��������൱��OFDM�źž������Ը�˹�������ŵ�
%% ==============OFDM�źŽ��===========================
Rx_data_matrix = zeros(symbols_per_carrier,IFFT_bin_length + GI + GIP);  %��Ų��н�������
for i=1:symbols_per_carrier
    Rx_data_matrix(i,:) = Rx_data(1,(i-1)*(IFFT_bin_length + GI)+1:i*(IFFT_bin_length + GI) + GIP);   %����ת��
end
Rx_data_complex_matrix = Rx_data_matrix(:,GI + 1:GI + IFFT_bin_length);
%ȥ��ѭ��ǰ׺��ѭ����׺��ȡ��OFDM���Ŵ��������
Y1 = fft(Rx_data_complex_matrix,IFFT_bin_length,2);
%��FFT����OFDM�źŽ��
Rx_carriers = Y1(:,carriers);
%ȡ��carriers��Ŷ�Ӧ�����ز��ϵķ������ݣ�ȥ��������㼰����ԳƲ���
Rx_phase = angle(Rx_carriers);  %��������źŵ���λ����
Rx_mag = abs(Rx_carriers);     %��������źŵķ�������
[M,N] = pol2cart(Rx_phase,Rx_mag);   %ת������������Ϊֱ����������
Rx_complex_carrier_matrix = complex(M,N);   %����ֱ�������ʵ����Ϊ���ɸ�����
figure(3);
subplot(2,2,SNR/5+1);
plot(Rx_complex_carrier_matrix,'.b'); %�������źŵ�����ͼ
grid on;
axis([-4,4,-4,4]);
title(['SNR=',num2str(SNR),'dB������������ͼ']);
%% 16QAM���
Rx_serial_complex_symbols = reshape(Rx_complex_carrier_matrix',...
    size(Rx_complex_carrier_matrix,1)*size(Rx_complex_carrier_matrix,2),1)';
%������Rx_complex_carrier_matrixת��Ϊ1������
Rx_decoded_binary_symbols = demoduqam16(Rx_serial_complex_symbols);
%����16QAM���
baseband_in = Rx_decoded_binary_symbols;
%������ָ��Ķ������źŴ����baseband_in
%% �����ʼ���
bit_errors = find(baseband_in ~= baseband_out);
%����ָ��Ķ������ź��뷢�Ͷ������źűȽϣ���������
bit_error_count=size(bit_errors,2);   %�����������
error_rate = bit_error_count/baseband_out_length;  %����������
figure(4)
plot(linear_SNR,error_rate,'*-k');hold on;grid on;
text(linear_SNR,error_rate,['(',num2str(roundn(linear_SNR,-2)),',',num2str(roundn(error_rate,-2)),')']);
xlabel('SNR/dB');
ylabel('������');
title('AWGN�ŵ��µ�������');
end
%% ����OFDM�ź�ʱ��ͼ
figure(1);
subplot(3,1,1);
plot(0:2:2*IFFT_bin_length-1,time_wave_matrix(2,:));
%��һ��OFDM�źŵ�ʱ�����
axis([0,1400,-0.4,0.4]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('OFDMʱ���Σ�һ���������ڣ�');

subplot(3,1,2);
plot(0:2:2*length(time_wave_matrix_cp)-1,time_wave_matrix_cp(2,:)); %������ѭ��ǰ׺��ѭ����׺��OFDM�źŵ�ʱ����
axis([0,1400,-0.3,0.3]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('��ѭ��ǰ׺��׺OFDMʱ���Σ�һ���������ڣ�');

subplot(3,1,3);
plot(0:2:2*(IFFT_bin_length - 1 + GI + GIP),windowed_time_wave_matrix_cp(2,:));
%�Ӵ����OFDM����
axis([0,1400,-0.2,0.2]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('�Ӵ���ѭ��ǰ׺��׺OFDMʱ���Σ�һ���������ڣ�');
%% �Ӵ������ʱ��Ƶ����
figure(2)
subplot(2,1,1);
plot(0:temp_timel - 1,Tx_data);    %���˴���,�����ص�
%��ѭ��ǰ׺��ѭ����׺���ص����OFDM�źŵ�ʱ����
grid on
ylabel('Amplitude (volts)')
xlabel('Time (samples)')
title('OFDM ʱ����')

subplot(2,1,2);
plot((0:(avg_temp_time-1))/avg_temp_time,average_fft_log);
%��δ�Ӵ�OFDM���Ŷ���ƽ����
hold on
grid on
axis([0 1 -20 max(average_fft_log)])
ylabel('Magnitude (dB)')
xlabel('Normalized Frequency (0.5 = fs/2)')
title('OFDMƵ����')
