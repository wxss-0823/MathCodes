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
% This function finds the current point on the map when the user moves the
% mouse over the map
% ************************************************************************
function guimousevalue

global xmin;
global xmax;
global ymin;
global ymax;
global readx;
global ready;
global plot_array;
global new_x;
global new_y;
global plot_flag;
global hhimage;

%axes(handles.axesbottom);

a = get(gca,'CurrentPoint');

if ((a(1,1) >= 0 & a(1,1) <= (abs(xmin)+abs(xmax))) & (a(1,2) >= 0 & a(1,2) <= (abs(ymin)+abs(ymax))))

   readx = a(1,1);
   ready = a(1,2);

   diffx = 1e6;
   diffy = 1e6;

   for i = 1:length(new_x)
      if (abs(new_x(i)-readx)) < diffx
         diffx = abs(new_x(i)-readx);
         savexi = i;
      end
   end   
   
   for i = 1:length(new_y)
      if (abs(new_y(i)-ready)) < diffy
         diffy = abs(new_y(i)-ready);
         saveyi = i;
      end
   end   
   
   param = plot_array(saveyi, savexi);
   readxstr = num2str(readx);
   readystr = num2str(ready);
   paramstr = num2str(param);

set(findobj(gcf,'tag','texterror2'),'string','Right Mouse click to see 2D graphics !');

% Define the context menu
cmenu = uicontextmenu;

set(hhimage,'UIContextMenu', cmenu);

cb1 = ['gui_height'];
cb2 = ['gui_range'];

if plot_flag == 1
    item1label = ['Path Loss vs Altitude (Range = ' num2str(round(readx*10)/10) ' km)'];
    item2label = ['Path Loss vs Range (Altitude = ' num2str(round(ready*10)/10) ' m)'];
else
    item1label = ['Propagation Factor vs Altitude (Range = ' num2str(round(readx*10)/10) ' km)'];
    item2label = ['Propagation Factor vs Range (Altitude = ' num2str(round(ready*10)/10) ' m)'];
end

item1 = uimenu(cmenu, 'Label', item1label, 'Callback', cb1);
item2 = uimenu(cmenu, 'Label', item2label, 'Callback', cb2);

set(findobj(gcf,'tag','text71'),'string',readxstr);
set(findobj(gcf,'tag','text72'),'string',readystr);
set(findobj(gcf,'tag','text73'),'string',paramstr);

   set(gcf, 'Pointer','crosshair');
else
    set(findobj(gcf,'tag','text71'),'string',' ');
    set(findobj(gcf,'tag','text72'),'string',' ');
    set(findobj(gcf,'tag','text73'),'string',' ');
    set(gcf, 'Pointer','arrow');  

    set(findobj(gcf,'tag','texterror2'),'string',' ');
    
end;   

