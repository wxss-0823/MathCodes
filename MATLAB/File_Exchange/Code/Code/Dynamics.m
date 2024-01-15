clc;clear
global c
c=5;
q=0.98; 
h =0.01;t0=0;tfinal=100 ;
y0=[1; 1; 1;]; 
[t, y] = fde12(q,@chao_SimpleLorenz,t0,tfinal,y0,h);
figure;plot(y(1,1000:8000),y(3,1000:8000),'b');
[Texp,Lp]=lya_cu_whyle_FDE12(3,@SimLorenz_ly,@fde12,0,2,500,y0,h,q);
figure;plot(Texp,Lp)


clc;clear
h =0.01;t0=0;tfinal=100;
y0=[1;1;1]; 
L=250;
Q=linspace(0.9,1,L);
Ly=zeros(3,L);
figure
for i=1:L
    q=Q(i);   
    [t, y] = fde12(q,@chao_SimpleLorenz,t0,tfinal,y0,h);
    data=y(3,3000:end);
    temp=0;
    for j=2:length(data)-1
        if data(j)>data(j-1) && data(j)>data(j+1)
            plot(q,0.03*data(j),'.b','markersize',1);
            hold on
            temp=temp+1;
            if temp>=50
                break;
            end
        end
    end
    [Texp,Lp]=lya_cu_whyle_FDE12(3,@SimLorenz_ly,@fde12,0,2,200,y0,h,q);
    Ly(:,i)=Lp(:,end);
     disp(i)
end
set(gca,'tickdir','out')
xlabel('\it{q}')
ylabel('\it{z}_{max} \times 0.03, LEs')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');
plot(Q,Ly(1,:),'r','linewidth',1)
plot(Q,Ly(2,:),'g','linewidth',1)




clc;clear
h =0.01;t0=0;tfinal=100;y0=[.1;.1;.1]; 
q=0.92;num=100;


step=1;
Y=StepFDE12Lorenz(5,q,h,y0,step,num);
x=Y(:,1);y=Y(:,2);z=Y(:,3);
figure
plot3(x(300:end),z(300:end),y(300:end),'b')
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


step=2;
Y=StepFDE12Lorenz(5,q,h,y0,step,num);
x=Y(:,1);y=Y(:,2);z=Y(:,3);
figure
plot3(x,z,y,'r')
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




L=250;
Q=linspace(0.9,1,L);
Ly=zeros(3,L);
figure
for i=1:L
    q=Q(i);
    
    [t, y] = fde12(q,@chao_SimpleLorenz,t0,tfinal,y0,h);
    data=y(3,3000:end);
    temp=0;
    for j=2:length(data)-1
        if data(j)>data(j-1) && data(j)>data(j+1)
            plot(q,0.03*data(j),'.b','markersize',1);
            hold on
            temp=temp+1;
            if temp>=50
                break;
            end
        end
    end
     disp(i)
end
