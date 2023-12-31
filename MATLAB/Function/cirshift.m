function [y] = cirshift(x,m,N)%循环移位函数
if length(x)>N;
    error('N必须大于等于x(n)的长度');
end
x=[x zeros(1,N-length(x))];
n=0:N-1;
n=mod(n-m,N);
y=x(n+1);
end

