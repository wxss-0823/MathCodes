%产生x1(n)序列
n=[-5:5];
x=3*impseq(-3,-5,5)-impseq(3,-5,5);
subplot(2,2,1);stem(n,x);
xlabel('n');ylabel('x1(n)');
%产生x2(n)序列
n=[0:20];
x1=n.*(stepseq(0,0,20)-stepseq(10,0,20));
x2=10*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
x=x1+x2;
subplot(2,2,2);stem(n,x);
xlabel('n');ylabel('x2(n)');


 

