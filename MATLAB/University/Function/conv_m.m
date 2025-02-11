
%任意位置上的序列的线性卷积
function[y,ny]=conv_m(x,nx,h,nh)
nyb=nx(1)+nh(1);nye=nx(length(x))+nh(length(h));
ny=nyb:nye;%ny为卷积结果y的起、终点坐标
y=conv(x,h);%y为卷积结果
end

