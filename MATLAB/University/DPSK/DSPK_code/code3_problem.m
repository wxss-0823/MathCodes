% DPSK���ƽ��ʵ��
clear
close all

% ��Ԫ��������
Ts = 1;

% ��Դ����
N = 100;
a = randi(2,1,N)-1;  

% ��ֱ���
b = zeros(1,length(a)+1);
for k = 1:length(a)
    b(k+1) = xor(b(k),a(k));
end

senddpsk = 1-2*b;   % BPSK����

% ����Ƶƫ������
t = 0:length(senddpsk)-1;
f = 0.003;   
p = 0.2;
recvdpsk = senddpsk.*exp(j*(2*pi*f*t+p));   

% �������
decoded = zeros(1,length(recvdpsk)-1);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ڴ˴���ս��в�����룬��������decoded��
for k= 1:length(recvdpsk)-1    %ȷ���ı��decoded�ĳ���
  decoded(k+1) =recvdpsk(k+1)* conj(recvdpsk(k)); %����ppt�еķ�������recvdpsk�ź��ӳ�1λ��ȡ���Ȼ������δ�ӳٹ����ź���˵ò�������źţ�Ȼ���ٽ��г����о���
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bit = sign(decoded(1:Ts:N*Ts));
c = (1-bit)/2;

figure; hold on;
plot(real(senddpsk),imag(senddpsk),'o')
xlim([-1.1 1.1])
ylim([-1.1 1.1])
axis equal
grid on;
figure; hold on;
plot(real(recvdpsk),imag(recvdpsk),'.')
xlim([-1.1 1.1])
ylim([-1.1 1.1])
grid on;
axis equal

figure;
plot(c - a)
