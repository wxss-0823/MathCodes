%% Joglekar Window
p = [1, 9, 100];
for i = 1:length(p)
    x = 0:0.001:1;
    J = 1-(2*x-1).^(2*p(i));
    figure(1)
    plot(x,J);hold on
end
ylabel('f(x)');
xlabel('x');
% title('Joglekar Window')
legend('p=1','p=9','p=100');
hold off
%% Biolek Window
p = [1, 9, 100];
for i = 1:length(p)
    x = 0:0.001:1;
    y1 = 1-(x-heaviside(x)).^(2*p(i));
    y2 = 1-(x-heaviside(-x)).^(2*p(i));
    B = y1+y2;
    figure(2)
    plot(x,y1);hold on
    plot(x,y2);hold on
    % plot(x,B/max(B));hold on
end
ylabel('f(x)');
xlabel('x');
% title('Biolek Window')
hold off
legend('p=1', '','p=9', '','p=100');
%% Error
error = B/max(B)-J;
figure(3)
plot(x,error);
