%% 基站参数及到达角
%基站1
x1=0;y1=0;
%基站2
x2=1;y2=0;
%到达角1
alpha_1=30;
%到达角2
alpha_2=120;
k1=tan(alpha_1/180*pi);
k2=tan(alpha_2/180*pi);
%% 计算定位点坐标
x = (k1*x1-k2*x2-y1+y2)/(k1-k2)
y = (k1*k2*(x1-x2)-k2*y1+k1*y2)/(k1-k2)
R = sqrt(x^2+y^2);
R1 = sqrt((x-x1)^2+(y-y1)^2);
R2 = sqrt((x-x2)^2+(y-y2)^2);
theta = atan(y/x);
%% 画图
plot(x1,y1,'bo','linewidth',1);hold on
plot(x2,y2,'bo','linewidth',1);hold on
plot(x,y,'ro','linewidth',1);hold off
line([x2,x],[y2,y],'linewidth',0.5);
line([x1,x],[y1,y],'linewidth',0.5);
line([x1,x],[y,y],'color','k','linestyle','--','linewidth',0.5);
line([x,x],[y1,y],'color','k','linestyle','--','linewidth',0.5);
title('AOA定位');
xlabel('基站坐标/km');
ylabel('定位点的坐标/km');
legend('基站1','基站2','定位点');