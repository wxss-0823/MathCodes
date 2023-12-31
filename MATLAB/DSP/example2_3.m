%产生复序列
n=[-10:1:10];blta=-0.1+0.3j;
x=exp(blta*n);
subplot(2,2,1);stem(n,real(x));title('实部');xlabel('n');
subplot(2,2,2);stem(n,imag(x));title('虚部');xlabel('n');
subplot(2,2,3);stem(n,abs(x));title('幅度');xlabel('n');
subplot(2,2,4);stem(n,(180/pi)*angle(x));title('相位');xlabel('n');%角度