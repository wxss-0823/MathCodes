#!/usr/bin/env wolframscript
(* ::Package:: *)

(*A={{1,1,1},{3,3,1},{2,3,1}}
Inverse[A]*)


(*A = {{1},{2},{3}}
B = {{3,5,7}}
A . B
MatrixRank[A . B]*)


(*Z={{171,120},{120,120}};
U={{1,0},{0,1}};
x=Inverse[(Z/50+U)];
N[x];
y=(Z/50-U);
N[S];
N[x*y];
S=N[x . y];
M = ConstantArray[0, {2, 2}];
For [i=1, i<=2, i++,
	For[j=1, j<=2, j++,
	M[[i, j]]=20*Log10[S[[i,j]]]
	]
];
M*)


(*N[120*171/(120+171)];
N[120^2/(120+171)];
Z={{70.5155,49.4845},{49.4845,70.5155}};
Z0=Z/50;
U={{1,0},{0,1}};
S=(Z0-U).Inverse[(Z0+U)];
M = ConstantArray[0, {2, 2}];
For [i=1, i<=2, i++,
	For[j=1, j<=2, j++,
	M[[i, j]]=20*Log10[S[[i,j]]]
	]
];
M*)
