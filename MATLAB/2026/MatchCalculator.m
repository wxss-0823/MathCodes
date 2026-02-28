%% 如何理解 Match 的匹配原理
clc
clear
close all
% 求解 Match 目标阻抗
% 定义句柄函数，将复数变量转换为实部虚部
function F = complex_eqns(x)
  Z0 = 50 + 0 * 1i;
  % 假设 Plasma 阻抗已知
  Zp = 5.4 - 76.3 * 1i;
  % x = [real(Zm), imag(Zm)]
  Zm = x(1) + 1i*x(2);

  % 为了满足功率输出最大化，Match 输出阻抗应该为 Plasma 阻抗复共轭
  % Zm = -35.725+24.4212i
  % eq1 = Zm * Z0 / (Zm + Z0) - conj(Zp);

  % 同时 Match 的输入阻抗应该为 Z0
  % Zm = 35.725+24.4212i
  eq2 = Zm * Zp / (Zm + Zp) - Z0;
  
  % 返回实部和虚部
  % F = [real(eq1); imag(eq1); real(eq2); imag(eq2)];
  % F = [real(eq1); imag(eq1)];
  F = [real(eq2); imag(eq2)];
end
% 求解方程
options = optimoptions('fsolve', 'Display', 'final', 'MaxIterations', 1000, 'Algorithm', 'Levenberg-Marquardt');
initial_guess = [1, 1]; % 初始猜测值
[x_sol, fval] = fsolve(@complex_eqns, initial_guess, options);

Zm_sol = x_sol(1) + 1i*x_sol(2);
% eq1 = fval(1) + 1i*fval(2);
eq2 = fval(1) + 1i*fval(2);

disp('数值解：')
disp(['Zm = ', num2str(Zm_sol)])
disp('残差：')
% disp(['Eq1 = ', num2str(eq1)])
disp(['Eq2 = ', num2str(eq2)])
