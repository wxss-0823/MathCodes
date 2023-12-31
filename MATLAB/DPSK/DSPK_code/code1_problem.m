% 基带码元成型实验
clear
close all

% 码元采样点数
Ts = 8;

% 信源产生
N = 16;
a = randi(2,1,N)*2-3;                 % 极性转换

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 请在此处替换为升余弦滚降脉冲
% g = ones(1,Ts);                    % 方波
g = rcosdesign(0.25, 6, Ts, 'normal');     % 升余弦(知识点：滚降滤波器)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% s = upfirdn(a,g,Ts);     % 这个函数等价于如下三句话
d = [ a; zeros(Ts-1,length(a)) ];  % 脉冲成型(知识点：基带波形生成) 
d = d(:).';
s = conv(d, g(end:-1:1));

% 去掉前后的过渡波形
s = s((length(g)+1)/2:end-(length(g)-1)/2);

% 动态现实不同采样位置的结果
figure; 
for k = 1:8
    figure(k);
    plot(s); hold on;
    plot(k:Ts:length(s), s(k:Ts:length(s)), 'o'); grid on;
    ylim([-1.1 1.1])
end
