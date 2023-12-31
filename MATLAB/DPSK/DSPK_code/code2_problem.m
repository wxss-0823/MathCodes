% 码元同步实验
clear
close all

% 码元采样点数
Ts = 8;

% 信源产生
N = 16;
a = randi(2,1,N)*2-3;                % 极性转换
Preamble = [1 1 1 1 0 1 0 1 1 0 0 1 0 0 0 0]*2-1;   % 前导码
PreambleLen = length(Preamble);
b = [ Preamble a ];

g = rcosdesign(0.25, 6, Ts, 'normal');     % 升余弦(知识点：滚降滤波器)

% s = upfirdn(b,g,Ts);              % 这个函数等价于如下三句话
d = [ b; zeros(Ts-1,length(b)) ];  % 脉冲成型(知识点：基带波形生成) 
d = d(:).';
s = conv(d, g(end:-1:1));

% 去掉前后的过渡波形
s = s((length(g)+1)/2:end-(length(g)-1)/2);

% 增加随机时间偏移
pading = zeros(1, randi(Ts,1));
s = [ pading s ];   

% 同步头搜索
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 请在此处填空计算s和Preamble的相关，结果存储在RecvCorr中
P=[+1 +1 +1 +1 -1 +1 -1 +1 +1 -1 -1 +1 -1 -1 -1 -1 ];
for k=1:16
    X=s(k:Ts:k+15*Ts);
    RecvCorr(k)=dot(X,P)
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[peak,pos] = max(RecvCorr)
figure;
plot(RecvCorr); grid on;


% 码元采样判决
posData = pos+PreambleLen*Ts;
bit = sign(s(posData:Ts:posData+(N-1)*Ts));

figure; hold on; 
plot(s); 
plot(posData:Ts:posData+N*Ts-1,s(posData:Ts:posData+N*Ts-1),'o');

figure;
plot(bit - a)
