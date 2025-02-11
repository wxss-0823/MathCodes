%计算序列x1和x2之间的N点循环卷积
n=0:9;x1=(0.8).^n;
n=0:6;x2=exp(-n);N=10;
y=circonvt(x1,x2,N)