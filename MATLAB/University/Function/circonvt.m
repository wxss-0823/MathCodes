%计算序列x1(n)和x2(n)的循环卷积函数
function [y] = circonvt(x1,x2,N)
if length(x1)>N
    error('N必须大于等于x1的长度');
end
if length(x2)>N
    error('N必须大于等于x2的长度');
end
x1=[x1 zeros(1,N-length(x1))];
x2=[x2 zeros(1,N-length(x2))];
m=[0:1:N-1];
x2=x2(mod(-m,N)+1);
H=zeros(N,N);
for n=1:1:N
    H(n,:)=cirshift(x2,n-1,N);%":"对特定维度的所有元素进行索引
end
y=x1*H';
end

