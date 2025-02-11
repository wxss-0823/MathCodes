%% initialize
% data length
N = 345;
% formula1's denominator
f1_denominator = 1;
% formula1
y1 = 0;
% formula1's limit
lim1 = zeros(1, N);
% formula2's denominator
f2_denominator = N;
% formula2
y2 = 1;
% formula2's limit
lim2 = zeros(1, N);
%% formula defination
% general formula1
for i = 1:1:N
    f1_denominator = 1;
    for j = 1:2:2*i-1
        f1_denominator = f1_denominator * j;
    end
    y1 = y1 + 1/f1_denominator;
    lim1(i) = y1;
end
% general formula2
lim2(1) = 1;
lim2(2) = 1/2;
for i = N:-1:3
    f2_denominator = i-1;
    for j = i-1:-1:2
        f2_denominator = (j-1) / (f2_denominator+1);
    end
    y2 = 1 / (1+f2_denominator);
    lim2(i) = y2;
end
%% complete formula
% plot error curve
formula_lim = lim1 + lim2;
answer = sqrt(pi*exp(1)/2);
error = abs(formula_lim-answer);
figure(1)
subplot(2,1,2);
plot(error);
% plot limit curve
subplot(2,1,1);
plot(formula_lim);
hold on
yline(answer,'r');
figure(2)
sliceformula = formula_lim(325:345);
plot(sliceformula)
yline(answer,'r')
