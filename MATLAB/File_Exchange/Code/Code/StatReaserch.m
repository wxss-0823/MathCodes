clc;clear 
Dataa=[1329,759,658,411,367,282,212,196,133,125];
index=['Computer Science','Mathematics','Engineering','Automation Control S¡­',...
    'Physics','Mechanics','Communication','Robotics','Telecommunications','Science Technology O¡­'];

barh(Dataa,'FaceColor','b','EdgeColor','b','LineWidth',.5)

% h=bar(Dataa,1,'group');

set(gca,'yticklabels',{'Computer Science','Mathematics','Engineering','Automation Control S¡­',...
    'Physics','Mechanics','Communication','Robotics','Telecommunications','Science Technology O¡­'},'ycolor','r');
box on
grid on
set(gca, 'FontName', 'Times New Roman','FontSize',12,'linewidth',0.5);
set(get(gca,'xLabel'),'FontName', 'Times New Roman','FontSize',16);%,'FontWeight','bold','FontAngle','Italic'
set(get(gca,'yLabel'),'FontName', 'Times New Roman','FontSize',16);%'FontWeight','bold','FontAngle','Italic'
set(gcf,'Color','w');

xlabel('Number of publication')
