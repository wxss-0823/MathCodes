#!/usr/bin/env wolframscript
(* ::Package:: *)

(*A={{1,1,1},{3,3,1},{2,3,1}}
Inverse[A]*)


(*A = {{1},{2},{3}}
B = {{3,5,7}}
A . B
MatrixRank[A . B]*)


Z={{171,120},{120,120}};
U={{1,0},{0,1}};
x=Inverse[(Z/50+U)];
N[x];
y=(Z/50-U);
N[S];
N[x*y];
N[x . y]
