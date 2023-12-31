function dy=FraV(t,y)
global A w
I=A*sin(2*pi*w*t);
k=1;
dy=k*I;