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
function guimousevalue_polarplot

global readx_pol;
global ready_pol;
global new_x_pol;
global new_y_pol;
global plot_array_pol

%axes(handles.axesbottom);
load degree
load analysisparameters
load angle_list_pol
load angle_list
finalangle = degree + endpoint;

a = get(gca,'CurrentPoint');

plotdegree = 0 ;
if a(1,1) < 0 & a(1,2) > 0 
    plotdegree = atand(a(1,1)/a(1,2)) + 360;
elseif a(1,1) < 0 & a(1,2) < 0
    plotdegree = atand(a(1,1)/a(1,2)) + 180;
elseif a(1,1) > 0 & a(1,2) < 0
    plotdegree = atand(a(1,1)/a(1,2)) + 180;
else
    plotdegree = atand(a(1,1)/a(1,2));
end

if angle_list(end) < angle_list(1)
    flag = ~((plotdegree < angle_list(1)) & (plotdegree > angle_list(end)));
elseif angle_list(end) > angle_list(1)
    flag = (plotdegree > angle_list(1)) & (plotdegree < angle_list(end));
else
    flag =1;
end
 
if ((a(1,1) >= -1 & a(1,1) <= 1) & (a(1,2) >= -1 & a(1,2) <= 1)) & ( (sqrt(a(1,1)^2 + a(1,2)^2) * max(new_x_pol)) <= max(new_x_pol) ) & flag
    
    readx_pol = a(1,1);
    ready_pol = a(1,2);
    
    savexi_pol = abs(round(readx_pol * length(new_x_pol)));
    if savexi_pol == 0
        savexi_pol = savexi_pol + 1;
    else
        savexi_pol = savexi_pol;
    end
    readxstr_pol = num2str(sqrt(readx_pol^2 + ready_pol^2) * max(new_x_pol));
    
    if (readx_pol > 0) && (ready_pol > 0)
        readystr_pol = num2str(atand(readx_pol/ready_pol));
    elseif (ready_pol < 0)
        readystr_pol = num2str(atand(readx_pol/ready_pol) + 180);
    elseif (readx_pol < 0) && (ready_pol > 0)
        readystr_pol = num2str(atand(readx_pol/ready_pol) + 360);
    end
    saveyi_pol = find(abs(str2num(readystr_pol)-new_y_pol) == min(abs(str2num(readystr_pol)-new_y_pol)));

    if saveyi_pol > 0
        saveyi_pol = saveyi_pol;
    else
        saveyi_pol = saveyi_pol + length(new_y_pol);
    end
    if (str2num(readystr_pol) <= finalangle)
  
        param = plot_array_pol(saveyi_pol, savexi_pol);
        paramstr = num2str(param);
        set(findobj(gcf,'tag','text10'),'string',readxstr_pol);
        set(findobj(gcf,'tag','text2'),'string',readystr_pol);
        set(findobj(gcf,'tag','text11'),'string',paramstr);

        set(gcf, 'Pointer','crosshair');
    else
        set(findobj(gcf,'tag','text10'),'string',' ');
        set(findobj(gcf,'tag','text2'),'string',' ');
        set(findobj(gcf,'tag','text11'),'string',' ');
        set(gcf, 'Pointer','arrow');  

        set(findobj(gcf,'tag','text12'),'string',' ');
    end
else
    set(findobj(gcf,'tag','text10'),'string',' ');
    set(findobj(gcf,'tag','text2'),'string',' ');
    set(findobj(gcf,'tag','text11'),'string',' ');
    set(gcf, 'Pointer','arrow');  

    set(findobj(gcf,'tag','text12'),'string',' ');
    
end  

