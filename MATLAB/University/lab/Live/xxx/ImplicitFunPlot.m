function ImplicitFunPlot(Pin)
%quadl(@(r) exp(-2*r^2/wl^2)*r,0,110*1e-6) = 5.0163e-009
A=4.9702e35;
B=1.8987e37;
C=5027.1;
D=1.3425e28;
E=7.4002e28;
F=1.2343e24;
G=1.7122e33;
Wp=400e-6;
Wl=250e-6;
a=540;
t=11.4e-3;
Q=5e-24;
Pout = zeros(size(Pin));
Z = @(Pin) (1/a)*log(1.7322*Pin) - 9.2593e-4;
IntegratedFun = @(Pout,Pin) @(r,z) ( 2*pi*r.*( A*Pin*exp( -2*r.^2/Wp^2-2*r.^2/Wl^2-a*z ) + B*Pout*exp(-4*r.^2/Wl^2)) )./...%分子
    1/t + C*Pout*exp(-2*r.^2/Wl^2) + sqrt( (1/t + C*Pout*exp(-2*r.^2/Wl^2)).^2 +4*Q*...
    ( D*Pin*exp(-2*r.^2/Wp^2-a*z)+E*Pout*exp(-2*r.^2/Wl^2) ) ); %分母
EquationWright = @(Pin) F*(0.0705+(0.01-Z(Pin))*15.9315) + G*Z(Pin)*5.0163e-9;
for k = 1:length(Pin)
    Pout(k) = fzero( @(Pout) dblquad(IntegratedFun(Pout,Pin(k)),0,110*1e-6,0,Z(Pin(k)),1e22) - EquationWright(Pin(k)),1); 
end
plot(Pin,-Pout*1000);
xlabel('Pump power(W)');
ylabel('Output power(mW)');
%凑出来的图像
% Pout = -(Pout - Pout(1))*5.5e3;
% plot(Pin+1.8,Pout);
% xlabel('Pump power(W)');
% ylabel('Output power(mW)');
% axis([2.5 6.5 -10 200])