data = load ('修改的通用型忆阻器用于逻辑.txt');
% 提取第二列电阻的数据，寻找峰值
resistor = data(:, 2);
time = data(:, 1);
x = 1:1:length(resistor);
[rpeaks, loc] = findpeaks(resistor, x);
rons = [];
roffs = [];
time1 = [];
time2 = [];

for i = 1:length(rpeaks)
    if rpeaks(i) > 6e4
        roffs = [roffs, rpeaks(i)];
        time1 = [time1, time(loc(i))];
    else 
        rons = [rons, rpeaks(i)];
        time2 = [time2, time(loc(i))];
    end
end

figure(1)
subplot(2,1,1)
plot(time1, roffs)
subplot(2,1,2)
plot(time2, rons)
data_out1 = [time1;roffs]';
data_out2 = [time2;rons]';
save 忆阻器高阻值曲线.txt data_out1 -ascii
save 忆阻器低阻值曲线.txt data_out2 -ascii