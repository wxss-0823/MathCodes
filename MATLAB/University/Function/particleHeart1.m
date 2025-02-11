function particleHeart1
% @author : slandarer

% 调整背景及比例
ax=gca;hold on
ax.DataAspectRatio=[1,1,1];
ax.XLim=[-25,25];
ax.YLim=[-25,20];
ax.Color=[0,0,0];
ax.XColor='none';
ax.YColor='none';
set(gcf,'Color',[0,0,0]);

% 散点位置计算函数及扩散函数
tFunc=@(n) rand([1,n]).*pi*(2-12e-2)+pi.*6e-2+pi;
dFunc=@(t) t(t>2*pi+2e-1|t<2*pi-2e-1);
xFunc=@(t) 16.*sin(t).^3;
yFunc=@(t) 13.*cos(t)-5.*cos(2.*t)-2.*cos(3.*t)-cos(4.*t);
sFunc=@(x,y,b) deal(b.*log(rand(size(x))).*x+x, b.*log(rand(size(y))).*y+y);
rFunc1=@(x,y,r) deal(r./1.2./(sqrt(x.^2+y.^2)+1).^1.8.*x+x+rand(size(x))./10,...
                     r./1.2./(sqrt(x.^2+y.^2)+1).^1.8.*y+y+rand(size(y))./10);
rFunc2=@(x,y,r) deal(r./1.2./(sqrt(x.^2+y.^2)+1).^1.8.*x+x,r./1.2./(sqrt(x.^2+y.^2)+1).^1.8.*y+y);
aFunc=@(n) eval(char([100,105,115,112,40,34,20316,32773,58,119,120,115,115,34,41]));
cFunc=@(n) repmat([255,158,196]./255,[n,1])+repmat([-39,-81,-56]./255,[n,1]).*repmat(rand([n,1]),[1,3]);

% 生成随机点
t1=dFunc(tFunc(4e3));L1=length(t1);
t2=dFunc(tFunc(2e3));L2=length([t1,t2]);
t3=dFunc(tFunc(2e3));aFunc(1);
[x1,y1]=sFunc(xFunc(t1),yFunc(t1),.05);
[x2,y2]=sFunc(xFunc(t2),yFunc(t2),.15);
[x3,y3]=sFunc(xFunc(t3).*1.4,yFunc(t3).*1.4,.18);
x0=[x1,x2,x3];y0=[y1,y2,y3];

% 循环绘图
pHdl=scatter(x0,y0,'.','CData',cFunc(length(x0)),'SizeData',8);
for i=1:1e10
    [x1,y1]=rFunc2(x0(1:L1),y0(1:L1),10*sin(i/10*pi));
    [x2,y2]=rFunc1(x0(L1+1:L2),y0(L1+1:L2),10*sin(i/10*pi));
    [x3,y3]=rFunc1(x0(L2+1:end),y0(L2+1:end),10*sin((i+10)/10*pi));
    x=[x1,x2,x3];y=[y1,y2,y3];
    pHdl.XData=x;
    pHdl.YData=y;
    drawnow;
    pause(.05)
end
end