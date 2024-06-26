%% 系统相位
% w = -5:0.01:5;
% X = (1i*w-2)./(1i*w+2);
% argx = angle(X);
% plot(argx)
% figure
% plot(atan(2*w./(w.^2-4)))
% figure
% plot(pi-2*atan(w/2))
% figure
% plot(abs(X))
%% 动态心
% x = -1.8:0.01:1.8;
% for a = 0:0.1:20
%     y = abs(x).^(2/3)+0.9.*(3.14-x.^2).^(1/2).*sin(a*pi.*x);
%     plot(x,real(y),'r');
%     pause(0.02);
% end
%% 防伪标签
% %先转换字符类型，再转换数据类型
% cha = char("disp('作者:wxss')");%转化为字符类型
% 
% A = double(cha);%将字符串转换为Unicode类型
% 
% eval(char([100,105,115,112,40,39,20316,32773,58,119,120,115,115,39,41]))%转化回字符串,并于eval执行命令
% 
% %不转换字符类型，直接转换数据类型
% B = double("disp('作者:wxss')");%double内用双引号，此时判断不为字符串类型，转换失败NaN
% 
% C = double('disp("作者:wxss")');%double内用单引号，此时判断为字符串类型，转换成功
% %为防止歧义，必须使用不同的两种引号，导致内部命令必须为双引号，若想使用单引号，则需将B中的内容用char转换
% 
% eval(char([100,105,115,112,40,34,20316,32773,58,119,120,115,115,34,41]));%eval执行命令
% 
% %两种写法虽然结果相同，但是一个命令中为双引号，转译后为34，另一个为单引号转移后为39
% char(34,39)
% 
% copy = char("print('作者：王锡胜舜')");
% copy = double(copy);
%% 冲激函数
% x = -4:0.1:4;
% y = dirac(x.^2-9);
% idx = y == Inf; % find Inf
% y(idx) = 1;     % set Inf to finite value
% stem(x,y)
%% 输入输出信号拟合
% 读取数据
load data.txt
% 多项式拟合次数
r = 3;
% 赋值
R0 = data(:, 2);
t = data(:, 1);
y0 = data(:, 3);
x0 = data(:, 4);
% 获取多项式系数，降幂排序
p = polyfit(x0, y0, r);
y = polyval(p,x0);
R = zeros(length(y),1);
for i = 1:1:length(y)
    if y(i)/x0(i) < 0
        R(i) = 0;
    else 
        R(i) = y(i)/x0(i);
    end
end

figure(1)
subplot(2,1,1);
plot(t, y0);
subplot(2,1,2);
plot(t, y);
figure(2)
subplot(2,1,1);
plot(t, R);
subplot(2,1,2);
plot(t, R0);
save p 
%% 论文忆阻器多项式拟合参数
% I0 = 0.12e-3;
% g1 = 0.2;
% g3 = 20;
% E = 0.3;
% t = 0:0.01:5;
% Vmem = sin(2*t);
% imem = I0 - g1.*(Vmem-E) + (1/3)*g1.*(Vmem-E).^3;
% plot(Vmem./imem);