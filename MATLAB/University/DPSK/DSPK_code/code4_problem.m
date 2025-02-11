% ����������ʵ��
clear
close all

N = 100000;
a = randi(2,1,N) - 1;                           % ��Դ����           
Constraint = 7;
trel = poly2trellis(Constraint, [171, 133]);     % ��������
b = [a, zeros(1,Constraint - 1)];               % ��β����, ����Ϣ�Ľ�β��� Constraint-1 ����
c = convenc(b, trel);                           % ���ÿ⺯�������ɾ����
sendbpsk = 1 - c * 2;                           % BPSK����

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �ı���������е�����Ȼ������������
Eb_N0 = -2;
snr = Eb_N0 + 5;

recvbpsk = awgn(sendbpsk,snr,'measured')   % ��������
bit = vitdec(recvbpsk, trel, 5*Constraint, 'term', 'unquant');  % �������
bit = bit(1:N);
ber_nocoding = mean(abs((sign(recvbpsk) - sendbpsk)/2));
ber_coding = mean(abs(bit - a));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
semilogy(Eb_N0, ber_nocoding, 'o'); hold on;
semilogy(Eb_N0, ber_coding, 'o'); 
grid on;
legend('����ǰ','�����')
xlabel('�����SNR')
ylabel('������BER')
