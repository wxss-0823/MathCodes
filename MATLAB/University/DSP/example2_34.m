%部分分式法求逆z变换
b=[1.4,0.96,-2.6,1.1,-0.144];a=[1,-1.4,0.6,-0.072];
[R,P,C]=residuez(b,a);
disp('R=');disp(R');
disp('P=');disp(P');
disp('C=');disp(C');
