
x=ScopeData.signals(1).values;
y=ScopeData.signals(2).values;
z=ScopeData.signals(3).values;

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