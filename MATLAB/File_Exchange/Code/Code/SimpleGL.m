function [x,y,z]=SimpleGL(c,q,h,N,x0)
b=8/3;
a=10;
x=zeros(1,N);
y=x;z=y;
x(1)=x0(1);
y(1)=x0(2);
z(1)=x0(3);

dot=5;
w=zeros(1,dot);
w(1)=1;
for j = 2:dot+1
    w(j) = w(j-1)*(1-(q+1)/(j-1));
end

X=zeros(1,dot);Y=X;Z=X;
w=w(2:end);
for i=2:N
    for j=2:dot
        X(2:end)=X(1:end-1);
        Y(2:end)=Y(1:end-1);
        Z(2:end)=Z(1:end-1);
    end
    X(1)=x(i-1);
    Y(1)=y(i-1);
    Z(1)=z(i-1);
    
    c10=x(i-1);
    c20=y(i-1);
    c30=z(i-1);
    
    c11=a*(c20-c10);
    c21=(24-4*c)*c10+c*c20-c10*c30;
    c31=-b*c30+c10*c20;


    x(i)=c11*(h^q)-X*w';
    y(i)=c21*(h^q)-Y*w';
    z(i)=c31*(h^q)-Z*w';
end





