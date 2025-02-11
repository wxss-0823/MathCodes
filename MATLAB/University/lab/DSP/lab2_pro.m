%��Ƶ�źŲ���
[audio_data,fs]=audioread('SunshineSquare.wav');
figure(1);
subplot(2,1,1);plot(audio_data);
title( 'ԭ�����ź�ʱ����ͼ' );
xlabel( '��λ/t' );ylabel( '����' );
%���������fft�õ�Ƶ��
N= length(audio_data);
f= (0:N-1)*fs/N;w=2*pi*f/fs;
audio_data_fft= fft (audio_data,N);
subplot(2,1,2);plot(w, abs(audio_data_fft));
set(gca,'xlim',[0,2.*pi]);%����x�����귶Χ
set(gca,'xtick',0:pi/4:2*pi);%����x��������
set(gca,'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'});%\pi=��
set(gca,'ylim',[0,15000]);%����x�����귶Χ
title( 'ԭ�����ź�Ƶ����ͼ' );
xlabel('��λ/\pi');ylabel('����');
grid;
H1=zp0(audio_data_fft);
audio_new_fft_1=audio_data_fft.*H1;
H2=zp0(audio_new_fft_1);
audio_new_fft_2=audio_new_fft_1.*H2;
H3=zp0(audio_new_fft_2);
audio_new_fft_3=audio_new_fft_2.*H3;
H4=zp0(audio_new_fft_3);
audio_new_fft=audio_new_fft_3.*H4;
H=H1.*H2.*H3.*H4;
figure(2)
subplot(2,1,1);plot(w,20*log(abs(H)));
set(gca,'xlim',[0,2.*pi]);%����x�����귶Χ
set(gca,'xtick',0:pi/4:2*pi);%����x��������
set(gca,'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'});%\pi=��
set(gca,'ylim',[-200,40]);%����y�����귶Χ
title( 'ϵͳ�����ķ��Ȳ���ͼ' );
xlabel( '��λ/\pi' );ylabel( '20log|H|' );
grid;
subplot(2,1,2);plot(w, abs(audio_new_fft));
set(gca,'xlim',[0,2.*pi]);%����x�����귶Χ
set(gca,'xtick',0:pi/4:2*pi);%����x��������
set(gca,'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'});%\pi=��
set(gca,'ylim',[0,40]);%����y�����귶Χ
set(gca,'ytick',[0:20:40]);%����y��������
title( '�˲��������źŵ�Ƶ����ͼ' );
xlabel( '��λ/\pi' );ylabel( '����' );
grid;
%�˲���������źŵ�ʱ��
audio_new=ifft(audio_new_fft,N);
%���˳���Ƶ��������ź���ʱ�����˵����
audio_new(abs(audio_new)>0.18)=0;
t=(0 : length(audio_new)-1)/fs;
figure(3)
plot(t,real(audio_new)); title('�˺�ʱ����');
xlabel('t/s'); ylabel('audio new'); grid on;
soundsc(real(audio_new),fs);
audiowrite('D:\Filtered.wav',real(audio_new),fs);
% soundsc(audio_data,fs);