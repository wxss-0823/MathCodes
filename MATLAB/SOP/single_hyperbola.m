function [h] = single_hyperbola(x1,y1,x2,y2,d)
%绘制单焦点处的双曲线
    %myfun()中，x1,y1,x2,y2,d为参数
    h = ezplot(@(x,y) sqrt((x-x1)^2+(y-y1)^2)-sqrt((x-x2)^2+(y-y2)^2)-d); 
    set(h,'Color',[0.5,0.5,0.5]);
    set(h,'linestyle','--');
    hold on
end
