% yy = [ ]; %<--- initialize the yy vector to be empty 
% for k=-5:5 
% yy(k+6) = cos( k*pi/3 ) ;
% end
% 
% fs=4000;A1=20;M=8;D=23;
% T=1/fs;A2=1.2*A1;tm1=(37.2/M)*T;tm2=(-41.3/D)*T;
% tt=-T:T/25:T;
% x1=A1*cos(2*pi*fs*(tt-tm1));
% x2=A2*cos(2*pi*fs*(tt-tm2));
% x3=x1+x2;
% figure(1)
% subplot(3,1,1);plot(tt,x1);title("ÍõÎıÊ¤Ë´ 1");
% subplot(3,1,2);plot(tt,x2);title("ÍõÎıÊ¤Ë´ 2");
% subplot(3,1,3);plot(tt,x3);title("ÍõÎıÊ¤Ë´ 3");
% 
% %--- make a plot of a weird signal 
% N = 200; 
% xk = (1:N)/50; 
% rk= sqrt( xk.*xk + 2.25 ); 
% sig= exp(j*2*pi*rk); 
% figure(2)
% plot( xk, real(sig), 'bo-' ) 
% 
% A=95;w=200*pi;a=pi/5;dur=0.025;
% T=((2*pi)/w)*1000
% [xx,tt]=One_cos(A,w,a,dur);
% plot(tt,xx);

f1=3000;f2=-2500;dur=3;fsamp = 11025; 
[xx,tt]=mychirp(f1,f2,dur,fsamp);