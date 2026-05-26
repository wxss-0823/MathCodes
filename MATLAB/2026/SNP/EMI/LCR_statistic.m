clear;
clc;
close all;

% data1 = readmatrix("共模电感2026-02-13_14-50-52.csv");
% % data1 = readmatrix("2端口2026-02-13_15-41-18.csv");
% data2 = readmatrix("差模电感2026-02-13_14-45-42.csv");

data1 = readmatrix("改版后-共模电感2026-04-21_20-14-50.csv");
data2 = readmatrix("改版后-差模电感2026-04-21_20-13-04.csv");

% data1 = readmatrix("EMI 滤波板 LCR 2026-04-22_19-00-29.csv");

tick_labels = zeros(1, 8);
j = 1;
for i = -1:0.5:2.5
    tick_labels(j) = round(10^(i), 2);
    j = j+ 1;
end

%% 绘制共模电感图像
% 绘制 Ls-Z 图像
figure(1)
tiledlayout(2, 1)
ax1 = nexttile;
yyaxis right
scatter(log10(data1(:, 2)), data1(:, 3), '.')
ylabel(ax1, "Impedance/\Omega")
ylim(ax1, [-500, 6000])
yyaxis left
scatter(log10(data1(:, 2)), data1(:, 6), '.')
xticklabels(tick_labels)
xlabel(ax1, "log(f)/MHz")
ylabel(ax1, "Ls/\muH")
% ylim(ax1, [-1e-4, 7.5e-4])
ylim(ax1, [-5e-4, 18e-4])

% 标记虚部最接近 0 的点
start = 200;
stop = 300;
[~, offset] = min(abs(data1(start:stop, 5)));
min_idx = offset + start - 1;
result.frc = data1(min_idx, 2);
hold on
plot(log10(data1(min_idx, 2)), data1(min_idx, 6), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
text(log10(data1(min_idx, 2)), data1(min_idx, 6)+1e-4, ...
    sprintf("(%.4f, %.4f)", data1(min_idx, 2), data1(min_idx, 6)), ...
    "Fontsize", 9);
grid on

% 绘制 R-X 图像并标记虚部最接近 0 的点
ax2 = nexttile;
yyaxis left
scatter(log10(data1(:, 2)), data1(:, 5), '.')
ylabel(ax2, "Imag/\Omega")
hold on
plot(log10(data1(min_idx, 2)), data1(min_idx, 5), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
text(log10(data1(min_idx, 2)), data1(min_idx, 5)+200, ...
    sprintf("(%.4f, %.4f)", data1(min_idx, 2), data1(min_idx, 5)), ...
    "Fontsize", 9);
hold off
yyaxis right
scatter(log10(data1(:, 2)), data1(:, 4), '.')
ylabel(ax2, "Real/\Omega")
xticklabels(tick_labels)
xlabel(ax2, "log(f)/MHz")
ylim(ax2, [-500, 6000])
grid on


%% 绘制差模电感图像
% 绘制 Ls-Z 图像
figure(2)
tiledlayout(2, 1)
ax1 = nexttile;

yyaxis right
scatter(log10(data2(:, 2)), data2(:, 3), '.')
ylabel(ax1, "Impedance/\Omega")
ylim(ax1, [-500, 6000])
hold on
yyaxis left
scatter(log10(data2(:, 2)), data2(:, 6), '.')
xticklabels(tick_labels)
xlabel(ax1, "log(f)/MHz")
ylabel(ax1, "Ls/\muH")
ylim(ax1, [-2.5e-5, 5e-5])

% 标记虚部最接近 0 的点
start = 615;
stop = 630;
[~, offset] = min(abs(data2(start:stop, 5)));
min_idx = offset + start - 1;
hold on
plot(log10(data2(min_idx, 2)), data2(min_idx, 6), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
text(log10(data2(min_idx, 2)), data2(min_idx, 6)+1e-6, ...
    sprintf("(%.4f, %.4f)", data2(min_idx, 2), data2(min_idx, 6)), ...
    "Fontsize", 9);
grid on

% 绘制 R-X 图像
ax2 = nexttile;
yyaxis left
scatter(log10(data2(:, 2)), data2(:, 5), '.')
hold on
plot(log10(data2(min_idx, 2)), data2(min_idx, 5), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
text(log10(data2(min_idx, 2)), data2(min_idx, 5)+200, ...
    sprintf("(%.4f, %.4f)", data2(min_idx, 2), data2(min_idx, 5)), ...
    "Fontsize", 9);
ylabel(ax2, "Imag/\Omega")
yyaxis right
hold on
plot(log10(data2(min_idx, 2)), data2(min_idx, 5), 'ro', ...
    'MarkerSize', 5, 'MarkerFaceColor', 'r', 'LineWidth', 1.5)
text(log10(data2(min_idx, 2)), data2(min_idx, 5)+200, ...
    sprintf("(%.4f, %.4f)", data2(min_idx, 2), data2(min_idx, 5)), ...
    "Fontsize", 9);
hold off
scatter(log10(data2(:, 2)), data2(:, 4), '.')
ylabel(ax2, "Real/\Omega")
xticklabels(tick_labels)
xlabel(ax2, "log(f)/MHz")

grid on

% 打印谐振频率和谐振时的容值
result.Lcom = data1(1, 6);
result.Ldif = data2(1, 6);

result.frd = data2(min_idx, 2);
result.Ccom = 1 / ((2 * pi * result.frc * 1e6)^2 * result.Lcom) * 1e12;
result.Cdif = 1 / ((2 * pi * result.frd * 1e6)^2 * result.Ldif) * 1e12;

report_lines = sprintf(['Common mode resonance frequency: %.4f MHz\n', ...
    'Common mode parasitic capacitance reantance: %.4f pF\n', ...
    'Difference mode resonance frequency: %.4f MHz\n', ...
    'Difference mode resonance frequency: %.4f pF\n'], ...
    result.frc, result.Ccom, result.frd, result.Cdif);

fprintf("%s\n", report_lines)

