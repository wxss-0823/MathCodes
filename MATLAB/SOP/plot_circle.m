function [] = plot_circle(x,y,r)
%已知圆心半径画圆
theta=0:0.1:2*pi;
Circle1=x+r*cos(theta);
Circle2=y+r*sin(theta);
plot(Circle1,Circle2,'k','linestyle','--','linewidth',0.5);
axis equal
end