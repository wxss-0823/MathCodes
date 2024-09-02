#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Plot[Log[1+x]/x,{x,0,10}]*)


(*Plot[(Exp[x^3]-1)/(x-ArcSin[x]),{x,-1,1}]*)


(*Plot[(Sin[x])^2*(Cos[x])^5,{x,-10,10}]*)


(*Integrate[1/Sin[x],{x,-1,1}] 
Plot[1/Sin[x],{x,-1,1}]*)


(*Integrate[1/(1-x^2)^(1/2),{x,-1,1}] 
Plot[1/(1-x^2)^(1/2),{x,-1,1}]*)


(*Integrate[Exp[-x^2],{x,0,Infinity}] 
Plot[Exp[-x^2],{x,-5,5}]*)


(*Integrate[1/Sqrt[2*Pi]*Exp[-(1/2)*x^2],{x,0,Infinity}]
Plot[Exp[-(1/2)*x^2],{x,-5,5}]*)


(*Integrate[1/(x*(Log[x])^2),{x,2,Infinity}]
Plot[1/(x*(Log[x])^2),{x,-10,10}]*)


(*DSolve[{5 y[x]-2 (y^\[Prime])[x]+(y^\[Prime]\[Prime])[x]\[Equal]\[ExponentialE]^x Cos[2 x]},y[x],x]*)


(*Plot3D[x^2*y/(x^4+y^2),{y,-10,10},{x,-10,10}]*)


(*Plot3D[Sin[x^2*y+y^4]/(x*y),{y,-10,10},{x,-10,10}]*)


