function s = rect(t0,tw,t)
%rect函数
Nf=81;
n2=round(t-0.5*tw-t0);%上界
n1=round(t+0.5*tw-t0);%下界
if n1>0
    s = [ones(1,n2-n1+1),zeros(1,length(Nf)-n2+n1+1)];
else 
    if n2>0
        s = [ones(1,n2),zeros(1,length(Nf)-n2)];
    else
        s = zeros(1,81);
    end

end
