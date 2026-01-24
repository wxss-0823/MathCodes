%% Data Wave
% SubCarrier Amplitude Factor1
amFactor1 = [1, 3, 5, 4, 2, 3, 1];

% SubCarrier Amplitude Factor2
amFactor2 = [3, 2, 4, 1, 5, 2, 4];

% SubCarrier Amplitude Factor3
amFactor3 = [5, 2, 3, 2, 1, 3, 4];

% Plot Original Data
subplot(3,1,1)
stem(amFactor1)
xlabel("Frequency")
ylabel("Amplitude")
subplot(3,1,2)
stem(amFactor2)
xlabel("Frequency")
ylabel("Amplitude")
subplot(3,1,3)
stem(amFactor3)
xlabel("Frequency")
ylabel("Amplitude")
%% Symbol Wave
% Basic Sin Waves
w0 = 5;
fftN = 2^10;
res = pi/fftN/w0;
sinLen = 2*pi/w0;
sinWaves = zeros(length(amFactor1), sinLen/res);
for i = 1:1:length(amFactor1)
    for t = 1 : 1 : sinLen/res
        sinWaves(i, t) = sin(i* w0 * t * res);
    end
end

% Symbol Wave1
symbolWave1 = zeros(1, length(sinWaves));
for t = 1 : 1 : sinLen/res
    for i = 1 : 1 : length(amFactor1) 
        symbolWave1(t) = amFactor1(i) * sinWaves(i, t) + symbolWave1(t);
    end
end

% Symbol Wave2
symbolWave2 = zeros(1, length(sinWaves));
for t = 1 : 1 : sinLen/res
    for i = 1 : 1 : length(amFactor2) 
        symbolWave2(t) = amFactor2(i) * sinWaves(i, t) + symbolWave2(t);
    end
end

% Symbol Wave2
symbolWave3 = zeros(1, length(sinWaves));
for t = 1 : 1 : sinLen/res
    for i = 1 : 1 : length(amFactor3) 
        symbolWave3(t) = amFactor3(i) * sinWaves(i, t) + symbolWave3(t);
    end
end

% Plot SymbolWave
% figure
symbolWave = zeros(1, 3 * length(sinWaves));
symbolWave(1, :) = [symbolWave3, symbolWave2, symbolWave1];
symbolLen = length(symbolWave);
subSymbolLen = length(symbolWave1);
phase = 0 : res : 3*sinLen-res;
% plot(phase, symbolWave)
hold on
xlabel("t")
ylabel("Amplitude")

% Decoration
T = 2*pi/w0;
for i = 1:1:ceil(3*sinLen/T)
    % xline(i*T, "--")
end
%% Parameter
% Sample Period
Ts = 2*pi/fftN;
% Path number & Time delay
pathN = 3;
pathAmFactor = [0.7, 0.4, 0.1];
timeDelayN = [400, 2^8, 2^9];
%% Multi Path Signal with Time Delay
% Delay Multi Path Signals
multiSymbolWave = zeros(pathN, symbolLen);
for i = 1:1:pathN
    for k = 1:1:symbolLen - timeDelayN(i)
        multiSymbolWave(i, k + timeDelayN(i)) = pathAmFactor(i) * symbolWave(k);
    end
end

% Plot Multi Path Signals
figure 
subplot(pathN + 1, 1, 1)
plot(phase, symbolWave);
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(3*sinLen/T)
    xline(i*T, "--r")
end

for i = 1: 1: pathN
    subplot(pathN + 1, 1, i + 1)
    plot(phase, multiSymbolWave(i,:));
    xlabel("Path " + num2str(i))
    ylabel("Amplitude")
    hold on
    % Decoration
    for j = 0:1:floor(3*sinLen/T)-1
        xline(j*T + 3*timeDelayN(i)/symbolLen*sinLen, "--r")
    end
end

% Add up
figure
subplot(2,1,1)
plot(phase, symbolWave)
hold on
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(3*sinLen/T)
    xline(i*T, "--r")
end

multiPathSignalAddup = zeros(1, symbolLen);
for i = 1: 1: pathN
    multiPathSignalAddup(1, :) = multiPathSignalAddup(1, :) + multiSymbolWave(i, :);
end

multiPathSignalAddup(1, :) = multiPathSignalAddup(1, :) +  symbolWave(1, :);
% subplot(2, 1, 2)
plot(phase, multiPathSignalAddup, "--k")
title("Multi Path Signal with Time Delay")
%% Multi Path Signal with Protect Interval
% Insert Protect Interval into the Symbol Signal
protectInterval = zeros(1, 2^10);

% Initialize Protected Symbol Wave
protectSymbolWave1 = [protectInterval, symbolWave1];
protectSymbolWave2 = [protectInterval, symbolWave2];
protectSymbolWave3 = [protectInterval, symbolWave3];

