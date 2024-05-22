data = load ('逻辑忆阻器电阻最值变化.txt');
% 提取第二列电阻的数据，寻找峰值
[peaks, loc] = findpeaks(data(:, 1));
