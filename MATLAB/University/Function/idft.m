function [xn] = idft(Xk,N)%����N�����DFT
   n=[0:1:N-1];
   k=[0:1:n-1];
   WN=exp(-j*2*pi/N);
   nk=n'*k;
   WNnk=WN.^(-nk);% "."�����ŵ�Ԫ��ʹ��
   xn=(Xk*WNnk)/N;
end

