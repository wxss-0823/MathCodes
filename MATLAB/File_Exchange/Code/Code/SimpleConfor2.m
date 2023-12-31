function [T,x,y,z]=SimpleConfor2(x0,h,q,c,N)
% c is the system parameter£»x0 is the initial value£»h is the iteration step size£»N is the iteration number.
x=zeros(1,N);
y=zeros(1,N);
z=zeros(1,N);
T=x;
x(1)=x0(1);
y(1)=x0(2);
z(1)=x0(3);
t=0;
T(1)=t;
for i=2:N
    t=t+h;
    T(i)=t;
    x(i)=x(i-1)+h*t^(q-1)*(10*(y(i-1)-x(i-1)));
    y(i)=y(i-1)+h*t^(q-1)*((24-4*c)*x(i-1)-x(i-1)*z(i-1)+c*y(i-1));
    z(i)=z(i-1)+h*t^(q-1)*(x(i-1)*y(i-1)-(8/3)*z(i-1));
end