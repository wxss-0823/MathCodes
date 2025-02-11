%% ************************************************************************
% This is the main file to run PETOOL.
% To run PETOOL, type petool in the MATLAB command window, 
% or open petool.m with MATLAB editor and press F5.
% The "Main Window" of the program will appear.
% Enter the input parameters and click "Run" button to start the analysis.
% ************************************************************************
%
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

clear all
global range_max_int
global Zmax_user_int
global freq_int
global thetabw_int
global thetae_int
global tx_height_int
global epsilon_int
global sigma_int
global range_int
global height_int
global duct_M_int
global duct_height_int

global chosen_method
global path_loss_final
global prop_fact_final
global free_space_loss
global range_vec
global z_user
global z
global Mprofile
global Nprofile
global plot_flag
global plot_array

global backward;
global interp_type;
global thresh_int;
global imageflag;

% define the appropriate ranges for input parameters
range_max_int   = [0 100000];
Zmax_user_int   = [100 20000];
freq_int        = [30 20000];
thetabw_int     = [0.1 45];
thetae_int      = [-45 45];
tx_height_int   = [1 20000];
epsilon_int     = [0.1 1000];
sigma_int       = [0.0001 10];
duct_M_int      = [0 3000];
duct_height_int = [0 100];
thresh_int      = [0 0.1];

runflag = 0;
save flag runflag
imageflag = 0;
default='2D Analysis'; 

choice = questdlg('Choose the Type of Analysis','PETOOL','2D Analysis','3D Analysis',default);
        
switch choice
             case '3D Analysis'         
                 mainwindow2;
                 x = load('defaultinputs.mat'); % load default parameters (from lastly-saved file)

