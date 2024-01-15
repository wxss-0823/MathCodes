%% 线性内插(一阶保持）
% dt = 0.01;
% N = 64;
% t = -N:dt:N-dt;
% W = 1;
% h1 = ((W/pi)*sinc(W*t/pi)).^2;
% figure
% subplot(2,1,1)
% plot(t,h1);
% axis([-20 20 0 0.1])
% xlabel('t')
% ylabel('h(t)')
% title('time-wareform')
% H1 = fft(h1,64);
% H1 = fftshift(H1);
% subplot(2,1,2)
% w = -32:1:32-1;
% plot(w,real(H1))
% axis([-10 10 0 1e-3])
% xlabel('w')
% ylabel('H(w)')
% title('frequncy-wareform')
%% LFP时域和频域特性
% sinc函数的频域矩形窗
% dt = 0.1;
% N = 64;
% t = -N:dt:N-dt;
% h2 = sin(pi*t) ./ (pi*t);
% figure
% subplot(2,1,1)
% plot(t,h2);
% axis([-N N -0.2 1]);
% xlabel('t')
% ylabel('h(t)')
% title('time-wareform')
% H2 = fft(h2,2^10);
% w = -1:1/512:1-1/512;
% subplot(2,1,2)
% plot(w,fftshift(abs(H2)/max(abs(H2))))
% axis([-0.5 0.5 0 1]);
% xlabel('w')
% ylabel('H(w)')
% title('frequncy-wareform')
% 时域矩形窗
% L = 20;
% x = [ones(1, L-1) zeros(1, L-1)];
% figure
% subplot(2,1,1)
% t = -29:1:29-1;
% plot(t,[zeros(1,L),x])
% axis([-30 30 0 1])
% xlabel('t')
% ylabel('h(t)')
% title('time-wareform')
% X = ifft(x,512);
% subplot(2,1,2)
% w = -1:1/256:1-1/256;
% plot(w,fftshift(real(X)/max(real(X))))
% xlabel('w')
% ylabel('H(w)')
% title('frequncy-wareform')
% axis([-1 1 -0.5 1])