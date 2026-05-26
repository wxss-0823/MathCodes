clear;
clc;
close all;

load("mini-step.mat")

abs_step = Step + 454;
scatter(Step, Z, '.')

delta_Z = zeros(1, length(Z)-1);
for i=1:1:length(Z)-1
    delta_Z(i) = Z(i+1) - Z(i);
end

delta_C = zeros(1, length(C)-1);
for i=1:1:length(C)-1
    delta_C(i) = C(i+1) - C(i);
end

omega = 40.68e6;
ideal_delta_C = 6.25e-16;
ideal_C = 4.5e-12:ideal_delta_C:8e-12 - ideal_delta_C;
ideal_step = 1:1:length(ideal_C);
ideal_delta_Z = ideal_delta_C ./ (ideal_C .^ 2 * omega);

figure(2)
% subplot(2, 1, 1)
tiledlayout(2, 1)
ax1 = nexttile;
delta_step = 1:1:length(Z)-1;
scatter(delta_step, delta_Z, '.')
title(ax1, "Delta Z")
xlabel(ax1, "step/n");ylabel(ax1, "\DeltaZ(\Omega)")
% scatter(ideal_step, ideal_delta_Z, 'b.')
% hold on
% subplot(2, 1, 2)
% hold on
ax2 = nexttile;
scatter(delta_step, delta_C, '.')
title(ax2, "Delta C")
xlabel(ax2, "step/n");ylabel(ax2, "\DeltaC(pF)")

