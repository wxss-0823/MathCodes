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
% This function saves the input parameters in a user-defined file, or saves
% the input parameters on exit. It also checks whether the values of the 
% parameters are in appropriate ranges
% ************************************************************************
function error_msg = filesave(fpname)
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

h = findobj('tag','figure2');
set(findobj(h,'tag','texterror'),'string',' ');
error_msg = [];
range       = str2num(get(findobj(h,'tag','edit1' ),'string'));
Zmax_user   = str2num(get(findobj(h,'tag','edit2' ),'string'));
freq        = str2num(get(findobj(h,'tag','edit3' ),'string'));

thetabw     = str2num(get(findobj(h,'tag','edit10'),'string'));
thetae      = str2num(get(findobj(h,'tag','edit11'),'string'));

tx_height   = str2num(get(findobj(h,'tag','edit12'),'string'));

epsilon     = str2num(get(findobj(h,'tag','edit20'),'string'));
sigma       = str2num(get(findobj(h,'tag','edit21'),'string'));

deltax       = str2num(get(findobj(h,'tag','editdeltax'),'string'));
deltaz       = str2num(get(findobj(h,'tag','editdeltaz'),'string'));

No_of_points = str2num(get(findobj(h,'tag','edit24'),'string'));

interp_type = get(findobj(h,'tag','popupmenu1'),'value');

polrz       = get(findobj(h,'tag','popupmenu3'),'value');
surface_type = get(findobj(h,'tag','popupmenu4'),'value');

edge_range_array  = (str2num(get(findobj(h,'tag','listbox1'),'string'))).';
edge_height_array = (str2num(get(findobj(h,'tag','listbox2'),'string'))).';

duct_type_array1 = get(findobj(h,'tag','popupmenu6'),'value');

duct_range_array  = (str2num(get(findobj(h,'tag','listbox3'),'string'))).';
con = cellstr(get(findobj(h,'tag','listbox4'),'string'));
duct_type_array2 = [];
for i=1:length(duct_range_array)
    switch(char(con(i)))
    case 'Standard atmosphere', duct_type_array2(i) = 1;
    case 'Surface duct'      , duct_type_array2(i) = 2;
    case 'Surface-based duct' , duct_type_array2(i) = 3;
    case 'Elevated duct', duct_type_array2(i) = 4;
    case 'Evaporation duct' , duct_type_array2(i) = 5;
    case 'User defined', duct_type_array2(i) = 6;    
    end
end

load duct1  % duct_M_array1 ve duct_height_array1 
load duct2  % duct_M_array2 ve duct_height_array2 

% CHECK THE PARAMETERS, and GIVE WARNING IF THEY ARE INAPPROPRIATE
if (isempty(range) | length(range)>1 | range<0) 
    error_msg = ['Error in the last range value !'];
elseif range > range_max_int(2) | range < range_max_int(1)
    error_msg = ['The last range must be between [',num2str(range_max_int(1)),',',num2str(range_max_int(2)),'] km !'];
elseif (isempty(Zmax_user) | length(Zmax_user)>1 | Zmax_user<0) 
    error_msg = ['Error in the last height value  !'];
elseif Zmax_user > Zmax_user_int(2) | Zmax_user < Zmax_user_int(1)
    error_msg = ['The last height must be between [',num2str(Zmax_user_int(1)),',',num2str(Zmax_user_int(2)),'] m !'];
elseif (isempty(freq) | length(freq)>1 | freq<0) 
    error_msg = ['Error in frquency !'];
elseif freq > freq_int(2) | freq < freq_int(1)
    error_msg = ['Frequency must be between [',num2str(freq_int(1)),',',num2str(freq_int(2)),'] Mhz !'];
elseif (isempty(thetabw) | length(thetabw)>1) 
    error_msg = ['Error in 3dB beamwidth !'];
elseif thetabw > thetabw_int(2) | thetabw < thetabw_int(1)
    error_msg = ['3dB beamwidth must be between [',num2str(thetabw_int(1)),',',num2str(thetabw_int(2)),'] derece   !'];
elseif (isempty(thetae) | length(thetae)>1) 
    error_msg = ['Error in beam pointing angle !'];
elseif thetae > thetae_int(2) | thetae < thetae_int(1)
    error_msg = ['Beam pointing angle must be between [',num2str(thetae_int(1)),',',num2str(thetae_int(2)),'] derece   !'];
elseif (isempty(tx_height) | length(tx_height)>1 | tx_height<0) 
    error_msg = ['Error in antenna height !'];
elseif tx_height > tx_height_int(2) | tx_height < tx_height_int(1)
    error_msg = ['Antenna height must be between [',num2str(tx_height_int(1)),',',num2str(tx_height_int(2)),'] m   !'];
