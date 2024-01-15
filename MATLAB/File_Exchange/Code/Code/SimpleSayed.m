function [x,y,z]=SimpleSayed(c,q,h,N,x0)
b=8/3;
a=10;
x=zeros(1,N);
y=x;z=y;
x(1)=x0(1);
y(1)=x0(2);
z(1)=x0(3);
for i=2:N
    c10=x(i-1);
    c20=y(i-1);
    c30=z(i-1);
    
    c11=a*(c20-c10);
    c21=(24-4*c)*c10+c*c20-c10*c30;
    c31=-b*c30+c10*c20;


    x(i)=c10+c11*(h^q/gamma(q+1));
    y(i)=c20+c21*(h^q/gamma(q+1));
    z(i)=c30+c31*(h^q/gamma(q+1));
end





