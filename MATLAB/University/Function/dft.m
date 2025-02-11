function [ Xk ] = dft( xn,N )%����N��DFT
   n=[0:1:N-1];
   k=[0:1:N-1];
   WN=exp(-j*2*pi/N);
   nk=n'*k;
   WNnk=WN.^nk;% "."�����ŵ�Ԫ��ʹ��
   Xk=xn*WNnk;
end

