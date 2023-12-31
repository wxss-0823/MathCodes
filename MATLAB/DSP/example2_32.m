%部分分式法求逆z变换
b=[1,-0.5];a=[1,0.75,0.125];
[R,P,C]=residuez(b,a);
disp('R=');disp(R');
disp('P=');disp(P');
disp('C=');disp(C');
