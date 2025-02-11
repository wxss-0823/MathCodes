% 匹配滤波实验
clear
close all

% 码元采样点数
Ts = 8;

% 信源产生
N = 16;
a = randi(2,1,N)*2-3;                % 极性转换

g = rcosdesign(0.5, 8, Ts, 'sqrt');     % 平方根升余弦(知识点：滚降滤波器)

% mt_send = upfirdn(a,g,Ts);     % 这个函数等价于如下三句话
d = [ a; zeros(Ts-1,length(a)) ];  % 脉冲成型(知识点：基带波形生成) 
d = d(:).';
s = conv(d, g(end:-1:1));

% 信道加入相偏
p = 30/180*pi;
x = s * exp(j*p);

% 匹配滤波
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 改变下面代码实现匹配滤波，结果滤波结果存储在r中
r = x;
%时域匹配滤波
ht=conj(fliplr(x));
r=conv(x,ht);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = r(length(g)-3:end-length(g));
figure(9)
plot (s);
% 现实不同采样位置的结果
figure; 
for k = 1:8
    figure(k); hold on;
    plot(real(r)); plot(imag(r)); 
    plot(k:Ts:length(r), real(r(k:Ts:length(r))), 'o');
    plot(k:Ts:length(r), imag(r(k:Ts:length(r))), 's')
end
