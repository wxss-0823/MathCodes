function Y=StepFDE12Lorenz(C,q,h,y0,step,num)
Y=[];
global c
c=C;
for i=1:num
    [t, y] = fde12(q,@chao_SimpleLorenz,0,step,y0,h);
    y0=y(:,end);
    Y=[Y;y(:,2:end)'];
end