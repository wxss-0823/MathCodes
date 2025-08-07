% load data
twf = slotMt;
[rSlot, cSlot] = size(slotMt);
% Constant var initialize
RB = 18e3;
symbolBw = 25e3;
nRB = 510/2;
f0 = 45e6;
dacRate = 72e7;
dacRes = 16;
carrierBw = 10e6;
carrierInterval = 25e3;
slotTime = 14.167;

% Sample var
nDACSample = dacRate/RB;
nSample = nDACSample;
nPoints = nRB*nSample*rSlot;
ts = 1/RB/nSample;
bitTime = ts*nSample/2*1000;
fs = 1/ts;
df = fs/nPoints;

% Series data
seriesTwf = zeros(1, nPoints);
for i=1:1:rSlot
  seriesTwf(1, (i-1)*cSlot+1:i*cSlot) = slotMt(i, :);
end

% Set t step
t = zeros(1, nPoints);
for i = 1:1:nPoints
  t(1, i) = (i-1)*ts*1000;
end

% Select useful time
stopT = rSlot * slotTime;

% Plot time domain waveform
subplot(2,1,1)
plot(t(1,:), seriesTwf(1,:))
xlabel('t/ms');ylabel('Amplitude');
title('Time Domain Waveform')
for i=1:1:rSlot
  xline(34*bitTime+slotTime*(i-1),'--r');xline(504*bitTime+slotTime*(i-1),'--r');
end
xlim([0, stopT])

% Set f step
f = zeros(1, nPoints);
for i = 1:1:nPoints
  f(1, i) = (i-1)*df/1e6;
end

% Select useful frequency
fwf = abs(fft(seriesTwf));

% Figure var
f0Point = f0/df;
startF = f0-symbolBw;
startN = ceil(startF/df);

% Plot frequency domain waveform
subplot(2,1,2)
stopF = f0+symbolBw*rSlot;
stopN = ceil(stopF/df);
plot(f(1, startN:stopN),fwf(1, startN:stopN))
xlabel('f/MHz');ylabel('Amplitude')
title('Frequency Domain waveform')
xline((f0-symbolBw/2)/1e6,'--r');
for i=1:1:rSlot
xline((f0+(i-1/2)*symbolBw)/1e6,'--r');
end
xlim([startF/1e6, stopF/1e6])

% Calculate power in dBfs
% Quantify(fwf(1, startN:stopN), dacRes);

% Write to bit file
% path = "C:\Users\Wxss\Desktop\matlab.txt";
% pattern = 'w+b';
% fid = fopen(path, pattern);
% [rWordMt, cWordMt] = size(wordMt);
% fwrite(fid, wordMt, 'char');
% fclose(fid);
