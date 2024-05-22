% 1.basic parameter
clear;clc;
a = 0.6667 * 10^(-3);
b = 194.4945;
% vm = 1,2,3
vm = 1;
% fai0 = 0,-0.5,0.5 m Wb
fai0 = 0* 10^(-3);
% f = 300,600,2000Hz
w = 2*pi*300;
% 2.time
t = linspace(0,2*pi/w,1001);
delta = 2*pi/w/1000;
% 3.it,x,M,V
vt = 2*vm*sin(w*t);
%vt = 2*vm*sin(w*t)+1.5*vm*cos(2*w*t);
N = size(t);N = N(2);
fai =vt;
for k=2:N
    fai(k)=vt(k)+fai(k-1);
end
fai = fai0 + delta *fai;
W = a+ 3*b*fai.^2;
I = W .*vt;
plot(vt,I*1000);
xlabel('电压/V');
ylabel('电流/mA');
%% 保存数据
data = zeros(length(I),2);
for i=1:length(I)
    data(i,1) = I(i);
    data(i,2) = vt(i);
end

save("Multisim忆阻器数据.txt","data","-ascii")