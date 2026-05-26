clear;
clc;
close all;

load("all_cap.mat")
start = 1;
stop = 974;
tolerance = 0.3;
[~, col] = size(all_cap);
start_array = zeros(1, col);

for col=1:1:12
    loop_num = length(all_cap(:, col));
    for i=1:1:loop_num
        x_max = length(all_cap(start:stop, col));
        x = 1:2:x_max*2; 
        y = all_cap(start:stop, col); 

        [p, S] = polyfit(x, y, 1); 
        [f, delta] = polyval(p, x, S);
    
        if abs(y(1) - f(1)) < tolerance
            break
        else
            start = start + 1;
        end
    
    end

    % 绘制原始数据、线性拟合、95%预测区间（y±2Δ）
   
    % figureN = idivide(int16(col)-1, 3)+1;
    % figure(double(figureN))
    % sub_figureN = double(mod(col-1, 3)+1);
    % subplot(3,1,sub_figureN)
    % plot(x, y, '.')
    % hold on
    % plot(x, f, 'r-')
    % plot(x, f+2*delta, 'm--', x, f-2*delta, 'm--')
    % hold off
    % title("Linear Fit of Data with 95% Prediction Interval")
    % legend("Data", "Linear Fit", "95% Prediction Interval")
    
    % figureN = idivide(int16(col)-1, 3)+1;
    % figure(double(figureN))
    % sub_figureN = double(mod(col-1, 3)+1);
    % subplot(3,1,sub_figureN)
    all_x = 1:2:loop_num*2;
    all_y = all_cap(:, 1);
    [all_f, all_delta] = polyval(p, all_x, S);
    delta_f = all_f(600) - all_y(600);
    plot(all_x, all_y, 'b.')
    hold on 
    plot(all_x, all_f-delta_f, 'r-')
    title("Linear Fit of All Data")
    legend("All Data", "Linear Fit")
    
    fprintf("Start Step Pos: %d\nCapacitor Value: %f.2\n", start, all_cap(start, col))
    start_array(1, col) = start;
    start_array(2, col) = all_cap(start, col);
end
%% 大容值确定线性区，小容值判断拐点
clear;
clc;
close all;

load("all_cap.mat")

stop = 974;
loop_num = zeros(1, 12);
start_pos = zeros(2, 12);

% Confidence level: 2 - 95%, 3 - 99%
N = 2;

for col=1:1:12
    loop_num(1, col) = length(all_cap(:, col));
    % Lin area start position
    big_cap_start = floor(0.5 * loop_num(1, col));

    big_cap = all_cap(big_cap_start:stop, col);
    big_cap_x = big_cap_start * 2 : 2 : stop * 2;
    % Determine liner
    [p, S] = polyfit(big_cap_x, big_cap, 1);
    % All parameter
    all_x = 0:2:loop_num(1, col) * 2-2;
    one_cap = all_cap(:, col);
    [all_lin, sigma] = polyval(p, all_x, S);

    for row = 1: 1: loop_num(1, col)
        if abs(one_cap(row) - all_lin(row)) < N * sigma(row)
            start_pos(1, col) = row;
            start_pos(2, col) = one_cap(row);
            break
        end
    end

    figureN = idivide(int16(col)-1, 3)+1;
    figure(double(figureN))
    sub_figureN = double(mod(col-1, 3)+1);
    subplot(3,1,sub_figureN)
    plot(all_x, one_cap, 'b.', all_x, all_lin, 'r-')
    hold on
    plot(all_x, all_lin + N * sigma, 'm--', all_x, all_lin - N * sigma, 'm--')
    hold on
    % Add start postion mark point
    plot(all_x(start_pos(1, col)), one_cap(start_pos(1, col)), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
    text(all_x(start_pos(1, 1)), one_cap(start_pos(1, col)), ...
        sprintf('(%d, %.3f)', start_pos(1, col)*2, start_pos(2, col)), ...
        'FontSize', 9)
    % title("Linear Fit of Data with 95% Prediction Interval")
    % legend("Data", "Linear Fit", "95% Prediction Interval")
end

fprintf("Start step: %d\nStart Capacitor value: %.2fpF\nDeviation: %.2f\n", ...
    max(start_pos(1,:)) * 2, max(start_pos(2,:)), N * sigma(row))



error = zeros(1, 12);

for col=1:1:12
    lower_cap_end = start_pos(1, col);
    lower_cap = all_cap(1:lower_cap_end, col);
    low_x = 2:2:lower_cap_end*2;
    [p, S] = polyfit(low_x, lower_cap, 4);
    [low_lin, sigma1] = polyval(p, low_x, S);

    figureN = idivide(int16(col)-1, 3)+1;
    figure(double(figureN)+4)
    sub_figureN = double(mod(col-1, 3)+1);
    subplot(3,1,sub_figureN)
    plot(low_x, lower_cap, 'b.', low_x, low_lin, 'r-')
    hold on
    plot(low_x, low_lin + N * sigma1, 'm--', low_x, low_lin - N * sigma1, 'm--')
    % error_array = ;
    error(1, col) = max(abs(low_lin'-lower_cap));

end




