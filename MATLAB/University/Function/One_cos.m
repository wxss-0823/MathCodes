function [xx,tt] = One_cos(A,w,a,dur)
%One_cos 生成正弦函数
tt=0:(2*pi)/(20*w):dur;
xx=A*cos(w*tt+a);
end

