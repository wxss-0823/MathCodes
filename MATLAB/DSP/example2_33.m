%部分分式法求逆z变换
b=[1,-0.5,0.5,1];a=[1,-3,2];
[R,P,C]=residuez(b,a);
disp('R=');disp(R');
disp('P=');disp(P');
disp('C=');disp(C');
