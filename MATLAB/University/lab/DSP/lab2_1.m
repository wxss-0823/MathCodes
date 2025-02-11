%读取音频文件
[s,fs]=audioread('SunshineSquare.wav');
%以秒为单位显示原音时域波形
t=(0 : length(s)-1)/fs;
subplot(2,2,1); plot(t,s); title('原音时域波形');
xlabel('t/s'); ylabel('s(t)'); grid on;
%以Hz为单位显示原音幅频响应
Sk=abs(fft(s));
f=(0 : length(Sk)-1)*fs/length(Sk);
figure(1)
subplot(2,2,2); plot(f,Sk); title('原音幅频响应');
xlabel('f/Hz'); ylabel('S(k)'); grid on;
axis([-fs/10,fs*11/10,0,2*10e3]);
%找出噪音频率并过滤
for n=2 : (length(Sk)-1)
    if(Sk(n)>4500 && Sk(n-1)<Sk(n) && Sk(n)>Sk(n+1))
        f=n/length(Sk);
        s=My_Filter(s,f);
    end
end
%滤除信号在0频率处的噪音
s=My_Filter(s,0);
%将滤除高频噪音后的信号在时域上滤掉嗒声
s(abs(s)>0.7)=0;
%显示滤后时域波形
t=(0 : length(s)-1)/fs;
figure(1)
subplot(2,2,3); plot(t,s); title('滤后时域波形');
xlabel('t/s'); ylabel('s(t)'); grid on;
%显示滤后幅频响应
Sk=abs(fft(s));
f=(0 : length(Sk)-1)*fs/length(Sk);
subplot(2,2,4); plot(f,Sk); title('滤后幅频响应');
xlabel('f/Hz'); ylabel('S(k)'); grid on;
%播放滤后音频并保存在D盘
% sound(s,fs);
% audiowrite('D:\Filtered.wav',s,fs);