(*DSolve[{x^2*y''[x]+2*x*y'[x]-2*y[x]\[Equal]0},y[x],x]*)


(*Plot3D[{x*y*Sin[1/Sqrt[x^2+y^2]]},{x,-10,10},{y,-10,10}]*)


(*Plot3D[{x*y},{x,-10,10},{y,-10,10}]
Y[x_,y_]:=x*y/;x*y\[NotEqual]0
Y[x_,y_]:=10000/;x*y=0
Plot3D[Y[x,y],{x,-10,10},{y,-10,10}]*)


(*Plot3D[1/(Abs[x]+Abs[y]),{x,-10,10},{y,-10,10}]*)


(*A=ImplicitRegion[x^2+y^2\[LessEqual]2*x+2*y,{x,y}]
RegionPlot[x^2+y^2\[LessEqual]2*x+2*y,{x,-4,4},{y,-4,4}]
Integrate[x^2+x*y+y^2,{x,y}\[Element]A]*)


(*A=ImplicitRegion[0<=x<=1 && 0\[LessEqual]y<=1,{x,y}]
Integrate[(1+x^2+y^2)^(-3/2),{x,y}\[Element]A]
RegionPlot[0<=x<=1 && 0\[LessEqual]y<=1,{x,0,2},{y,0,2}]*)


(*A=ImplicitRegion[y\[GreaterEqual]x && y\[LessEqual]x+1 && y\[GreaterEqual]1 && y\[LessEqual]3,{x,y}]
Integrate[y,{x,y}\[Element]A]*)


(*Integrate[x*y/Sqrt[(1+y^3)],{x,0,1},{y,x^2,1}]*)


(*A=ImplicitRegion[Sqrt[Abs[x]]+Sqrt[Abs[y]]\[LessEqual]1,{x,y}]*)
(*RegionPlot[Sqrt[Abs[x]]+Sqrt[Abs[y]]\[LessEqual]1,{x,-1,1},{y,-1,1}]*)
(*Integrate[Sqrt[Abs[x]]+Sqrt[Abs[y]],{x,y}\[Element]A]*)


(*A = ImplicitRegion[x^2+y^2\[GreaterEqual]1 && x^2+y^2\[LessEqual]9 && x\[LessEqual]Sqrt[3]*y && y\[LessEqual]Sqrt[3]*x,{x,y}]
RegionPlot[x^2+y^2\[GreaterEqual]1 && x^2+y^2\[LessEqual]9 && x\[LessEqual]Sqrt[3]*y && y\[LessEqual]Sqrt[3]*x,{x,y}\[Element]A]
Integrate[ArcTan[y/x],{x,y}\[Element]A]*)


(*Plot[Log[x],{x,0,10}]*)


(*A=ImplicitRegion[y\[GreaterEqual]Sqrt[x] && y\[LessEqual]1,{x,y}]
RegionPlot[y\[GreaterEqual]Sqrt[x] && y\[LessEqual]1,{x,y}\[Element]A]
Integrate[1/Sqrt[x]*Exp[-y^2],{x,y}\[Element]A]*)


(*A=ImplicitRegion[y^2\[LessEqual]x && y\[GreaterEqual]x,{x,y}]
RegionPlot[y^2\[LessEqual]x && y\[GreaterEqual]x,{x,y}\[Element]A]
Integrate[Sin[Pi*y]/y,{x,y}\[Element]A]*)


(*A=ImplicitRegion[Abs[x]<=1 && Abs[y]<=1 && x^2+y^2>=x,{x,y}]
RegionPlot[Abs[x]<=1 && Abs[y]<=1 && x^2+y^2>=x,{x,y}\[Element]A]
Integrate[Abs[x*y],{x,y}\[Element]A]*)


(*Plot[x+2*x^2*Sin[1/x],{x,-0.1,0.1}]*)


(*y[x_] := 2-Cos[x]/;x\[LessEqual]0
y[x_] := Sqrt[x]+1/;x>0
Plot[y[x],{x,-5,5}]*)


(*Plot[{x^(1/x),x*Log[x],x^x,x*Exp[x]},{x,-1,100},PlotLegends\[Rule]LineLegend["Expressions"]]*)


(*FourierTrigSeries[x,x,8]
y[x_]:=2 Sin[x]-Sin[2 x]+2/3 Sin[3 x]-1/2 Sin[4 x]+2/5 Sin[5 x]-1/3 Sin[6 x]+2/7 Sin[7 x]-1/4 Sin[8 x]
Plot[y[x],{x,-3\[Pi],3\[Pi]}]*)


(*Integrate[Log[Sqrt[x^2+t^2]],{x,0,1}]*)


(*ContourPlot3D[{x^2+y^2==1,z==x+y},{x,-2,2},{y,-2,2},{z,-2,2}]*)


(*ContourPlot3D[z^2==x^2+y^2,{x,-2,2},{y,-2,2},{z,0,2},
Mesh -> {{0}, {0}, {0}}, MeshFunctions -> {#2^2 - 2*#1 &}, 
 MeshShading -> {Yellow, None}]*)


(*RegionPlot3D[z^2>x^2+y^2 && z^2<2x,{x,-2,2},{y,-2,2},{z,-2,2},
PlotPoints-> 1000 ]*)


(*ContourPlot3D[x^2+(y-z)^2\[Equal](1-z)^2,{x,-1,1},{y,-1,1},{z,0,1}]*)


(*Plot[Exp[-x]*Sin[x],{x,0,10}]*)


(*ContourPlot[x^2+y*x+y^2==1,{x,-2,2},{y,-2,2}]*)


(*Plot[ArcTan[2*Pi+4*x/(x^2-4)],{x,-5,5}]
Plot[Pi-2*ArcTan[x/2],{x,-5,5}]
Arg[(Iw-2)/(Iw+2)]*)


(*Plot[2x+Exp[1-Sqrt[x]],{x,0,3}]*)


(*A = Integrate[Exp[(-2*r^2)/(250*(10^(-6)))^2]*r,{r,0,110*10^(-6)}]
NumberForm[N[A],10]*)


(*A = ImplicitRegion[x^2+y^2+z^2<=4 && x^2+y^2+z^2>=1,{x,y,z}]
RegionPlot3D[x^2+y^2+z^2<=4 && x^2+y^2+z^2>=1,{x,-2,2},{y,-2,2},{z,-2,2},Mesh->None,PlotStyle->Directive[Opacity[0.5],Yellow]]
B = Integrate[1,{x,y,z}\[Element]A]
NumberForm[N[B],100]*)


(*Plot[{Exp[x]},{x,-5,3}]Plot[Log[x],{x,-5,3}]*)


(*ContourPlot3D[z==(1/5)x^2-(1/3)y^2,{x,-5,5},{y,-5,5},{z,-2,5}]*)


(*Plot3D[(y-x^2)(y-x^3),{x,-0.1,1.1},{y,-1/600,0.5}]*)


(*Plot3D[x^3+y^3-3x^2-3y^2,{x,-10,6},{y,-10,6}]*)


(*f[x_] := DiracDelta[x^2 - 2] 
Plot[Evaluate[f[x] /. DiracDelta[a_] :> 10000 UnitStep[1/10000 - a^2]], 
  {x, -4, 4}, Exclusions -> None, PlotPoints -> 800]*)


(* z=0\:4e3a sin(z)/z \:7684\:53ef\:53bb\:5947\:70b9 *)
(*ComplexPlot3D[Sin[z]/z,{z,-1-I,1+I}]*)

(* f[x_] := 1/((z-1)(z-2)^2) \:7684\:4e00\:9636\:6781\:70b9\:548c\:4e8c\:9636\:6781\:70b9*)
(*ComplexPlot3D[ 1/((z-1)*(z-2)^2),{z,0.5-3I,4+3I},PlotRange->Automatic]*)

(* Exp[1/(z-1)] \:7684\:672c\:6027\:5947\:70b9 *)
(*ComplexPlot3D[ Exp[1/(z-1)],{z,0.5-I,1.5+I}]*)


(*Integrate[(Sin[x])^12,{x,0,Pi}]
Integrate[(Sin[x])^12,{x,0,Pi/2}]*)


(*Plot[x^4*Sqrt[(1+x)/(1-x)],{x,0,0.9}]
Integrate[x^4*Sqrt[(1+x)/(1-x)],{x,0,1}]*)


(*Plot[1/(1+x^5),{x, -5, 1.2}]*)


(*DSolve[{x'[t] == 0.2x[t] + 2y[t], y'[t] == -5x[t], 
x[0] == 0.5, y[0] == 0.8}, 
{x[t],y[t]}, t]*)


(*Plot[0.12*Exp[-3] - 0.2*(x - 0.3) + 0.333 * 20 *(x-0.3)^3, {x, -3, 3}]*)


l=120*10^(-9);c=18*10^(-12);
f=N[1/(2*Pi*Sqrt[l*c])]


a=5.6;b=2*23.64;
C1=a;C2=a;C3=1;Cj=b;
(* \:7ba1\:5b50\:5728 Vcb \:4e3a 2.5 V \:65f6\:ff0c\:8f93\:51fa\:7535\:5bb9\:4e3a 0.85 pF,\:53cd\:5411\:4f20\:8f93\:7535\:5bb9\:4e3a 0.67 pF *)
Cre=0.67;
CQ=C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre
(* CQ \:5e94\:8be5\:5728 2.5 pF \:5de6\:53f3 *)
f0=1/(2Pi*Sqrt[5.6*CQ])*10^4;
Plot[C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre, {Cj, 2*3.85, 2*23.64}]
Plot[1/(2Pi*Sqrt[5.6*(C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre)])*10^4, {Cj, 2*3.85, 2*23.64}]


a=8.2;b=23.64;
C1=a;C2=a;C3=1;Cj=b;
(* \:7ba1\:5b50\:5728 Vcb \:4e3a 2.5 V \:65f6\:ff0c\:8f93\:51fa\:7535\:5bb9\:4e3a 0.85 pF,\:53cd\:5411\:4f20\:8f93\:7535\:5bb9\:4e3a 0.67 pF *)
Cre=0.1;
CQ=C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre
(* CQ \:5e94\:8be5\:5728 2.5 pF \:5de6\:53f3 *)
f0=1/(2Pi*Sqrt[5.6*CQ])*10^4;
Plot[C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre, {Cj, 0, 40}]
Plot[1/(2Pi*Sqrt[5.6*(C1*C2*C3*Cj/(C2*C3*Cj+C1*C3*Cj+C1*C2*Cj+C1*C2*C3)+Cre)])*10^4, {Cj, 0, 40}]


Solve[S21==0.571 && S12==b1/U2 && S21==b2/U1 && b1==S11*U1 + T12*U2 && b2==T21*U1 + S22*U2,{U1,U2}]


Minimize[0.266*x^2 - 0.086*x + 0.04616,x]
Plot[0.266*x^2 - 0.086*x + 0.04616,{x,-1,1}]


S11=0.266;T12=0.495;S22=0.04616;T21=0.4089;
b1=S11*U1 + T12*U2;b2=T21*U1 + S22*U2;
S12=b1/U2;S21=b2/U1;
(*a=0.0865;*)
(*a=0.423;*)
a=0.2850654;
U1=a*U2;
S12 
S21




