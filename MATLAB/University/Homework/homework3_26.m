n=0:2;x1=[1,2,2];
n=0:3;x2=[1,2,3,4];
N=5;
y=circonvt(x1,x2,N);
x1=[x1 zeros(1,N-length(x1))];
x2=[x2 zeros(1,N-length(x2))];
figure(1)
n=0:4;
subplot(3,1,1);stem(n,x1);
title('序列x1(n)');xlabel('n');ylabel('x1(n)');
subplot(3,1,2);stem(n,x2);
title('序列x2(n)');xlabel('n');ylabel('x2(n)');
subplot(3,1,3);stem(n,y);
title('序列y(n)');xlabel('n');ylabel('y(n)');
N=8;
y=circonvt(x1,x2,N);
x1=[x1 zeros(1,N-length(x1))];
x2=[x2 zeros(1,N-length(x2))];
figure(2)
n=0:7;
subplot(3,1,1);stem(n,x1);
title('序列x1(n)');xlabel('n');ylabel('x1(n)');
subplot(3,1,2);stem(n,x2);
title('序列x2(n)');xlabel('n');ylabel('x2(n)');
subplot(3,1,3);stem(n,y);
title('序列y(n)');xlabel('n');ylabel('y(n)');