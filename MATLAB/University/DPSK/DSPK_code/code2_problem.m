% ��Ԫͬ��ʵ��
clear
close all

% ��Ԫ��������
Ts = 8;

% ��Դ����
N = 16;
a = randi(2,1,N)*2-3;                % ����ת��
Preamble = [1 1 1 1 0 1 0 1 1 0 0 1 0 0 0 0]*2-1;   % ǰ����
PreambleLen = length(Preamble);
b = [ Preamble a ];

g = rcosdesign(0.25, 6, Ts, 'normal');     % ������(֪ʶ�㣺�����˲���)

% s = upfirdn(b,g,Ts);              % ��������ȼ����������仰
d = [ b; zeros(Ts-1,length(b)) ];  % �������(֪ʶ�㣺������������) 
d = d(:).';
s = conv(d, g(end:-1:1));

% ȥ��ǰ��Ĺ��ɲ���
s = s((length(g)+1)/2:end-(length(g)-1)/2);

% �������ʱ��ƫ��
pading = zeros(1, randi(Ts,1));
s = [ pading s ];   

% ͬ��ͷ����
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ڴ˴���ռ���s��Preamble����أ�����洢��RecvCorr��
P=[+1 +1 +1 +1 -1 +1 -1 +1 +1 -1 -1 +1 -1 -1 -1 -1 ];
for k=1:16
    X=s(k:Ts:k+15*Ts);
    RecvCorr(k)=dot(X,P)
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[peak,pos] = max(RecvCorr)
figure;
plot(RecvCorr); grid on;


% ��Ԫ�����о�
posData = pos+PreambleLen*Ts;
bit = sign(s(posData:Ts:posData+(N-1)*Ts));

figure; hold on; 
plot(s); 
plot(posData:Ts:posData+N*Ts-1,s(posData:Ts:posData+N*Ts-1),'o');

figure;
plot(bit - a)
