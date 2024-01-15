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
% This function is used to plot the propagation factor (or path loss) 
% versus range for a given height (altitude) value
% ************************************************************************

function gui_plot_range

global xmin;
global xmax;
global ymin;
global ymax;
global readx;
global ready;
global new_x;
global new_y;
global hhimage;
global plot_array
global plot_flag
global range_vec
global z_user
global z
global free_space_loss
global rx_height
global plot_array_rx_range
global plot_array_full

N = length(z);
  
[val, saveh] = min(abs(z-rx_height));  

plot_array_rx_range = plot_array(saveh,:);

rx_height = z(saveh);

new_x = range_vec./1e3;
new_y = z_user; 

%*******************************************************************************************************************
% PLOT THE RESULTS versus RANGE 
%*******************************************************************************************************************
hfigure = figure;
set(hfigure,'position',[200 70 700 515]);
set(hfigure,'unit','characters','resize','off');
whitebg(hfigure,[.75 .75 .75]);

plot_array_full = zeros(length(plot_array_rx_range), 2);

plot_array_full(:,1) = plot_array_rx_range';
plot_array_full(:,2) = free_space_loss';

if plot_flag == 1
   title_str = ['Path Loss vs Range (Altitude='  num2str(round(rx_height*10)/10) ' m)' ];   
   set(hfigure,'name',title_str,'numbertitle','off','windowstyle','modal');           
   plot1 = plot(new_x, plot_array_full(:,1),'blue', 'Linewidth', 2);
   hold on;
   plot2 = plot(new_x, plot_array_full(:,2),'green', 'Linewidth', 2);
   ylabel('Path Loss (dB)');   
   xlabel('Range (km)');
%   set(gca, 'YDir', 'Reverse');
   axis tight;
%   legend([plot1;plot2],'Path Loss', 'Free-space loss',4);  
else
   title_str = ['Propagation Factor vs Range (Altitude='  num2str(round(rx_height*10)/10) ' m)' ];
   set(hfigure,'name',title_str,'numbertitle','off','windowstyle','modal');           
   plot1 = plot(new_x, plot_array_full(:,1),'blue', 'Linewidth', 2);
   ylabel('Propagation Factor (dB)');
   xlabel('Range (km)');
   axis tight;   
end;   

whitebg(hfigure,[.75 .75 .75]);
set(gca,'color','w');

gui_crosshair;
