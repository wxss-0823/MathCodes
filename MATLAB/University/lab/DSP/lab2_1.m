%��ȡ��Ƶ�ļ�
[s,fs]=audioread('SunshineSquare.wav');
%����Ϊ��λ��ʾԭ��ʱ����
t=(0 : length(s)-1)/fs;
subplot(2,2,1); plot(t,s); title('ԭ��ʱ����');
xlabel('t/s'); ylabel('s(t)'); grid on;
%��HzΪ��λ��ʾԭ����Ƶ��Ӧ
Sk=abs(fft(s));
f=(0 : length(Sk)-1)*fs/length(Sk);
figure(1)
subplot(2,2,2); plot(f,Sk); title('ԭ����Ƶ��Ӧ');
xlabel('f/Hz'); ylabel('S(k)'); grid on;
axis([-fs/10,fs*11/10,0,2*10e3]);
%�ҳ�����Ƶ�ʲ�����
for n=2 : (length(Sk)-1)
    if(Sk(n)>4500 && Sk(n-1)<Sk(n) && Sk(n)>Sk(n+1))
        f=n/length(Sk);
        s=My_Filter(s,f);
    end
end
%�˳��ź���0Ƶ�ʴ�������
s=My_Filter(s,0);
%���˳���Ƶ��������ź���ʱ�����˵����
s(abs(s)>0.7)=0;
%��ʾ�˺�ʱ����
t=(0 : length(s)-1)/fs;
figure(1)
subplot(2,2,3); plot(t,s); title('�˺�ʱ����');
xlabel('t/s'); ylabel('s(t)'); grid on;
%��ʾ�˺��Ƶ��Ӧ
Sk=abs(fft(s));
f=(0 : length(Sk)-1)*fs/length(Sk);
subplot(2,2,4); plot(f,Sk); title('�˺��Ƶ��Ӧ');
xlabel('f/Hz'); ylabel('S(k)'); grid on;
%�����˺���Ƶ��������D��
% sound(s,fs);
% audiowrite('D:\Filtered.wav',s,fs);



