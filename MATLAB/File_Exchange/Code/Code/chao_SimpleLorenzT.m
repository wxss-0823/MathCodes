function yout=SimpleConfor(x0,h,q,c,N)
function [x y z]=EulerSolve(c,x0,h,N)
% c is the system parameter£»x0 is the initial value£»h is the iteration step size£»N is the iteration number.
x=zeros(1,N);
y=zeros(1,N);
z=zeros(1,N);
x(1)=x0(1)+h*(10*(x0(2)-x0(1)));
y(1)=x0(2)+h*((24-4*c)*x0(1)-x0(1)*x0(3)+c*x0(2));
z(1)=x0(3)+h*(x0(1)*x0(2)-(8/3)*x0(3));
for i=2:N
    x(i)=x(i-1)+h*(10*(y(i-1)-x(i-1)));
    y(i)=y(i-1)+h*((24-4*c)*x(i-1)-x(i-1)*z(i-1)+c*y(i-1));
    z(i)=z(i-1)+h*(x(i-1)*y(i-1)-(8/3)*z(i-1));
end