elseif (get(findobj(h,'tag','radiobutton10'),'value') & (isempty(epsilon) | length(epsilon)>1)) 
    error_msg = ['Error in dielectric constant !'];
elseif (epsilon > epsilon_int(2) | epsilon < epsilon_int(1)) & (get(findobj(h,'tag','radiobutton10') ,'value')) & (get(findobj(h,'tag','popupmenu4'),'value') == 6)
    error_msg = ['Dielectric constant must be between[',num2str(epsilon_int(1)),',',num2str(epsilon_int(2)),']   !'];
elseif (get(findobj(h,'tag','radiobutton10'),'value') & (isempty(sigma) | length(sigma)>1)) 
    error_msg = ['Error in conductivity !'];
elseif (sigma > sigma_int(2) | sigma < sigma_int(1)) & (get(findobj(h,'tag','radiobutton10') ,'value')) & (get(findobj(h,'tag','popupmenu4') ,'value') == 6)
    error_msg = ['Conductivity must be between [',num2str(sigma_int(1)),',',num2str(sigma_int(2)),']   !'];
elseif (get(findobj(h,'tag','radiobutton12'),'value') & isempty(edge_range_array)) 
    error_msg = ['Error in terrain parameters !'];
%elseif (max(edge_range_array) >= range | min(edge_range_array) <= 0) & get(findobj(h,'tag','radiobutton12') ,'value')
    %error_msg = ['terrain parameters must be between (0,',num2str(range),') km   !'];
%elseif (get(findobj(h,'tag','radiobutton14'),'value') & isempty(duct_range_array)) 
%    error_msg = ['Error in atmosphere parameters !'];
elseif (isempty(find(duct_range_array == 0)) | isempty(find(duct_range_array == range))) & get(findobj(h,'tag','radiobutton14') ,'value')
    error_msg = ['Atmosphere parameters must be between 0 km and ',num2str(range),' km  !'];
%elseif (max(duct_range_array) > range | min(duct_range_array) < 0) & get(findobj(h,'tag','radiobutton14') ,'value')
%    error_msg = ['must be between [0,',num2str(range),'] km   !'];
elseif (isempty(deltax) | length(deltax)>1 | deltax<=0 | deltax>range*1e3) 
    error_msg = ['Error in range step !'];
elseif (isempty(deltaz) | length(deltaz)>1 | deltaz<=0 | deltaz>Zmax_user)
    error_msg = ['Error in altitude step !'];    
end

if (get(findobj(h,'tag','radiobutton15') ,'value')) == 0
    backward  = 1; 
else
    backward  = 2;     
end



if (get(findobj(h,'tag','radiobutton9') ,'value')) ground_type  = 1; end
if (get(findobj(h,'tag','radiobutton10'),'value')) ground_type  = 2; end
if (get(findobj(h,'tag','radiobutton11'),'value')) terrain_type = 1; end
if (get(findobj(h,'tag','radiobutton12'),'value')) terrain_type = 2; end
if (get(findobj(h,'tag','radiobutton13'),'value')) refrac_type  = 1; end
if (get(findobj(h,'tag','radiobutton14'),'value')) refrac_type  = 2; end
input_ready_flag = 0;
save input_ready_flag input_ready_flag

%duct_M_array1(6,1:4) = zeros(1,4);
%duct_height_array1(6,1:4) = zeros(1,4);
%save duct1 duct_M_array1 duct_height_array1

if (isempty(error_msg))
    save(fpname,'range', ... 
                'Zmax_user', ...  
                'freq', ... 
                'thetabw', ... 
                'thetae', ... 
                'tx_height', ... 
                'epsilon', ...
                'sigma', ... 
                'polrz', ...
                'deltaz', ...
                'deltax', ...
                'No_of_points', ...
                'edge_range_array', ...
                'edge_height_array', ...
                'duct_range_array', ...
                'duct_type_array1', ...
                'duct_type_array2', ...
                'duct_M_array1', ...  
                'duct_M_array2', ...  
                'duct_height_array1', ...
                'duct_height_array2', ...
                'ground_type', ...
                'terrain_type', ...
                'backward', ...   
                'interp_type', ...                               
                'refrac_type', ...
                'surface_type');       
    %if get(findobj(h,'tag','radiobutton12'),'value')
    %    set(findobj(h,'tag','edit22'),'string',' ','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    %    set(findobj(h,'tag','popupmenu5'),'string',' ','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    %end
    %if get(findobj(h,'tag','radiobutton14'),'value')
    %    set(findobj(h,'tag','edit23'),'string',' ','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    %end
            
end
