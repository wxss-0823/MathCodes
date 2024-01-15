%读取MP3文件
[audio_data,fs] = audioread('余雨 - 再见深海（微亮的瞬间）.mp3');
T = 1/fs;
N = length(audio_data);
f = 100000/N;
n = 1:1:N;
whistle = cos(2*pi*f*n*T)';

%叠加正弦波
audio_data_left = audio_data(:,1);
audio_data_right = audio_data(:,2);
audio_data_left_noisy = audio_data_left + whistle;
audio_data_right_noisy = audio_data_right + whistle;

% %时域波形，MP3有两段频谱
% figure(1)
% subplot(2,1,1)
% plot(audio_data_left_noisy(:,1))
% subplot(2,1,2)
% plot(audio_data_right_noisy(:,1))

%频域波形，叠加正弦波后
audio_data_left_noisy_f = fft(audio_data_left_noisy);
Nf = length(audio_data_left_noisy_f);
audio_data_right_noisy_f = fft(audio_data_right_noisy);
%画频谱
figure(2)
subplot(2,2,1)
plot(abs(fftshift(audio_data_left_noisy_f)))
subplot(2,2,2)
plot(abs(fftshift(audio_data_right_noisy_f)))
subplot(2,2,3)
plot(abs(fftshift(fft(audio_data_left))))
subplot(2,2,4)
plot(abs(fftshift(fft(audio_data_right))))

%滤波
% audio_data_left_noisy_f(abs(audio_data_left_noisy_f)>6e5) = 0;

figure(3)
subplot(2,1,1)
plot(audio_data(:,1))
subplot(2,1,2)
plot(audio_data_left_filter_t)





