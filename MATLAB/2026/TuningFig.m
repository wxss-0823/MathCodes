clear
clc
close all
% Resonable Frequency
% Series
f = 100:1e2:1e6;
w = 2 * pi .* f;
c = 40e-12;
l = 700e-6;
r = 100;
z = r + 1i * (w.*l - 1./(w.*c));
figure(1)
plot(abs(z))
hold on
plot(imag(z))
legend("z", "imag z")
% Shunt
f = 0:1e3:2e6;
w = 2 * pi .* f;
z = 1./((r.*c./l)+1i.*(w.*c-1./(w.*l)));
figure(2)
plot(abs(z))
hold on
plot(imag(z))
hold on
plot(real(z))
legend("z", "imag z", "real z")