%% 基站参数
%参考基站0
x1=-4;y1=-4;
%基站1
x2=0;y2=4;
%基站2
x3=4;y3=2;
%01到达时延
t1=1;
%02到达时延
t2=2;
%% 计算定位点坐标
r1=2;
r2=3;
x = 1.35717;
y = -0.301593;
line1 = single_hyperbola(x1,y1,x2,y2,r1);hold on
line2 = single_hyperbola(x1,y1,x3,y3,r2);hold on
%% 画图
plot (x1,y1,'ko','linewidth',1);hold on
plot (x2,y2,'bo','linewidth',1);hold on
plot (x3,y3,'bo','linewidth',1);hold on
plot (x,y,'ro','linewidth',1);hold on
hold off
line([x3,x],[y3,y],'linewidth',0.5);
line([x2,x],[y2,y],'linewidth',0.5);
line([x1,x],[y1,y],'linewidth',0.5);
line([x1,x2],[y1,y2],'linestyle','--','linewidth',0.5);
line([x1,x3],[y1,y3],'linestyle','--','linewidth',0.5);
line([x2,x3],[y2,y3],'linestyle','--','linewidth',0.5);
title('TDOA定位');
xlabel('基站坐标/km');
ylabel('定位信标距离/km');
legend('双曲线01','双曲线02', '基准点','基站1','基站2','定位点')

