num = [1];
den = [1 -0.88 0.61];
[z,p,K] = tf2zp(num,den);

z = [0;1;1];
p = [0.4;0.4400 + 0.6453i;0.4400 - 0.6453i];
K = 1;
[num,den] = zp2tf(z,p,K)
printsys(num,den,'z')

figure;
freqz(num,den);

[z,p,K] = tf2zp(num,den)