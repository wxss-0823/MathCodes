%��������x1(n)��x2(n)��ѭ���������
function [y] = circonvt(x1,x2,N)
if length(x1)>N
    error('N������ڵ���x1�ĳ���');
end
if length(x2)>N
    error('N������ڵ���x2�ĳ���');
end
x1=[x1 zeros(1,N-length(x1))];
x2=[x2 zeros(1,N-length(x2))];
m=[0:1:N-1];
x2=x2(mod(-m,N)+1);
H=zeros(N,N);
for n=1:1:N
    H(n,:)=cirshift(x2,n-1,N);%":"���ض�ά�ȵ�����Ԫ�ؽ�������
end
y=x1*H';
end

