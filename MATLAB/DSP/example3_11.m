%����FFTʵ�������˲�
%����ϵͳ�ĳ弤��Ӧ
b=[0.0181,0.0543,0.0543,0.0181];
a=[1,-1.7600,1.1829,-0.2781];
ch=impseq(0,0,20);n=0:20;
h=filter(b,a,ch)
%�����ź�����
x=cos(0.1*pi*n)+0.32*randn(size(n));
%�������Ծ��
L=length(x)+length(h)-1;
H=fft(h,L);
X=fft(x,L);
y=ifft(X.*H);
%��ͼ
subplot(3,1,1);plot(n,x);axis([0 20 -1.5 1.5]);
ylabel('�ź�X(n)');xlabel('n');
subplot(3,1,2);stem(n,h);axis([0 20 -0.5 0.5]);
ylabel('ϵͳ�弤��Ӧh(n)');xlabel('n');
n=0:L-1;
subplot(3,1,3);plot(n,y);axis([0 20 -1.5 1.5]);
ylabel('x(n)�˲��Ľ��y(n)');xlabel('n');