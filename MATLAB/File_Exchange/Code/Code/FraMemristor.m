clc;clear
global A w
A=4;w=0.1;
a=1;b=0.1;
h =0.01;t0=0;tfinal=1000 ;
q=1;
[t,x] = fde12(q,@FraV,t0,tfinal,1,h);
M=a-b.*abs(x);
I=A*sin(2*pi*w*t);
V=M.*I;
plot(I(50000:end),V(50000:end),'m')
hold on

q=0.9;
[t,x] = fde12(q,@FraV,t0,tfinal,1,h);
M=a-b.*abs(x);
I=A*sin(2*pi*w*t);
V=M.*I;
plot(I(50000:end),V(50000:end),'r')
hold on

q=0.8;
[t,x] = fde12(q,@FraV,t0,tfinal,1,h);
M=a-b.*abs(x);
I=A*sin(2*pi*w*t);
V=M.*I;
plot(I(50000:end),V(50000:end),'b')
hold on

q=0.7;
[t,x] = fde12(q,@FraV,t0,tfinal,1,h);
M=a-b.*abs(x);
I=A*sin(2*pi*w*t);
V=M.*I;
plot(I(50000:end),V(50000:end),'g')
hold off
grid on
legend('{\itq}=1','{\itq}=0.9','{\itq}=0.8','{\itq}=0.7')

xlabel('{\iti}({\itt})')
ylabel('{\itv}({\itt})')
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');