%-------------------------------ABM---------------------------
clc;clear
global c
c=5;
q=0.98; 
h =0.005;t0=0;tfinal=100 ;
y0=[1; 1; 1;]; 
[t, y] = fde12(q,@chao_SimpleLorenz,t0,tfinal,y0,h);
figure
plot(y(1,3000:end),y(3,3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(y(1,3000:end,1),y(3,3000:end),y(2,3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');

%-------------------------------------ADM----------------------------------
clc;clear
c=5;q=0.98;h=0.01;N=20000;x0=[1,1,1]; 
[x,y,z]=SimpleFratral(c,q,h,N,x0);
figure
plot(x(3000:end),z(3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(x(3000:end),z(3000:end),y(3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');

%-----------------------------Sayed Solution----------------------
clc;clear
c=5;q=0.98;h=0.01;N=20000;x0=[1,1,1]; 
[x,y,z]=SimpleSayed(c,q,h,N,x0);
figure
plot(x(3000:end),z(3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(x(3000:end),z(3000:end),y(3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');


%-----------------------------G-L Solution----------------------
clc;clear
c=5;q=0.98;h=0.01;N=20000;x0=[1,1,1]; 
[x,y,z]=SimpleGL(c,q,h,N,x0);
figure
plot(x(3000:end),z(3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(x(3000:end),z(3000:end),y(3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');

%----------------------------Conformable Solution----------------------
clc;clear
c=5;q=0.98;h=0.01;N=20000;x0=[1,1,1]; 
yout=SimpleConfor(x0,h,q,c,N);
x=yout(1,:);y=yout(2,:);z=yout(3,:);
figure
plot(x(3000:end),z(3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(x(3000:end),z(3000:end),y(3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');

%----------------Conformable 2---------------------

clc;clear
c=5;h=0.01;q=0.98;N=20000;x0=[1,1,1]; 
[T,x,y,z]=SimpleConfor2(x0,h,q,c,N);


figure
plot(x(3000:end),z(3000:end),'r')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
figure
plot3(x(3000:end),z(3000:end),y(3000:end),'b')
xlim([-15 15])
set(gca,'tickdir','out')
xlabel('\it{x}')
ylabel('\it{z}')
zlabel('\it{y}')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');


