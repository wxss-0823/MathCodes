%����������
n=[-10:1:10];blta=-0.1+0.3j;
x=exp(blta*n);
subplot(2,2,1);stem(n,real(x));title('ʵ��');xlabel('n');
subplot(2,2,2);stem(n,imag(x));title('�鲿');xlabel('n');
subplot(2,2,3);stem(n,abs(x));title('����');xlabel('n');
subplot(2,2,4);stem(n,(180/pi)*angle(x));title('��λ');xlabel('n');%�Ƕ