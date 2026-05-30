% 电路拓扑
f = 13.56e6;
w = 2*pi*f;
C1 = 438e-12;
C2 = 280e-12;
Zc1 = 1 / (1i*w*C1);
Zc2 = 1 / (1i*w*C2);
% 阻抗计算
Z1 = ComplexImpedance(Zc1);
Z2 = ComplexImpedance(Zc2);
Zl = ComplexImpedance(5+1i*20);
Zs = ComplexImpedance(50);
Zin = Z1.parallel(Zl)+Z2
Zout = Z1.parallel(Zs + Z2)
% S 参数
S11 = abs(Zin.ztos())
S22 = abs(Zout.ztos())

