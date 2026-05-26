clear
clc
close all
%% 相对、绝对下发
% 结论：每 3s 取数，开三次平均，容值再所需范围内基本线性
fileName = [

    % "3-30pF_MED_AVER-1_相对位置", ...
    % "3-30pF_MED_AVER-1_相对位置1", ...
    % "3-30PF_SLOW_AVER-1_绝对位置", ...
    % "3-30PF_MED_AVER-1_绝对位置", ...
    % "3-30PF_MED_AVER-3_绝对位置", ...
    % "3-30PF_MED_QVER-1_绝对位置"
    "3-30PF_MED_QVER-1_绝对位置_3S", ...
    "3-30PF_MED_AVER-3_绝对位置_3S", ...
    "3-30PF_MED_AVER-3_绝对位置_3S_2", ...
    "3-30PF_MED_AVER-3_绝对位置_3S_3"
    ];

maxDeltaD = zeros(length(fileName), 1);
% range = 200:400;
% range = 200:1:385;

for i=1:1:length(fileName)
    figure(i)
    tempFile = fileName(i);
    data = load(tempFile + ".txt");
    [row, col] = size(data);
    
    % scatter(1:1:row, data(:, 1), '.')
    
    deltaD = zeros(row-1, 1);
    for j=1:1:row-1
        deltaD(j) = data(j+1, 1) - data(j, 1);
    end

    range = 1:1:length(deltaD);

    maxDeltaD(i) = mean(deltaD(range));

    scatter(range, deltaD(range, 1), '.')
    title(tempFile, 'Interpreter', 'none')
    fprintf("%s Less then 0: %d\n", fileName(i), sum(deltaD(range) < 0))
end

%% 仪表稳定性 —— 10%
% 结论：SLOW/MED-AVG3 下仪表抖动几乎一致

stable = [
    "机械零点_SLOW_AVER-1", ...
    "机械零点_MED_AVER-1", ...
    "机械零点_MED_AVER-3", ...
    "30pF_SLOW_AVER-1", ...
    "30pF_MED_AVER-1", ...
    "30pF_MED_AVER-3", ...
    "15pF_SLOW_AVER-1", ...
    "15pF_MED_AVER-1", ...
    "15pF_MED_AVER-3", ...
    ];

for i=1:1:length(stable)
    % figure(i)
    data = load(stable(i) + ".txt");
    % plot(data(:, 1))
    % title(stable(i), 'Interpreter','none')
    dev = (max(data(:, 1))-min(data(:, 1))) / max(maxDeltaD) * 100;
    fprintf("%s: %.3f%%\n", stable(i), dev)
    % fprintf("%s: %10.3e\n", stable(i), dev)
end