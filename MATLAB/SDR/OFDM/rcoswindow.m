%窗函数子程序，子程序名称：rcoswindow.m
function [rcosw] = rcoswindow(beta,Ts)
%输入参数：beta为升余弦窗滚降系数，Ts为IFFT长度加循环前缀长度
t=0:(1+beta)*Ts;
rcosw = zeros(1,(1+beta)*Ts);
%计算升余弦窗，共有三部分
for i=1:beta*Ts;
    rcosw(i)=0.5 + 0.5*cos(pi + t(i)*pi/(beta*Ts));  %计算升余弦窗第一部分
end
rcosw(beta*Ts+1:Ts) = 1;   %计算升余弦窗第二部分
for j=Ts + 1:(1+beta)*Ts + 1;
    rcosw(j-1) = 0.5*cos((t(j) - Ts) * pi/(beta*Ts));
    %计算升余弦第三部分
end
rcosw = rcosw';  %转换为列矢量
