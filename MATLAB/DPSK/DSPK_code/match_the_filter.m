clear all,clc;
%��������������
fs = 2000 * 100000;   %������Ƶ��
Ts = 1/fs;   %��������
N = 2000;  %��������
t = (-N:N)*Ts;    %ʱ������
T = 0.00001;   %�ź�����

%����һ��LFM�źţ�
syms S_a S_b real; %��������ʵ������,aΪʵ��,bΪ�鲿
S_a = 1;            %���÷���
S_b = 1;
B = 40 * 1000000;
k = B/T;
S_amplitude = 1;  %�ź�s�ķ�ֵ
L=length(t);

for ii=1:L
if abs(t(ii)) < T/2 
    S_signal(ii) = exp(1j * pi * k * t(ii)* t(ii));  %����һ��ָ���ź� 
else 
    S_signal(ii) = 0;
end
end

%����һ����˹�������ź� 
noise = awgn(S_signal,10);

%���������Ӧ
K = 1;
t0 = 0;
h = conj(S_signal);       %��Ϊ�ز�Ƶ����0����������ȡ����

%��������Ҷ�仯
N1 = L; %������
y = fftshift(fft(noise));
x = fftshift(fft(S_signal));%��ԭ�źŽ���fft

ff = 0:fs/(L-1):fs;
ff = ff-fs/2;
            
%����ϵͳ������ź�
Sout = conv(noise,h,'same');
%Sout = Sout/max(Sout);
SoutFFT = fftshift(fft(Sout));

%***************************************%
%�����ǻ�ͼ����

%LFM�źŵķ�����
figure(1);subplot(1,1,1);plot(ff,abs(x));
title('LFM�źŵ�Ƶ��');
xlabel('w/hz');
ylabel('����');


%LFM�źŵ�ͼ
%ʵ������
figure(2);subplot(2,1,1);plot(t,real(S_signal));
title('LFM�ź�real part');
xlabel('t/s');
ylabel('����');   
axis([-1/100000/2 1/100000/2 -1.2 1.2]);
%��������
subplot(2,1,2);plot(t,imag(S_signal));
title('LFM�ź�imainary part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);

%+����������źŵĲ���
%ʵ������
figure(3);subplot(2,1,1);plot(t,real(noise));
title('LFM�ź�+��˹��˹�������ź�real part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -1.5 1.5]);
%��������
subplot(2,1,2);plot(t,imag(noise));
title('LFM�ź�+��˹��˹�������ź�imaginary part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -1.5 1.5]);

%Ƶ��ͼ
figure(4);subplot(1,1,1);
plot(ff,abs(y));
title('LFM�ź�+������Ƶ��ͼ');
xlabel('w/hz');
ylabel('����');

%�弤��Ӧ�Ĳ���
%ʵ������
figure(5);subplot(2,1,1);plot(t,real(h));
title('h(t)real part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);
%��������
subplot(2,1,2);plot(t,imag(h));
title('h(t)imaginary part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -1.2 1.2]);

%��ϵͳ������źŵĲ���
%ʵ������
figure(6);subplot(2,1,1);plot(t,real(Sout));
title('Sout real part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -150 150]);
%��������
subplot(2,1,2);plot(t,imag(Sout));
title('Sout imaginary part');
xlabel('t/s');
ylabel('����');
axis([-1/100000/2 1/100000/2 -120 120]);

%Ƶ��
figure(7);subplot(1,1,1);
plot(ff,abs(SoutFFT));
title('����ƥ���˲������Ƶ��');
xlabel('w/hz');
ylabel('����');
