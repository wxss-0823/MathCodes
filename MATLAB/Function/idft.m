function [xn] = idft(Xk,N)%计算N点的逆DFT
   n=[0:1:N-1];
   k=[0:1:n-1];
   WN=exp(-j*2*pi/N);
   nk=n'*k;
   WNnk=WN.^(-nk);% "."将符号当元素使用
   xn=(Xk*WNnk)/N;
end

