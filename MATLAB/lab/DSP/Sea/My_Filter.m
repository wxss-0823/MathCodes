%滤波器设计
function [y]=My_Filter(s,f)
    w=2*pi*f;
    %序列卷积，通过NDFT的定义，计算发现，这个序列的卷积结果等效于在X(f)处出现零点，达到滤除f处分量的目的
    h=[1,-2*cos(w),1];
    y=conv(s,h);
end
