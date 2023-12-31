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
% versus height (altitude) for a given range value
% ************************************************************************

function gui_plot_height

global xmin;
global xmax;
global ymin;
global ymax;
global readx;
global ready;
global rx_height;
global new_x;
global new_y;
global hhimage;
global plot_array
global plot_flag
global range_vec
global z_user
global z
global rx_range
global plot_array_rx_height
global free_space_loss_fix

x = load('inputs.mat');
if (rx_range < range_vec(1)/1000) rx_range = range_vec(1)/1000; end
free_space_loss_fix = 32.4+20*log10(x.freq)+20*log10(rx_range);  %dB

rx_range = rx_range*1e3;
N        = length(z);
  
[val, saver] = min(abs(range_vec-rx_range));  

plot_array_rx_height = plot_array(:,saver);

rx_range = range_vec(saver);

new_x = range_vec./1e3;
new_y = z_user; 

%*******************************************************************************************************************
% PLOT THE RESULTS versus HEIGHT
%*******************************************************************************************************************
hfigure = figure;
set(hfigure,'position',[200 70 700 515]);
set(hfigure,'unit','characters','resize','off');

plot1 = plot(new_y, plot_array_rx_height, 'blue', 'Linewidth', 2);
axis tight;

if plot_flag == 1
   title_str = ['Path Loss vs Altitude (Range='  num2str(round(rx_range*1e-3*10)/10) ' km)' ];   
   set(hfigure,'name',title_str,'numbertitle','off','windowstyle','modal');           
%   hold on;
%   plot2 = plot(new_y, free_space_loss, 'magenta');   
   text(min(new_y),max(plot_array_rx_height)-((max(plot_array_rx_height)-min(plot_array_rx_height))/60),...
       ['Free-space loss = ',num2str(free_space_loss_fix,4),'dB'],'color','green','fontweight','demi');
   xlabel('Altitude (m)');
   ylabel('Path Loss (dB)');
   axis tight;
%   set(gca, 'XDir', 'Reverse');
%   legend([plot1;plot2],'Yayilim Kaybi', 'Serbest-uzay Kaybi',4);
else 
   title_str = ['Propagation Factor vs Altitude (Range=' num2str(round(rx_range*1e-3*10)/10) ' km)' ];   
   set(hfigure,'name',title_str,'numbertitle','off','windowstyle','modal');           
   xlabel('Altitude (m)');
   ylabel('Propagation Factor (dB)');
   axis tight;
end;   

whitebg(hfigure,[.75 .75 .75]);
set(gca,'color','w');

gui_crosshair;
