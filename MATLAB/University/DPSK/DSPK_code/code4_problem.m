% 卷积码编译码实验
clear
close all

N = 100000;
a = randi(2,1,N) - 1;                           % 信源产生           
Constraint = 7;
trel = poly2trellis(Constraint, [171, 133]);     % 生成网格
b = [a, zeros(1,Constraint - 1)];               % 结尾处理, 在消息的结尾添加 Constraint-1 个零
c = convenc(b, trel);                           % 调用库函数所生成卷积码
sendbpsk = 1 - c * 2;                           % BPSK调制

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 改变下面代码中的信噪比绘制信噪比曲线
Eb_N0 = -2;
snr = Eb_N0 + 5;

recvbpsk = awgn(sendbpsk,snr,'measured')   % 加入噪声
bit = vitdec(recvbpsk, trel, 5*Constraint, 'term', 'unquant');  % 卷积译码
bit = bit(1:N);
ber_nocoding = mean(abs((sign(recvbpsk) - sendbpsk)/2));
ber_coding = mean(abs(bit - a));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
semilogy(Eb_N0, ber_nocoding, 'o'); hold on;
semilogy(Eb_N0, ber_coding, 'o'); 
grid on;
legend('译码前','译码后')
xlabel('信噪比SNR')
ylabel('误码率BER')
