function [y] = cirshift(x,m,N)%ѭ����λ����
if length(x)>N;
    error('N������ڵ���x(n)�ĳ���');
end
x=[x zeros(1,N-length(x))];
n=0:N-1;
n=mod(n-m,N);
y=x(n+1);
end

