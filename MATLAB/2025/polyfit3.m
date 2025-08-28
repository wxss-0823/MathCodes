sampleX = [-40 -20 0 20 40];
sampleY = [-5 -2 0 1 5];

P = polyfit(sampleX, sampleY, 3);
T = -40:0.1:85;

y = polyval(P, T);
plot(T, y, sampleX, sampleY, "r*");

fid = fopen('temppolyfit3.txt', 'wt');
fprintf(fid, '%f\n', y);
fclose(fid);