function [x,y,z]=SimpleFratral(c,q,h,N,x0)
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

    c12=a*(c21-c11);
    c22=(24-4*c)*c11+c*c21-c11*c30-c10*c31;
    c32=-b*c31+c11*c20+c10*c21;

    c13=a*(c22-c12);
    c23=(24-4*c)*c12+c*c22-c12*c30-c11*c31*(gamma(2*q+1)/gamma(q+1)^2)-c10*c32;
    c33=-b*c32+c12*c20+c11*c21*(gamma(2*q+1)/gamma(q+1)^2)+c10*c22;

    x(i)=c10+c11*(h^q/gamma(q+1))+c12*h^(2*q)/gamma(2*q+1)+c13*h^(3*q)/gamma(3*q+1);%+c14*h^(4*q)/gamma(4*q+1)+c15*h^(5*q)/gamma(5*q+1)+c16*h^(6*q)/gamma(6*q+1);
    y(i)=c20+c21*(h^q/gamma(q+1))+c22*h^(2*q)/gamma(2*q+1)+c23*h^(3*q)/gamma(3*q+1);%+c24*h^(4*q)/gamma(4*q+1)+c25*h^(5*q)/gamma(5*q+1)+c26*h^(6*q)/gamma(6*q+1);
    z(i)=c30+c31*(h^q/gamma(q+1))+c32*h^(2*q)/gamma(2*q+1)+c33*h^(3*q)/gamma(3*q+1);%+c34*h^(4*q)/gamma(4*q+1)+c35*h^(5*q)/gamma(5*q+1)+c36*h^(6*q)/gamma(6*q+1);
end





