% 基础参数
VT = 1.8;
b = 60;
a = [0,30,60];
R1 = 20;
R2 = 500;
% 输入电压
VM = linspace(-5,5);
% 忆阻计算公式
for i=1:1:3
X = b.*VM + 0.5*(a(i)-b).*(abs(VM+VT)-abs(VM-VT));
plot(VM,X,'linewidth',1); hold on
end
line([-5,1.76768],[0,0],'linestyle','--','linewidth',0.5);

line([1.76768,1.76768],[-300,0],'linestyle','--','linewidth',0.5);

line([-1.76768,-1.76768],[-300,0],'linestyle','--','linewidth',0.5);

xticks([-1.7,1.7]);

legend('α=0','α=β/2','α=β');

ylabel('忆阻器电阻率/(KΩ/s)')

xlabel('忆阻器电压/V')

% ylabel('Memristor Slew Rate/(KΩ/s)')
% 
% xlabel('Memristor Voltage/V')
