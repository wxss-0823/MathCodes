%% 直角坐标
% x = 1:1000;
% y = (x-5).*((x.^2).^(1/3));
% y = x.^x;
% y = x.^(1.5);
% plot(x,abs(y));
% x = 0:0.01:pi;
% y = sin(x).^4;
% plot (x,y),hold on
%% 偏导数图像
% fsurf(@(x,y) sqrt(abs(x.*y))./sqrt(x.^2+y.^2));grid on;
% fsurf(@(x,y) sqrt(x.*y)./sqrt(x.^2+y.^2));grid on;
% fsurf(@(x,y) x.*y./(x.^2+y.^2));grid on;
% fsurf(@(x,y) x.^2.*y./(x.^2+y.^2));grid on;
% fsurf(@(x,y) (x.^2-y.^2)./(x.^2+y.^2));grid on;
% fsurf(@(x,y) (x.^2+y.^2).*sin(1./(x+y)));grid on;
% fsurf(@(x,y) (x.^2+y.^2).*sin(1./(x.^2+y.^2)));grid on;
% fsurf(@(x,y) exp(sqrt(x.^4+y.^2)));grid on;
% fsurf(@(x,y) x.^2.*y./(x.^4+y.^2));grid on;
% fsurf(@(x,y) sin(x.^2.*y)./(x.^2+y.^2));grid on;
% fsurf(@(x,y) (x.^2+y.^2).*x.*log(x));grid on;
% fsurf(@(x,y) sqrt(x.^2+y.^2));grid on;
% fsurf(@(x,y) sqrt(x.^2+y.^2)+y);grid on;
% fsurf(@(x,y) x.*y);grid on;
% plot(x,abs((1+x).^(1./x)));
% plot(x,x);hold on
% plot(x,log(x));
%% 无穷级数
% Sn = zeros(1,10e5);
% sum = 0;
% for x=0:0.1:1
%     for i=2:length(Sn)
%         sum = sum + 1/(i*log(i));
%         % sum = sum + 1/i;
%         % sum = sum + 1/(i^2);
%         % sum = sum +(x)^i;
%         % sum = sum + (-1)^i/(sqrt(i)+(-1)^i);
%         Sn(i) = Sn(i) + sum;
% 
%     end
%     plot(Sn);hold off
%     pause(0.1);
% end
%% 极坐标
% %伯努利双扭线
% theta = 0:0.01:2*pi;
% r = sqrt(cos(2.*theta));
% polarplot(theta , real(r));
%心形线
% theta = 0:0.01:2*pi;
% r =1-sin(theta);
% polarplot(theta, real(r));
% %二重积分
% theta = 0:0.01:pi/4;
% r=sec(theta);
% polarplot(theta,real(r));
%% radio wave propagation
% %光滑平面地面电波传播的双线反射模型
% %传播距离
% d = 0:0.001:500;
% %d0处场强E0
% d0 = 100;
% Pxigma = 10;
% E0 = sqrt(Pxigma*30)/d0;
% %发射天线和接收天线架高
% ht = 50;
% hr = 30;
% %发射波波长
% lamda = 5;
% %直射波和反射波传播距离差
% delta = hr*ht*2./d;
% %直射波和反射波传播相位差
% theta = 2*pi.*delta/lamda;
% %自由空间d处场强
% Etot = 2*E0*d0./d.*sin(theta/2);
% %场强的分贝形式
% EdB = 10*log(abs(Etot));
% %Etot-d图像
% figure(1)
% plot(d,Etot);
% title('Etot-d')
% ylabel('Etot');
% xlabel('d');
% %EdB-d图像
% figure(2)
% plot(d,EdB);
% title('EdB-d');
% ylabel('EdB');
% xlabel('d');
%% 方波傅里叶级数
% clear;
% clf;
% %直流分量
% DC = 1; 
% %谐波次数
% N = 100;
% for k=1:N
%     %每个谐波分量对应的傅里叶系数
%     X(k) = sin(k*pi/2)/(k*pi/2);
% end
% %第一个元素DC为直流分量的系数，后面的X为前面计算出的各谐波分量的傅里叶系数
% X=[DC X];
% Ts=0.001;
% %周期的区间
% t=-1:Ts:1-Ts;
% L=length(t);
% %矩形脉冲的一个周期的幅值
% x=2*[zeros(1, L/4) ones(1, L/2) zeros(1, L/4)];
% figure(1);
% %第1个谐波
% xN=X(1)*ones(1, length(t));
% %K个谐波的叠加
% for k=2:N
%     xN=xN+X(k)*2*cos(pi * (k-1)*t);
%     %绘制K个谐波的叠加
%     plot(t, xN);
%     hold on;
%     plot(t, x, 'r');
%     hold off;
%     pause(0.1);
% end

