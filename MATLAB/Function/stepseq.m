%单位阶跃序列的Matlab函数
function [x,n]=stepseq(n0,n1,n2)
    n=n1:n2;x=(n-n0)>=0;
end

