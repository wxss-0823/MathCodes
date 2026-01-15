# Var declaraton
R1 = 0.5
C1 = 510E-12
C2 = 155E-13
C3 = 460E-12
R2 = 3
L1 = LinRange(0.7E-6, 1.4E-6, 8)
# Frequency
f = 13.56E6
w = 2*pi*f
# Impedence initialize
Z_h = zeros(1, length(L1))
Z_c = zero(1)
Z = zeros(1, length(L1))
# Heater impedengce
Z_h = R2 .+ im*(w.*L1.-1/(w*C2).- 1/(w*C3))
Z_c = R1 + im*(-1/(w*C1))

Z = Z_h.*Z_c./(Z_c.+Z_h)

Re_z = real(Z)
Im_z = imag(Z)

f_x = ones(1, length(L1)).*f

subplot(1, 2, 1)
scatter(f_x, Re_z; linewidths=1.5)
subplot(1, 2, 2)
scatter(f_x, Im_z; linewidths=1.5)