set (findobj(gcf,'tag','radiobutton18'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','radiobutton19'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit27'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit28'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit25'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit26'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton15'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton17'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton18'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton19'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton11'),'enable','off','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);

set (findobj(gcf,'tag','edit1' ),'string',num2str(x.range));
set (findobj(gcf,'tag','edit2' ),'string',num2str(x.Zmax_user));
set (findobj(gcf,'tag','edit3' ),'string',num2str(x.freq));
set (findobj(gcf,'tag','edit10'),'string',num2str(x.thetabw));
set (findobj(gcf,'tag','edit11'),'string',num2str(x.thetae));
set (findobj(gcf,'tag','edit12'),'string',num2str(x.tx_height));
set (findobj(gcf,'tag','edit20'),'string',num2str(x.epsilon));
set (findobj(gcf,'tag','edit21'),'string',num2str(x.sigma));
set (findobj(gcf,'tag','edit22'),'string',' ');
set (findobj(gcf,'tag','popupmenu5'),'string',' ');
set (findobj(gcf,'tag','edit23'),'string',' ');
set (findobj(gcf,'tag','edit24'),'string',num2str(x.No_of_points));

set (findobj(gcf,'tag','editdeltaz'),'string',num2str(x.deltaz));
set (findobj(gcf,'tag','editdeltax'),'string',num2str(x.deltax));

set(findobj(gcf,'tag','popupmenu1'),'value',x.interp_type);

set(findobj(gcf,'tag','popupmenu3'),'value',x.polrz);
set(findobj(gcf,'tag','popupmenu4'),'value',x.surface_type);


range_int = [];
height_int = [];
if (x.range > range_max_int(1) & x.range < range_max_int(2)); range_int = [0 x.range]; end
if (x.Zmax_user >= Zmax_user_int(1) & x.Zmax_user <= Zmax_user_int(2)); height_int = [0 x.Zmax_user]; end
    
set (findobj(gcf,'tag','edit1' ),'tooltipstring',strcat('Range: (',num2str(range_max_int(1)),',',num2str(range_max_int(2)),')'));
set (findobj(gcf,'tag','edit2' ),'tooltipstring',strcat('Range: [',num2str(Zmax_user_int(1)),',',num2str(Zmax_user_int(2)),'] '));
set (findobj(gcf,'tag','edit3' ),'tooltipstring',strcat('Range: [',num2str(freq_int(1)),',',num2str(freq_int(2)),'] '));
set (findobj(gcf,'tag','edit10' ),'tooltipstring',strcat('Range: [',num2str(thetabw_int(1)),',',num2str(thetabw_int(2)),'] '));
set (findobj(gcf,'tag','edit11' ),'tooltipstring',strcat('Range: [',num2str(thetae_int(1)),',',num2str(thetae_int(2)),'] '));
set (findobj(gcf,'tag','edit12' ),'tooltipstring',strcat('Range: [',num2str(tx_height_int(1)),',',num2str(tx_height_int(2)),'] '));
set (findobj(gcf,'tag','edit20' ),'tooltipstring',strcat('Range: [',num2str(epsilon_int(1)),',',num2str(epsilon_int(2)),'] '));
set (findobj(gcf,'tag','edit21' ),'tooltipstring',strcat('Range: [',num2str(sigma_int(1)),',',num2str(sigma_int(2)),'] '));
set (findobj(gcf,'tag','edit22' ),'tooltipstring',strcat('Range: [',num2str(range_int(1)),',',num2str(range_int(2)),'] '));
set (findobj(gcf,'tag','popupmenu5' ),'tooltipstring',strcat('Range: [',num2str(height_int(1)),',',num2str(height_int(2)),']'));
set (findobj(gcf,'tag','edit23' ),'tooltipstring',strcat('Range: [',num2str(range_int(1)),',',num2str(range_int(2)),'] '));
set (findobj(gcf,'tag','edit24' ),'tooltipstring',strcat('Range: [1, inf)'));
set (findobj(gcf,'tag','editdeltaz' ),'tooltipstring',strcat('Altitude step > 0'));
set (findobj(gcf,'tag','editdeltax' ),'tooltipstring',strcat('Range step > 0'));

duct_M_array1      = x.duct_M_array1;
duct_height_array1 = x.duct_height_array1;
duct_M_array2      = x.duct_M_array2;
duct_height_array2 = x.duct_height_array2;
save duct1 duct_M_array1 duct_height_array1 
save duct2 duct_M_array2 duct_height_array2

% set (findobj(gcf,'tag','listbox1'),'string',num2str(x.edge_range_array.'));
% set (findobj(gcf,'tag','listbox2'),'string',num2str(x.edge_height_array.'));

 set (findobj(gcf,'tag','listbox1'),'string','');
 set (findobj(gcf,'tag','listbox2'),'string','');

if (~isempty(x.duct_type_array1)); set(findobj(gcf,'tag','popupmenu6'),'value',x.duct_type_array1); end

set (findobj(gcf,'tag','listbox3'),'string',num2str(x.duct_range_array.'));
index_array = x.duct_type_array2;
clear type_array;
if length(index_array)==0
type_array = [];
end
for i=1:length(index_array)
    switch(index_array(i))
    case 1, type_array(i) = cellstr('Standard atmosphere');
    case 2, type_array(i) = cellstr('Surface duct'      );
    case 3, type_array(i) = cellstr('Surface-based duct' );
    case 4, type_array(i) = cellstr('Elevated duct');
    case 5, type_array(i) = cellstr('Evaporation duct' );
    case 6, type_array(i) = cellstr('User defined');
    end
end
set (findobj(gcf,'tag','listbox4'),'string',type_array);

    
switch(x.ground_type)
case 1, set (findobj(gcf,'tag','radiobutton9'),'value',1);
        set (findobj(gcf,'tag','radiobutton10'),'value',0);
        set (findobj(gcf,'tag','popupmenu4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit20'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit21'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
case 2, set (findobj(gcf,'tag','radiobutton9'),'value',0);
        set (findobj(gcf,'tag','radiobutton10'),'value',1);
        set (findobj(gcf,'tag','popupmenu4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','edit20'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','edit21'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end
    

switch(x.terrain_type)
case 1, set (findobj(gcf,'tag','radiobutton11'),'value',1);
        set (findobj(gcf,'tag','radiobutton12'),'value',0);
        set (findobj(gcf,'tag','edit22'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','popupmenu5'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); % Tag popupmenu5 ama editbox
        set (findobj(gcf,'tag','listbox1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','listbox2'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit24'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);        
        set (findobj(gcf,'tag','pushbutton7'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);
        set (findobj(gcf,'tag','pushbutton8'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);  
        set (findobj(gcf,'tag','pushbutton9'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);    
        set (findobj(gcf,'tag','pushbutton10'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);                                
        set (findobj(gcf,'tag','pushbutton11'),'enable','off','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]); 
        set (findobj(gcf,'tag','popupmenu1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);      
case 2, set (findobj(gcf,'tag','radiobutton11'),'value',0);
        set (findobj(gcf,'tag','radiobutton12'),'value',1);
        set (findobj(gcf,'tag','edit22'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','popupmenu5'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); % Tag popupmenu5 ama editbox
        set (findobj(gcf,'tag','listbox1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','listbox2'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit24'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton7'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton8'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);  
        set (findobj(gcf,'tag','pushbutton9'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);   
        set (findobj(gcf,'tag','pushbutton10'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);                                        
        set (findobj(gcf,'tag','pushbutton11'),'enable','off','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','popupmenu1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);     
end

switch(x.backward)
case 1, set (findobj(gcf,'tag','radiobutton15'),'value',0); set (findobj(gcf,'tag','radiobutton20'),'value',1);
case 2, set (findobj(gcf,'tag','radiobutton15'),'value',1); set (findobj(gcf,'tag','radiobutton20'),'value',0);
end



switch(x.refrac_type)
case 1, set (findobj(gcf,'tag','radiobutton13'),'value',1);
        set (findobj(gcf,'tag','radiobutton14'),'value',0);
        set (findobj(gcf,'tag','popupmenu6'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
        set (findobj(gcf,'tag','edit23'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','popupmenu7'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
        set (findobj(gcf,'tag','listbox3'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','listbox4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','pushbutton12'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);   
        set (findobj(gcf,'tag','pushbutton13'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);                
case 2, set (findobj(gcf,'tag','radiobutton13'),'value',0);
        set (findobj(gcf,'tag','radiobutton14'),'value',1);
        set (findobj(gcf,'tag','popupmenu6'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
        set (findobj(gcf,'tag','edit23'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','popupmenu7'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
        set (findobj(gcf,'tag','listbox3'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','listbox4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton12'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);   
        set (findobj(gcf,'tag','pushbutton13'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);                
end

case '2D Analysis'
mainwindow; % call main  window
    
x = load('defaultinputs.mat'); % load default parameters (from lastly-saved file)

set (findobj(gcf,'tag','radiobutton18'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','radiobutton19'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit27'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit28'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit25'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','edit26'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton15'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton17'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton18'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(gcf,'tag','pushbutton19'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);

set (findobj(gcf,'tag','edit1' ),'string',num2str(x.range));
set (findobj(gcf,'tag','edit2' ),'string',num2str(x.Zmax_user));
set (findobj(gcf,'tag','edit3' ),'string',num2str(x.freq));
set (findobj(gcf,'tag','edit10'),'string',num2str(x.thetabw));
set (findobj(gcf,'tag','edit11'),'string',num2str(x.thetae));
set (findobj(gcf,'tag','edit12'),'string',num2str(x.tx_height));
set (findobj(gcf,'tag','edit20'),'string',num2str(x.epsilon));
set (findobj(gcf,'tag','edit21'),'string',num2str(x.sigma));
set (findobj(gcf,'tag','edit22'),'string',' ');
set (findobj(gcf,'tag','popupmenu5'),'string',' ');
set (findobj(gcf,'tag','edit23'),'string',' ');
set (findobj(gcf,'tag','edit24'),'string',num2str(x.No_of_points));

set (findobj(gcf,'tag','editdeltaz'),'string',num2str(x.deltaz));
set (findobj(gcf,'tag','editdeltax'),'string',num2str(x.deltax));

set(findobj(gcf,'tag','popupmenu1'),'value',x.interp_type);

set(findobj(gcf,'tag','popupmenu3'),'value',x.polrz);
set(findobj(gcf,'tag','popupmenu4'),'value',x.surface_type);

range_int = [];
height_int = [];
if (x.range > range_max_int(1) & x.range < range_max_int(2)); range_int = [0 x.range]; end
if (x.Zmax_user >= Zmax_user_int(1) & x.Zmax_user <= Zmax_user_int(2)); height_int = [0 x.Zmax_user]; end
    
set (findobj(gcf,'tag','edit1' ),'tooltipstring',strcat('Range: (',num2str(range_max_int(1)),',',num2str(range_max_int(2)),')'));
set (findobj(gcf,'tag','edit2' ),'tooltipstring',strcat('Range: [',num2str(Zmax_user_int(1)),',',num2str(Zmax_user_int(2)),'] '));
set (findobj(gcf,'tag','edit3' ),'tooltipstring',strcat('Range: [',num2str(freq_int(1)),',',num2str(freq_int(2)),'] '));
set (findobj(gcf,'tag','edit10' ),'tooltipstring',strcat('Range: [',num2str(thetabw_int(1)),',',num2str(thetabw_int(2)),'] '));
set (findobj(gcf,'tag','edit11' ),'tooltipstring',strcat('Range: [',num2str(thetae_int(1)),',',num2str(thetae_int(2)),'] '));
set (findobj(gcf,'tag','edit12' ),'tooltipstring',strcat('Range: [',num2str(tx_height_int(1)),',',num2str(tx_height_int(2)),'] '));
set (findobj(gcf,'tag','edit20' ),'tooltipstring',strcat('Range: [',num2str(epsilon_int(1)),',',num2str(epsilon_int(2)),'] '));
set (findobj(gcf,'tag','edit21' ),'tooltipstring',strcat('Range: [',num2str(sigma_int(1)),',',num2str(sigma_int(2)),'] '));
set (findobj(gcf,'tag','edit22' ),'tooltipstring',strcat('Range: [',num2str(range_int(1)),',',num2str(range_int(2)),'] '));
set (findobj(gcf,'tag','popupmenu5' ),'tooltipstring',strcat('Range: [',num2str(height_int(1)),',',num2str(height_int(2)),']'));
set (findobj(gcf,'tag','edit23' ),'tooltipstring',strcat('Range: [',num2str(range_int(1)),',',num2str(range_int(2)),'] '));
set (findobj(gcf,'tag','edit24' ),'tooltipstring',strcat('Range: [1, inf)'));
set (findobj(gcf,'tag','editdeltaz' ),'tooltipstring',strcat('Altitude step > 0'));
set (findobj(gcf,'tag','editdeltax' ),'tooltipstring',strcat('Range step > 0'));

duct_M_array1      = x.duct_M_array1;
duct_height_array1 = x.duct_height_array1;
duct_M_array2      = x.duct_M_array2;
duct_height_array2 = x.duct_height_array2;
save duct1 duct_M_array1 duct_height_array1 
save duct2 duct_M_array2 duct_height_array2

set (findobj(gcf,'tag','listbox1'),'string',num2str(x.edge_range_array.'));
set (findobj(gcf,'tag','listbox2'),'string',num2str(x.edge_height_array.'));

if (~isempty(x.duct_type_array1)); set(findobj(gcf,'tag','popupmenu6'),'value',x.duct_type_array1); end

set (findobj(gcf,'tag','listbox3'),'string',num2str(x.duct_range_array.'));
index_array = x.duct_type_array2;
clear type_array;
if length(index_array)==0
type_array = [];
end
for i=1:length(index_array)
    switch(index_array(i))
    case 1, type_array(i) = cellstr('Standard atmosphere');
    case 2, type_array(i) = cellstr('Surface duct'      );
    case 3, type_array(i) = cellstr('Surface-based duct' );
    case 4, type_array(i) = cellstr('Elevated duct');
    case 5, type_array(i) = cellstr('Evaporation duct' );
    case 6, type_array(i) = cellstr('User defined');
    end
end
set (findobj(gcf,'tag','listbox4'),'string',type_array);

    
switch(x.ground_type)
case 1, set (findobj(gcf,'tag','radiobutton9'),'value',1);
        set (findobj(gcf,'tag','radiobutton10'),'value',0);
        set (findobj(gcf,'tag','popupmenu4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit20'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit21'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
case 2, set (findobj(gcf,'tag','radiobutton9'),'value',0);
        set (findobj(gcf,'tag','radiobutton10'),'value',1);
        set (findobj(gcf,'tag','popupmenu4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','edit20'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','edit21'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end
    

switch(x.terrain_type)
case 1, set (findobj(gcf,'tag','radiobutton11'),'value',1);
        set (findobj(gcf,'tag','radiobutton12'),'value',0);
        set (findobj(gcf,'tag','edit22'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','popupmenu5'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); % Tag popupmenu5 ama editbox
        set (findobj(gcf,'tag','listbox1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','listbox2'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','edit24'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);        
        set (findobj(gcf,'tag','pushbutton7'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);
        set (findobj(gcf,'tag','pushbutton8'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);  
        set (findobj(gcf,'tag','pushbutton9'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);    
        set (findobj(gcf,'tag','pushbutton10'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);                                
        set (findobj(gcf,'tag','pushbutton11'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]); 
        set (findobj(gcf,'tag','popupmenu1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[.5 .5 .5]);      
case 2, set (findobj(gcf,'tag','radiobutton11'),'value',0);
        set (findobj(gcf,'tag','radiobutton12'),'value',1);
        set (findobj(gcf,'tag','edit22'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','popupmenu5'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); % Tag popupmenu5 ama editbox
        set (findobj(gcf,'tag','listbox1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','listbox2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','edit24'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton7'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton8'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);  
        set (findobj(gcf,'tag','pushbutton9'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);   
        set (findobj(gcf,'tag','pushbutton10'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);                                        
        set (findobj(gcf,'tag','pushbutton11'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','popupmenu1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);     
end

switch(x.backward)
case 1, set (findobj(gcf,'tag','radiobutton15'),'value',0); set (findobj(gcf,'tag','radiobutton20'),'value',1);
case 2, set (findobj(gcf,'tag','radiobutton15'),'value',1); set (findobj(gcf,'tag','radiobutton20'),'value',0);
end


switch(x.refrac_type)
case 1, set (findobj(gcf,'tag','radiobutton13'),'value',1);
        set (findobj(gcf,'tag','radiobutton14'),'value',0);
        set (findobj(gcf,'tag','popupmenu6'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
        set (findobj(gcf,'tag','edit23'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','popupmenu7'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
        set (findobj(gcf,'tag','listbox3'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','listbox4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
        set (findobj(gcf,'tag','pushbutton12'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);   
        set (findobj(gcf,'tag','pushbutton13'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);                
case 2, set (findobj(gcf,'tag','radiobutton13'),'value',0);
        set (findobj(gcf,'tag','radiobutton14'),'value',1);
        set (findobj(gcf,'tag','popupmenu6'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
        set (findobj(gcf,'tag','edit23'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','popupmenu7'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
        set (findobj(gcf,'tag','listbox3'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','listbox4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
        set (findobj(gcf,'tag','pushbutton12'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);   
        set (findobj(gcf,'tag','pushbutton13'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);                
end
end
