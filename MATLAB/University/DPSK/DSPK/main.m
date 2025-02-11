close all

run_type = 0;           % ���滹���豸����

%% ϵͳ����
Fs = 200e3;           % ϵͳ������
Rs = 10e3;                 % ��Ԫ����
SFile = 'C:\Users\Wang Xishengshun\OneDrive\�ĵ�\MATLAB\DSPK\SendBit.mat'; %��ȡ�����ļ�
SigLen = 200e3;        % �źŲ�����������Ӧʱ�䳤��Ϊ1��

%% �ŵ�����
Amax = 1;               % ����źŷ���
Pmax = pi;              % �����λƫ��
Fmax = 16;           % ���Ƶƫ����λHz
Tmax = 0.005;           % ���ʱƫ����λ��
SNR = 0;                % �����

%% �����
[SendBit,SendBpsk,SendSig,MsgLen]  = DpskSysTx(Fs, Rs, SFile, SigLen);



%% �ŵ�
if run_type==0
    [RecvSig, ChannelParameter ] = DpskSysChannel(SendSig,Fs,Amax,Pmax,Fmax,Tmax,SNR);
else
    [RecvSig] = XSRP_RFLoopback(SendSig);
end


%% ���ջ�
[RecvSigFiltered,RecvDpskDemod,RecvCorr,RecvSymbolSampled,RecvBit] = DpskSysRx(Fs,Rs,MsgLen,RecvSig);


%% ����ͳ��
ErrNum = sum(xor(SendBit(1,1:end-1),RecvBit(1,1:end-1)));

%% ���δ�ӡ
% �������ݻ��ߴ�ӡ���߻�����
figure;plot(SendBit);title('SendBit������Դ����');
figure;plot(SendBpsk);title('SendBpsk����ֱ�����BPSK��Ԫ');
figure;plot(SendSig);title('SendSig��DPSK�����ź�');
figure;plot(real(RecvSig));title('real(RecvSig)��DPSK�����ź�');
figure;plot(real(RecvSigFiltered));title('real(RecvSigFiltered)���˲������ź�');
figure;plot(real(RecvDpskDemod));title('real(RecvDpskDemod)��DPSK������ź�');
figure;plot(RecvCorr);title('RecvCorr��preamble��ؽ��');
figure;plot(real(RecvSymbolSampled));title('real(RecvSymbolSampled)��������Ԫ');
figure;plot(RecvBit);title('RecvBit���������');
figure;plot(abs(RecvBit-SendBit));title('abs(RecvBit-SendBit)�����շ��ͱ��ش���');

ChannelParameter  % ��ӡ�ŵ�����
ErrNum  % ��ӡ���������



