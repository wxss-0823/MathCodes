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
