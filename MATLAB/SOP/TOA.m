%% 参数设定
%定位信标的数量
nodeNumber = 3;   
%三个定位信标的坐标
nodeList = [0, 0; 2, 1; 1, 1.732]; 
%定位目标点到三个定位信标的距离
disList = [1.155, 1.155, 1.155];    
%% 定位算法
A = [];
B = [];
xn = nodeList(nodeNumber, 1);
yn = nodeList(nodeNumber, 2);
dn = disList(nodeNumber);

%计算线性方程组的参数A和B
for i=1:nodeNumber
    xi = nodeList(i, 1);
    yi = nodeList(i, 2);
    di = disList(i);
    A = [A; 2 * (xi - xn), 2 * (yi - yn)];
    B = [B; xi * xi + yi *yi - xn * xn - yn * yn + dn * dn - di * di];
end    

%根据最小二乘法公式计算结果X
X = inv(A'*A)*A'*B
%% 画图
plot(X(1),X(2),'ro','linewidth',1);hold on
for i=1:nodeNumber
    plot(nodeList(i,1),nodeList(i,2),'bo','linewidth',1);hold on
    plot_circle(nodeList(i,1),nodeList(i,2),disList(i));
    line([X(1),nodeList(i,1)],[X(2),nodeList(i,2)])
    hold on
end
hold off
title('TOA定位');
xlabel('基站坐标/km');
ylabel('定位信标距离/km')
legend('定位点','基站','基站传播范围');
