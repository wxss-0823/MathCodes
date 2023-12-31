clc;clear
T=0:0.001:5;
y1=Kern1(0.3,T);
y2=Kern1(0.5,T);
y3=Kern1(0.7,T);
y4=Kern1(1,T);
figure
plot(T,y1,'r','LineWidth',1)
hold on 

plot(T,y2,'g','LineWidth',1)
plot(T,y3,'b','LineWidth',1)
plot(T,y4,'m','LineWidth',1)
ylim([0,5])
grid on
legend('{\itq}=0.3','{\itq}=0.5','{\itq}=0.7','{\itq}=1')
xlabel('\it{T/s}')
ylabel('{\itg}({\itt})')
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');


clc;clear
T=0:0.001:5;
q1=0.5;
q2=0.5-0.05*sin(2*pi*T);
q3=0.5+0.05*sin(2*pi*T);
q4=0.5-0.05*T;
q5=0.5+0.05*T;

g1=T.^(-q1)/gamma(1-q1);
g2=g1;g3=g1;
g4=g1;g5=g1;
for i=1:length(T)
    g2(i)=T(i)^(-q2(i))/gamma(1-q2(i));
    g3(i)=T(i)^(-q3(i))/gamma(1-q3(i));
    g4(i)=T(i)^(-q4(i))/gamma(1-q4(i));
    g5(i)=T(i)^(-q5(i))/gamma(1-q5(i));
end
figure
plot(T,g1,'r','LineWidth',1)
hold on 
plot(T,g2,'g','LineWidth',1)
plot(T,g3,'b','LineWidth',1)
plot(T,g4,'m','LineWidth',1)
plot(T,g5,'k','LineWidth',1)
grid on 
legend('{\it q}({\itt})=0.5','{\it q}({\itt})=0.5-0.05sin(2{\it\pit})',...
    '{\itq}({\itt})=0.5+0.05sin(2{\it\pit})','{\itq}({\itt})=0.5-0.05{\itt}','{\itq}({\itt})=0.5+0.05{\itt}')
xlabel('\it{T/s}')
ylabel('\gamma({\itt})')
ylim([0 2])
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');




clc;clear
T=0:0.001:5;
y1=Kern2(0.3,T);
y2=Kern2(0.5,T);
y3=Kern2(0.7,T);
y4=Kern2(0.8,T);
figure
plot(T,y1,'r','LineWidth',1)
hold on 

plot(T,y2,'g','LineWidth',1)
plot(T,y3,'b','LineWidth',1)
plot(T,y4,'m','LineWidth',1)
grid on
legend('\beta=0.3','\beta=0.5','\beta=0.7','\beta=0.9')
xlabel('T/s')
ylabel('\gamma(t)')
set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
ylim([0 2])
