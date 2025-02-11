%读取MP3文件
[audio_data,fs]=audioread('余雨 - 再见深海（微亮的瞬间）.mp3');
%时域波形，MP3有两段频谱
figure(1)
subplot(2,1,1)
plot(audio_data(:,1))
subplot(2,1,2)
plot(audio_data(:,2))
% audiowrite("left_余雨 - 再见深海（微亮的瞬间）.mp3",audio_data(:,1),fs)
figure(2)
plot(audio_data)
%播放音频
% sound(audio_data,fs)
%音乐频谱
N = length(audio_data');
f = (-N/2:N/2-1)*fs/N;
audio_left = audio_data(:,1)';
audio_right = audio_data(:,2)';
audio_data_left_f = fft(audio_left,N);
audio_data_right_f = fft(audio_right,N);
figure(3)
subplot(2,1,1)
plot(f,real(fftshift(audio_data_left_f)))
axis([-1e4,1e4,-5e4,5e4])
subplot(2,1,2)
plot(f,real(fftshift(audio_data_right_f)))
axis([-1e4,1e4,-5e4,5e4])
%低通滤波
left_LPF_f = filter(LPF,audio_data_left_f);
right_LPF_f = filter(LPF,audio_data_right_f);
figure(4)
subplot(2,1,1)
plot(f,real(fftshift(left_LPF_f)))
axis([-1e4,1e4,-5e4,5e4])
subplot(2,1,2)
plot(f,real(fftshift(right_LPF_f)))
axis([-1e4,1e4,-5e4,5e4])
%将滤波后的频谱还原回时域
left_LPF_t = ifft(left_LPF_f,N);
right_LPF_t = ifft(right_LPF_f,N);
left_LPF_t = real(left_LPF_t');
right_LPF_t = real(right_LPF_t');
figure(5)
subplot(2,1,1)
plot(left_LPF_t)
axis([0,14e6,-1,1])
subplot(2,1,2)
plot(right_LPF_t)
axis([0,14e6,-1,1])
audio_LPF = [left_LPF_t,right_LPF_t];
figure(6)
plot(audio_LPF)
axis([0,14e6,-1,1])
% sound(audio_LPF,fs)
% audiowrite("LPF_1.mp3",audio_LPF,fs)
