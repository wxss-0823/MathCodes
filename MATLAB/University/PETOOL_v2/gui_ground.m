% Copyright (C) 2020, Ozlem Ozgun
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%    
% Contact:
% Dr. Ozlem Ozgun
% email: ozgunozlem@gmail.com
% web: http://www.ee.hacettepe.edu.tr/~ozlem/

%% ************************************************************************
% This function calculates the surface parameters (dielectric constant and 
% conductivity) for a given frequency and surface type, if impedance 
% surface is chosen in the main window
% ************************************************************************
function [epsilon, sigma] = gui_ground(ground_type, freq)
% freq in MHz

a = [1.4114535e-2;3.8586749; 79.027635;-0.65750351;201.97103;857.94335;915.31026;0.8756665;5.5990969e-3;215.87521; ...
     0.17381269;2.4625032e-2;-4.9560275e-2;2.2953743e-4;0.000038814567;1.2434792e-4;51852.543;4.13105e-5];

b = [-5.2122497e-8;-2.1179295e-5;-2.2083308e-5;5.5620223e-5;-2.5539582e-3;-8.9983662e-5;-9.4530022e-6;4.7236085e-5; ...
     8.7798277e-5;-7.6649237e-5;1.2655183e-4;1.8254018e-4;2.9876572e-5;-8.1212741e-7;8.467523e-2;2.824598e-4; ...
     3.883854e-2;2.03589e-7];

c = [5.8547829e-11;9.1253873e-4;-3.5486605e-4;6.6113198e-4;1.2197967e-2;5.5275278e-2;-4.0348211e-3;2.6051966e-8; ...
     6.2451017e-8;-2.6151055e-3;-1.6790756e-9;-2.664754e-8;-3.0561848e-10;1.8045461e-9;9.878241e-6;8.680839e-7; ...
     389.58894;-3.1739e-12];

d = [-7.6717423e-16;6.5727504e-10;2.7067836e-9;3.0140816-10;3.7853169e-5;8.8247139e-8;4.892281e-8;-9.235936e-13; ...
     -7.1317207e-12;1.2565999e-8;1.1037608e-14;7.6508732e-12;1.1131828e-15;-1.960677e-12;-9.736703e-5;-6.755389e-8; ...
     6.832108e-5;4.52331e-17];

e = [2.9856318e-21;1.5309921e-8;8.210184e-9;1.4876952e-9;-1.728776e-6;0.0;7.4342897e-7;1.4560078e-17;4.2515914e-16; ...
     1.9484482e-7;-2.9223433e-20;-7.4193268e-16;0.0;1.2569594e-15;7.990284e-8;7.2701689e-11;0.0;0.0];

f = [0.0;-1.9647664e-15;-1.0007669e-14;0.0;0.0;0.0;0.0;-1.1129348e-22;-1.240806e-20;0.0;0.0;0.0;0.0;-4.46811e-19; ...
     3.269059e-7;2.8728975e-12;0.0;0.0];

f1 = freq;
f2 = f1*f1;
f3 = f1*f2;
f4 = f1*f3;
f5 = f1*f4;
f6 = f1*f5;
f7 = f1*f6;
f8 = f1*f7;
f9 = f1*f8;

if (ground_type == 1)  % saltwater
   epsilon = 70.0;  
   sigma = 5.0;    % S/m
   mi = 1;
   mi1 = mi + 1;
   
   if (f1 > 2253.5895)
      epsilon = 1.0/(a(mi)+b(mi)*f1+c(mi)*f2+d(mi)*f3+e(mi)*f4);
   end  
   
   if (f1 > 1106.207) 
          sigma = a(mi1)+c(mi1)*f1+e(mi1)*f2;
          sigma = sigma/(1.0+b(mi1)*f1+d(mi1)*f2+f(mi1)*f3);
   end  
   
elseif (ground_type == 2) % freshwater
   epsilon = 80.0;
   mi = 3;
   mi1 = mi+1;
   
   if (f1 > 6165.776) 
      epsilon = a(mi)+c(mi)*f1+e(mi)*f2;
      epsilon = epsilon/(1.0+b(mi)*f1+d(mi)*f2+f(mi)*f3);
   end
   
   if (f1 > 5776.157)
       ki = 2;
   else 
       mi1 = mi1+1;
       ki = -1;
   end
    
   sigma = a(mi1)+c(mi1)*f1+e(mi1)*f2;
   sigma = (sigma/(1.0+b(mi1)*f1+d(mi1)*f2))^ki; 
   
elseif (ground_type == 3) % wet ground
   epsilon = 30.0;
   mi = 6;
   if (f1 >= 4228.11)
      mi = 7;
   end   
   
   if (f1 > 1312.054) 
       epsilon = a(mi)+c(mi)*f1+e(mi)*f2;
       epsilon = sqrt(epsilon/(1.0+b(mi)*f1+d(mi)*f2));
   end
   
   if (f1 > 15454.4) 
       mi1 = 8;
       gi = 3.3253339e-28;
   else 
       mi1 = 9;
       gi = 1.3854354e-25;
   end
   
   sigma = a(mi1)+b(mi1)*f1+c(mi1)*f2+d(mi1)*f3+e(mi1)*f4;
   sigma = sigma+f(mi1)*f5+gi*f6;
                 
elseif (ground_type == 4) % medium dry ground
   epsilon = 15.0;
   
   if (f1 > 4841.945) 
       mi = 10;
       epsilon = a(mi)+c(mi)*f1+e(mi)*f2;
       epsilon = sqrt(epsilon/(1.0+b(mi)*f1+d(mi)*f2));
   end
   
   mi1 = 12;
   if (f1 > 4946.751)
      mi1 = 11;
   end   
   
   sigma = (a(mi1)+b(mi1)*f1+c(mi1)*f2+d(mi1)*f3+e(mi1)*f4)^2;   
   
elseif (ground_type == 5) % very dry ground
   epsilon = 3.0;
   
   if (f1 < 590.8924)
      sigma = 1.0e-4;
   else 
      if (f1 > 7131.933) 
         mi1 = 13;
         sigma = (a(mi1)+b(mi1)*f1+c(mi1)*f2+d(mi1)*f3)^2;    
      else 
         mi1 = 14;
         gi = 9.4623158e-23;
         hi = -1.1787443e-26;
         si = 7.9254217e-31;
         ti = -2.2088286e-35;
         sigma = a(mi1)+b(mi1)*f1+c(mi1)*f2+d(mi1)*f3;
         sigma = sigma+e(mi1)*f4+f(mi1)*f5+gi*f6;
         sigma = sigma+hi*f7+si*f8+ti*f9;
      end
   end      
   
elseif (ground_type == 6) % user-defined
   epsilon = 80;
   sigma = 4;
end   