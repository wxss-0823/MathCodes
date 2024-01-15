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
% zero=[0,0.2587*pi,0.5715*pi,0.8571*pi,1.1429*pi,4.488, 1.714*pi,2*pi];
% polar=[0,0.2587*pi,0.5715*pi,0.8571*pi,1.1429*pi,1.4285*pi, 1.714*pi,2*pi];
%�㼫�������˳��ض�Ƶ�ʵ�����
r=0.99;
z1=(1-exp(i*0)*exp((-i)*w));            p1=1./(1-r*exp(i*0)*exp((-i)*w));
z2=(1-exp(i*0.2857*pi)*exp((-i)*w));    p2=1./(1-r*exp(i*0.2857*pi)*exp((-i)*w));
z3=(1-exp(i*0.5714*pi)*exp((-i)*w));    p3=1./(1-r*exp(i*0.5714*pi)*exp((-i)*w));
z4=(1-exp(i*0.8571*pi)*exp((-i)*w));    p4=1./(1-r*exp(i*0.8571*pi)*exp((-i)*w));
z5=(1-exp(i*1.1429*pi)*exp((-i)*w));    p5=1./(1-r*exp(i*1.1429*pi)*exp((-i)*w));
z6=(1-exp(i*1.4286*pi)*exp((-i)*w));    p6=1./(1-r*exp(i*1.4286*pi)*exp((-i)*w));
z7=(1-exp(i*1.7143*pi)*exp((-i)*w));    p7=1./(1-r*exp(i*1.7143*pi)*exp((-i)*w));
z8=(1-exp(i*2*pi)*exp((-i)*w));         p8=1./(1-r*exp(i*2*pi)*exp((-i)*w));
H=(((((((((((((((z1.*z2).*z3).*z4).*z5).*z6).*z7).*z8).*p1).*p2).*p3).*p4).*p5).*p6).*p7).*p8)';
audio_new_fft=audio_data_fft.*H;
figure(2)
subplot(2,1,1);plot(w,20*log(abs(H)));
set(gca,'xlim',[0,2.*pi]);%����x�����귶Χ
set(gca,'xtick',0:pi/4:2*pi);%����x��������
set(gca,'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'});%\pi=��
set(gca,'ylim',[-200,40]);%����y�����귶Χ
title( 'ϵͳ�����ķ��Ȳ���ͼ' );
xlabel( '��λ/\pi' );ylabel( '20log|H|' )
grid;
subplot(2,1,2);plot(w, abs(audio_new_fft));
set(gca,'xlim',[0,2.*pi]);%����x�����귶Χ
set(gca,'xtick',0:pi/4:2*pi);%����x��������
set(gca,'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'});%\pi=��
set(gca,'ylim',[0,40]);%����x�����귶Χ
set(gca,'ytick',[0:20:40]);%����y�����귶Χ
title( '�˲��������źŵ�Ƶ����ͼ' );
xlabel( '��λ/\pi' );ylabel( '����' );
grid;
%�˲���������źŵ�ʱ��
audio_new=ifft(audio_new_fft,N);
%���˳���Ƶ��������ź���ʱ�����˵����
audio_new(abs(audio_new)>0.7)=0;
t=(0 : length(audio_new)-1)/fs;
figure(3)
plot(t,real(audio_new)); title('�˺�ʱ����');
xlabel('t/s'); ylabel('audio new'); grid on;
soundsc(real(audio_new),fs);
%soundsc(audio_data,fs);