protectSubSymbolLen = length(protectSymbolWave1);
protectSymbolWave = zeros(1, 3*protectSubSymbolLen);

protectSymbolWave(1, :) = [protectSymbolWave3, protectSymbolWave2, ...
    protectSymbolWave1];
protectSymbolLen = length(protectSymbolWave);


protectedPhase = 0: res: (protectSymbolLen-1)*res;

% Plot Multi Path Signal with Protect Interval
% figure
% plot(protectedPhase, protectSymbolWave);

% Decoration
for i = 1:1:floor(protectSymbolLen/protectSubSymbolLen)
    % xline(i*(protectSubSymbolLen-1)*res, "--r")
end

% Delay Multi Path Signal with Protect Interval
multiProtectSymbolWave = zeros(pathN, protectSymbolLen);

for i = 1:1:pathN
    for k = 1:1:protectSymbolLen - timeDelayN(i)
        multiProtectSymbolWave(i, k + timeDelayN(i)) = pathAmFactor(i) * protectSymbolWave(k);
    end
end

% Add up
subplot(2,1,2)
plot(protectedPhase, protectSymbolWave)
hold on
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(protectSymbolLen/protectSubSymbolLen)
    xline(i*(protectSubSymbolLen-1)*res, "--r")
end

multiPathProtectedSignalAddup = zeros(1, protectSymbolLen);
for i = 1: 1: pathN
    multiPathProtectedSignalAddup(1, :) = multiPathProtectedSignalAddup(1, :) + multiProtectSymbolWave(i, :);
end

multiPathProtectedSignalAddup(1, :) = multiPathProtectedSignalAddup(1, :) +  protectSymbolWave(1, :);
% subplot(2, 1, 2)
plot(protectedPhase, multiPathProtectedSignalAddup, "--k")
title("Multi Path Signal with Protected Interval and Time Delay")

% Plot Multi Path Protect Signals
figure 
subplot(pathN + 1, 1, 1)
plot(protectedPhase, protectSymbolWave);
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(protectSymbolLen/protectSubSymbolLen)
    xline(i*(protectSubSymbolLen-1)*res, "--r")
end

for i = 1: 1: pathN
    subplot(pathN + 1, 1, i + 1)
    plot(protectedPhase, multiProtectSymbolWave(i,:));
    xlabel("Path " + num2str(i))
    ylabel("Amplitude")
    hold on
    % Decoration
    for j = 0:1:floor(protectSymbolLen/protectSubSymbolLen)-1
        xline(j*(protectSubSymbolLen - 1)*res + timeDelayN(i) * res, "--r")
    end
end
%% Multi Path Symbol Wave with Cyclic Prefix
cyclicHeadLen = 2^10;

% Initialize Cyclic Symbol Wave
cyclicSymbolWave1 = [symbolWave1(subSymbolLen-cyclicHeadLen : end), symbolWave1];
cyclicSymbolWave2 = [symbolWave2(subSymbolLen-cyclicHeadLen : end), symbolWave2];
cyclicSymbolWave3 = [symbolWave3(subSymbolLen-cyclicHeadLen : end), symbolWave3];

cyclicSubSymbolLen = length(cyclicSymbolWave1);
cyclicSymbolWave = zeros(1, 3*cyclicSubSymbolLen);
cyclicSymbolLen = length(cyclicSymbolWave);

cyclicSymbolWave(1, :) = [cyclicSymbolWave3, cyclicSymbolWave2, cyclicSymbolWave1];

% Add Time Delay to Symbol Wave with Cyclic Prefix
multiCyclicSymbolWave = zeros(pathN, cyclicSymbolLen);

for i = 1:1:pathN
    for k = 1:1:cyclicSymbolLen - timeDelayN(i)
        multiCyclicSymbolWave(i, k + timeDelayN(i)) = pathAmFactor(i) * cyclicSymbolWave(k);
    end
end

cyclicPhase = 0 : res : (cyclicSymbolLen - 1)*res;

% Plot Multi Path Cyclic Signals
figure 
subplot(pathN + 1, 1, 1)
plot(cyclicPhase, cyclicSymbolWave);
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(cyclicSymbolLen/cyclicSubSymbolLen)
    xline(i*(cyclicSubSymbolLen-1)*res, "--r")
end

for i = 1: 1: pathN
    subplot(pathN + 1, 1, i + 1)
    plot(cyclicPhase, multiCyclicSymbolWave(i,:));
    xlabel("Path " + num2str(i))
    ylabel("Amplitude")
    hold on
    % Decoration
    for j = 0:1:floor(cyclicSymbolLen/cyclicSubSymbolLen)-1
        xline(j*(cyclicSubSymbolLen - 1)*res + timeDelayN(i) * res, "--r")
    end
