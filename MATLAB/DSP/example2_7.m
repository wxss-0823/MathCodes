%两序列线性卷积
x=[1,4,3,5,1,2,3,2];nx=-4:3;
h=[3,2,4,1,3,2];nh=-3:2;
[y,ny]=conv_m(x,nx,h,nh); %ny为y在横坐标轴上的位置取值
n=length(ny);x1=zeros(1,n);h1=zeros(1,n);
x1(find(( ny>=min(nx) ) & ( ny<=max(nx) )==1) )=x;
h1(find((ny>=min(nh))&(ny<=max(nh))==1))=h;
subplot(3,1,1);stem(ny,x1);xlabel('n');ylabel('x(n)');
subplot(3,1,2);stem(ny,h1);xlabel('n');ylabel('h(n)');
subplot(3,1,3);stem(ny,y);xlabel('n');ylabel('y(n)');
