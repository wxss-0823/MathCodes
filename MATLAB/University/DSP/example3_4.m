%����x(n)��ѭ����λ
n=[0:10];x=8*(0.8).^n;N=11;
y=crishift(x,6,N);
subplot(2,1,1);stem(n,x);
title('����x(n)');xlabel('n');ylabel('x(n)');
subplot(2,1,2);stem(n,y);
title('x(n)��ѭ����λ');xlabel('n');ylabel('y(n)');
