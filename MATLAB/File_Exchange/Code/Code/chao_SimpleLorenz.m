function f=chao_SimpleLorenz(t,y)
global c
f=zeros(3,1);
f(1)=10*(y(2)-y(1));
f(2)=(24-4*c)*y(1)+c*y(2)-y(1)*y(3);
f(3)=y(1)*y(2)-8/3*y(3);
