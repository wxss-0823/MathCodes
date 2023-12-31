%序列x(n)的循环移位
n=[0:10];x=8*(0.8).^n;N=11;
y=crishift(x,6,N);
subplot(2,1,1);stem(n,x);
title('序列x(n)');xlabel('n');ylabel('x(n)');
subplot(2,1,2);stem(n,y);
title('x(n)的循环移位');xlabel('n');ylabel('y(n)');
