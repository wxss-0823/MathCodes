price=input('请输入价格：');
if price<200
    sprintf('price=%d,折扣为0',price);
elseif price<500
    price=price*(1+0.05);
    sprintf('price=%d,折扣为5%%',price)
elseif price<1000
    price=price*(1+0.1);
    sprintf('price=%d,折扣为10%%',price)
end