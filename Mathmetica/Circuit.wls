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
