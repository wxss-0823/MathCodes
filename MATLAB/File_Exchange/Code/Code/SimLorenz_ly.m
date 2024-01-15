function f=SimLorenz_ly(t,X)
global c
x=X(1); y=X(2); z=X(3);
Y= [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];
f=zeros(12,1);
f(1)=10*(y-x);
f(2)=-x*z+(24-4*c)*x+c*y;
f(3)=x*y-8/3*z;
 Jac=[-10,10,0;
     24-4*c-z,  c,  -x;
      y,    x,   -8/3];
  f(4:12)=Jac*Y;
