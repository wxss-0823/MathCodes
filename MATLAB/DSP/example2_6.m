%������2.6�����е����Ծ��
n=0:4;x=[1,1,1,1,1];
n=0:6;h=(1.10).^n;
[y]=conv(x,h);
ny=length(y);
n=0:ny-1;
stem(n,y);xlabel('n');ylabel('y(n)');