Rs = -100 : 1 : 100;
fx1 = 199 * Rs.^2 - 1200 * Rs - 560000;
% plot(Rs, fx1)
hold on
Ri = -100 : 1 : 100;
fx2 = Ri .^2 - 21000 * Ri - 1550000;
% plot(Ri, fx2)

figure(1)
fx3 = (Rs + 100) .* Ri ./ (Rs + Ri + 100) - 155;
plot3(Rs, Ri, fx3)
hold on
fx4 = Rs .* (Ri + 100) ./ (Rs + Ri + 100) -56;
plot3(Rs, Ri, fx4)