#!/usr/bin/env wolframscript
(* ::Package:: *)

polarMat = {{Cos[theta], -rho*Sin[theta]}, {Sin[theta], rho*Cos[theta]}};
Simplify[Inverse[polarMat]]
sphereMat = {
{Sin[phi]*Cos[theta],  rho*Cos[phi]*Cos[theta], -rho*Sin[phi]*Sin[theta]}, 
{Sin[phi]*Sin[theta],  rho*Cos[phi]*Sin[theta],  rho*Sin[phi]*Cos[theta]},
{Cos[phi]           , -rho*Sin[phi]           ,  0}
};
Simplify[Inverse[sphereMat]]



