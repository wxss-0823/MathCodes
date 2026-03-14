#!/usr/bin/env wolframscript
(* ::Package:: *)

(*polarMat = {
{Cos[theta], -rho*Sin[theta]}, {Sin[theta], rho*Cos[theta]}
};
Simplify[Inverse[polarMat]]
sphereMat = {
{Sin[phi]*Cos[theta],  rho*Cos[phi]*Cos[theta], -rho*Sin[phi]*Sin[theta]}, 
{Sin[phi]*Sin[theta],  rho*Cos[phi]*Sin[theta],  rho*Sin[phi]*Cos[theta]},
{Cos[phi]           , -rho*Sin[phi]           ,  0}
};
Simplify[Inverse[sphereMat]]*)


(*Z1 = R1 + I*X1;
Z2 = R2 + I*X2;
(*Z2 = R1 - I*X1;*)
Z = Z1*Z2/(Z1+Z2);
Re[ComplexExpand[Z]]*)


(*Zp = 5-I*100;
Zm = R+I*X;
Z0 = Zp*Zm/(Zp+Zm);
ComplexExpand[Z0]\:ff1b
RealZ = (10025 R)/((5+R)^2+(-100+X)^2)+(5 R^2)/((5+R)^2+(-100+X)^2)+(5 X^2)/((5+R)^2+(-100+X)^2);
ImagZ = -((100 R^2)/((5+R)^2+(-100+X)^2))+(10025 X)/((5+R)^2+(-100+X)^2)-(100 X^2)/((5+R)^2+(-100+X)^2);
Refine[Solve[RealZ == 50 && ImagZ == 0],(R \[Element] Reals && X \[Element] Reals)]*)


(*R=19550/481;X=10000/481;
Zp = 5-I*100;
Zm = R+I*X;
Z0 = 50;
Zm * Z0/(Zm + Z0)*)


(*Zm = R3+I*X3;
Z0 = 50;
Zin = Zm * Z0/(Zm + Z0);
Re[ComplexExpand[Zin]];
RealZin = (2500 R3)/((50+R3)^2+X3^2)+(50 R3^2)/((50+R3)^2+X3^2)+(50 X3^2)/((50+R3)^2+X3^2);
ImagZin = X3/((50+R3)^2+X3^2);
Refine[Solve[RealZin == 5 && ImagZin == 100], (R3 \[Element] Reals && X3 \[Element] Reals)];
R3=-(124999999550/2500000081);X3=25000000/2500000081;
Zp = 5-I*100;
Zout = Zm * Zp/(Zm + Zp);
N[Zout, 3]*)


(*\:8bc1\:660e\:ff1a\:67d0\:4e00\:70b9\:5904\:ff0cx\:ff0cy\:7684\:504f\:5bfc\:6570\:5bf9\:5e94\:7684\:65b9\:5411\:4e3a\:68af\:5ea6\:65b9\:5411*)
(*\:63a8\:5bfc\:53ef\:5f97\:ff1a\:4efb\:610f\:70b9\:5904\:7684\:65b9\:5411\:5bfc\:6570\:6700\:5927\:503c\:ff0c\:53ef\:4ee5\:8f6c\:5316\:4e3a\:504f\:5bfc\:6570\:6cbf\:4efb\:610f\:65b9\:5411\:7684\:5206\:89e3*)
f[x_] := A Cos[x]+ B Sqrt[1 - (Cos[x])^2]
criticalPoints = Assuming[Cos[x] > 0 && Element[{A, B}, Reals], Solve[f'[x] == 0, Cos[x]]]
