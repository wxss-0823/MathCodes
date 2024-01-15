function [ Xk ] = dft( xn,N )%计算N点DFT
   n=[0:1:N-1];
   k=[0:1:N-1];
   WN=exp(-j*2*pi/N);
   nk=n'*k;
   WNnk=WN.^nk;% "."将符号当元素使用
   Xk=xn*WNnk;
end

