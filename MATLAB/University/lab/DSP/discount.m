price=input('������۸�');
if price<200
    sprintf('price=%d,�ۿ�Ϊ0',price);
elseif price<500
    price=price*(1+0.05);
    sprintf('price=%d,�ۿ�Ϊ5%%',price)
elseif price<1000
    price=price*(1+0.1);
    sprintf('price=%d,�ۿ�Ϊ10%%',price)
end