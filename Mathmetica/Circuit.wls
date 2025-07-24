#!/usr/bin/env wolframscript
(* ::Package:: *)

Eliminate[
(Rs + 100) * Ri / (Rs + Ri + 100) == 155 && 
Rs * (Ri + 100) / (Rs + Ri + 100) == 56, Rs]


Solve[Out[2]]
NSolve[Out[2]]


Eliminate[
(Rs + 100) * Ri / (Rs + Ri + 100) == 155 && 
Rs * (Ri + 100) / (Rs + Ri + 100) == 56, Ri]


Solve[Out[45]]
NSolve[Out[45]]



a = 0.35;
T = 1/36000;
f[x_] := Piecewise[{{1, Abs[x]<=(1-a)/(2T)}, 
{Sqrt[0.5*(1-Sin[Pi (2*Abs[x]*T-1)/(2*a)])], (1-a)/(2T)<=Abs[x]<=(1+a)/(2T)},
{0, Abs[x]>=(1+a)/(2T)}}];
Plot[f[x],{x, -1.5*(1+a)/(2T), 1.5*(1+a)/(2T)}]
data = Table[f[x],{x, -1.5*(1+a)/(2T), 1.5*(1+a)/(2T), 1}];
Export["C:\\Users\\Wxss\\Desktop\\data.txt", data];
