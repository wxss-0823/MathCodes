% DPSK调制解调实验
clear
close all

% 码元采样点数
Ts = 1;

% 信源产生
N = 100;
a = randi(2,1,N)-1;  

% 差分编码
b = zeros(1,length(a)+1);
for k = 1:length(a)
    b(k+1) = xor(b(k),a(k));
end

senddpsk = 1-2*b;   % BPSK调制

% 增加频偏和相移
t = 0:length(senddpsk)-1;
f = 0.003;   
p = 0.2;
recvdpsk = senddpsk.*exp(j*(2*pi*f*t+p));   

% 差分译码
decoded = zeros(1,length(recvdpsk)-1);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 请在此处填空进行差分译码，结果存放在decoded中
for k= 1:length(recvdpsk)-1    %确定改变的decoded的长度
  decoded(k+1) =recvdpsk(k+1)* conj(recvdpsk(k)); %按照ppt中的方法，将recvdpsk信号延迟1位后取共轭，然后再与未延迟过的信号相乘得差分译码信号，然后再进行抽样判决。
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
