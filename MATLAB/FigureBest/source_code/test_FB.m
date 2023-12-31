close all

%-------------------------------------------------
figure
x = linspace(1,2,40);
plot(x,x.*cos(2*x),...
    x,x.^1.4.*cos(x)-3,...
    x,x.^1.6.*cos(3*x),...
    x,x.^2.*cos(2*x))

%-------------------------------------------------
figure
subplot(2,2,1)
bar([1 3 4;2 4 2; 3 5 1]);

subplot(2,2,2)
x = linspace(1,3,20);
plot(x,x.*cos(2*x),...
    x,x.^1.4.*cos(x)-3,...
    x,x.^1.6.*cos(3*x))

subplot(2,2,3)
x = linspace(1,10,30);
h = stem(x(1:end),sin(x(1:end)));

subplot(2,2,4)
scatter(randn(30,1),randn(30,1))
hold on
scatter(randn(30,1)+2,randn(30,1)+2)

%-------------------------------------------------
figure
x = randn(50,1);
y = randn(50,1);
z = 2-x.^2+y.^2;
scatter3(x,y,z,'k','fill')

%-------------------------------------------------
figure
subplot(211)
x = linspace(1,10,20);
y = sin(x);
errorbar(x,y,rand(1,length(x)))
hold on
errorbar(x+2,y+3,rand(1,length(x)))

subplot(212)
x = randn(30,4)*4;
boxplot(x)

%-------------------------------------------------
figure
subplot(3,3,[1 2 4 5])
bar([1 3 4;2 4 2; 3 5 1]);

subplot(3,3,3)
x = randn(30,4)*4;
bar([1 3 4;2 4 2; 3 5 1]);

subplot(3,3,6)
plot(magic(3))

subplot(3,3,7)
scatter(randn(15,1),randn(15,1))
hold on
scatter(randn(15,1)+2,randn(15,1)+2)

subplot(3,3,8)
x = linspace(1,10,10);
y = sin(x);
errorbar(x,y,rand(1,length(x)))
hold on
errorbar(x+2,y+3,rand(1,length(x)))

subplot(3,3,9)
x = linspace(1,6,30);
h = stem(x(1:3:end),sin(x(1:3:end)));

%-------------------------------------------------
figure
x = [2 4 6 8]-0.33;
y = [7 3 3 2];
errorbar(x,y,rand(1,length(x)),'LineStyle','none')
hold on
bar(x,y,0.3)
x = [2 4 6 8]+0.33;
y = [1 4 2 5];
errorbar(x,y,0.3+rand(1,length(x)),'LineStyle','none')
hold on
bar(x,y,0.3)
set(gca,'YLim',[0 8])