end

% Add up
figure
plot(cyclicPhase, cyclicSymbolWave)
hold on
xlabel("t")
ylabel("Amplitude")

% Decoration
for i = 1:1:floor(cyclicSymbolLen/cyclicSubSymbolLen)
    xline(i*(cyclicSubSymbolLen-1)*res, "--r")
end

multiPathCyclicSignalAddup = zeros(1, cyclicSymbolLen);
for i = 1: 1: pathN
    multiPathCyclicSignalAddup(1, :) = multiPathCyclicSignalAddup(1, :) + multiCyclicSymbolWave(i, :);
end

multiPathCyclicSignalAddup(1, :) = multiPathCyclicSignalAddup(1, :) +  cyclicSymbolWave(1, :);
% subplot(2, 1, 2)
plot(cyclicPhase, multiPathCyclicSignalAddup, "--k")
title("Multi Path Signal with Cyclic Prefix and Time Delay")
%% Recovery Original Signal from Multi Path Signal with Cyclic Prefix and Time Delay
% Split Symbol Wave1 Add-up Series
splitCyclicAddupSymbolWave1 = multiPathCyclicSignalAddup(2*(cyclicSubSymbolLen+1) + cyclicHeadLen : end);

% Generate Protect Matrix
splitCyclicAddupSymbolWaveLen = length(splitCyclicAddupSymbolWave1);
cyclicSignalChannelEstimateMatrix = zeros(splitCyclicAddupSymbolWaveLen);
cyclicSignalChannelEstimateSeries = zeros(1, splitCyclicAddupSymbolWaveLen);

for i = 1 : 1 : pathN
    cyclicSignalChannelEstimateSeries(timeDelayN(i) + 1) = pathAmFactor(i);
end
cyclicSignalChannelEstimateSeries(1) = 1;

% Cyclic Shift Signal-Channel Estimate Series
for i = 1:1:splitCyclicAddupSymbolWaveLen
    cyclicSignalChannelEstimateMatrix(i, :) = circshift(cyclicSignalChannelEstimateSeries, [0, i - 1]);
end

% Generate Recovery Matrix
recoveryCyclicSignalSeries = zeros(1, splitCyclicAddupSymbolWaveLen);
recoveryCyclicSignalSeries(1, :) = splitCyclicAddupSymbolWave1 / cyclicSignalChannelEstimateMatrix;

% Plot Compare figure
subplot(3,1,1)
recoveryPhase = 0 : res : sinLen - res;
plot(recoveryPhase, symbolWave1)
hold on
plot(recoveryPhase, recoveryCyclicSignalSeries, "--k")
hold on
plot(recoveryPhase, splitCyclicAddupSymbolWave1);
legend("Original Symbol", "Recovery Symbol", "Add Up Symbol")
xlabel("t")
ylabel("Amplitude")
title("Recovery Symbol from Multi Path Signal with Cyclic Prefix")
%% Recovery Original Signal from Multi Path Signal with Protect Interval and Time Delay
% Split Symbol Wave1 Add-up Series
splitProtectAddupSymbolWave1 = multiPathProtectedSignalAddup(end-2047 : end);

% Generate Cyclic Matrix
splitProtectAddupSymbolWaveLen = length(splitProtectAddupSymbolWave1);
protectSignalChannelEstimateMatrix = zeros(splitProtectAddupSymbolWaveLen);
protectSignalChannelEstimateSeries = zeros(1, splitProtectAddupSymbolWaveLen);

for i = 1 : 1 : pathN
    protectSignalChannelEstimateSeries(timeDelayN(i) + 1) = pathAmFactor(i);
end
protectSignalChannelEstimateSeries(1) = 1;

% Cyclic Shift Signal-Channel Estimate Series
for i = 1:1:splitProtectAddupSymbolWaveLen
    protectSignalChannelEstimateMatrix(i, :) = circshift(protectSignalChannelEstimateSeries, [0, i - 1]);
end

% Generate Recovery Matrix
recoverySignalSeries = zeros(1, splitProtectAddupSymbolWaveLen);
recoverySignalSeries(1, :) = splitProtectAddupSymbolWave1 / protectSignalChannelEstimateMatrix;

% Plot Compare figure
subplot(3,1,2)
plot(recoveryPhase, symbolWave1)
hold on
plot(recoveryPhase, recoverySignalSeries, "--k")
hold on
plot(recoveryPhase, splitProtectAddupSymbolWave1);
legend("Original Symbol", "Recovery Symbol", "Add Up Symbol")
xlabel("t")
ylabel("Amplitude")
title("Recovery Symbol from Multi Path Signal with Protect Interval")
