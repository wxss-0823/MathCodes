clc;clear
syms s
s1=1.6018*(s + 0.1466)*(s+ 2.438)*(s+ 40.56);
s2=(s+0.01135)*(s+0.1888)*(s+3.14)*(s+52.23);
expand(s1)
expand(s2)





1.6018*s^3 + 69.1090*s^2 + 168.4914*s +23.2206
s^4 + 55.5701*s^3 + 175.0866*s^2 + 32.9437*s + 0.3514

[A, B, C, D]=tf2ss([1.6018  69.1090  168.4914 23.2206],[1 55.5701 175.0866 32.9437 0.3514])



s1=1.2974*(s+1125);
s2=(s+1423)*(s+ 0.01125);

1.2974*s + 1.4596e+03
s^2 + 1.4230e+03*s + 16.0087

1  1.4230e+03  16.0087 
[A, B, C, D]=tf2ss([1.2974 1.4596e+03],[1  1.4230e+03  16.0087 ])

[-1423, -16.0087;1,0]
[1,0]'
[1.2974, 1459.6]