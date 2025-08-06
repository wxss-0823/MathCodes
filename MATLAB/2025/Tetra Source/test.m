% load data
twf = slotMt;
% var initialize
RB = 18E3;
nRB = 510/2;
nSample = 2500;
nPoints = nRB*nSample;
ts = 1/RB/nSample;
bitTime = 27.78e-6;

% set t step
t = zeros(1, nPoints);
for i = 1:1:nPoints
  t(1, i) = (i-1)*ts*1000;
end

subplot(2,1,1)
plot(t(1,:), twf(1,:))
xlabel('t/ms');ylabel('Amplitude');
title('Time Domain Waveform')
xlim([0, 14.167])
xline(bitTime*34*1000,'--r');xline(bitTime*504*1000,'--r');

% set f step
fs = 1/ts;
df = 2*fs/nPoints;
f = zeros(1, nPoints);
for i = 1:1:nPoints
  f(1, i) = (i-1)*df;
end

fwf = fftshift(abs(fft(twf)));
subplot(2,1,2)
plot(f(1, 3.184e5:3.1910e5),fwf(1, 3.184e5:3.1910e5))
xlabel('f/Hz');ylabel('Amplitude')
title('Frequency Domain waveform')
xline(4.5e7-2.5e4,'--r');xline(4.5e7+2.5e4,'--r');

% Write to bit file
fid = fopen("C:\Users\Wang Xishengshun\Desktop\wordMt.txt",'w+b');
[rWordMt, cWordMt] = size(wordMt);
fwrite(fid, wordMt, 'char');
fclose(fid);
