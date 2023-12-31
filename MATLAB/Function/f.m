function s=f(n)
if(n==1)
    s=1;
elseif(n==2)
    s=2;
elseif(n==3)
    s=3;
else
    s=f(n-1)+f(n-2)+f(n-3);
end
end