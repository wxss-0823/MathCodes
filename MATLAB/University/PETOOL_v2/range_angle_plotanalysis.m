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

function varargout = range_angle_plotanalysis(varargin)
% RANGE_ANGLE_PLOTANALYSIS MATLAB code for range_angle_plotanalysis.fig
%      RANGE_ANGLE_PLOTANALYSIS, by itself, creates a new RANGE_ANGLE_PLOTANALYSIS or raises the existing
%      singleton*.
%
%      H = RANGE_ANGLE_PLOTANALYSIS returns the handle to a new RANGE_ANGLE_PLOTANALYSIS or the handle to
%      the existing singleton*.
%
%      RANGE_ANGLE_PLOTANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RANGE_ANGLE_PLOTANALYSIS.M with the given input arguments.
%
%      RANGE_ANGLE_PLOTANALYSIS('Property','Value',...) creates a new RANGE_ANGLE_PLOTANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before range_angle_plotanalysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to range_angle_plotanalysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help range_angle_plotanalysis

% Last Modified by GUIDE v2.5 06-Nov-2019 16:47:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @range_angle_plotanalysis_OpeningFcn, ...
                   'gui_OutputFcn',  @range_angle_plotanalysis_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before range_angle_plotanalysis is made visible.
function range_angle_plotanalysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to range_angle_plotanalysis (see VARARGIN)
set(findobj(handles.figurerange,'tag','radiobutton1'),'value',0);
set(findobj(handles.figurerange,'tag','radiobutton2'),'value',0);
set (findobj(handles.figurerange,'tag','radiobutton1'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figurerange,'tag','radiobutton2'),'enable','inactive','foregroundcolor',[0.5 0.5 0.5]);

set (findobj(handles.figurerange,'tag','edit1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figurerange,'tag','edit2'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figurerange,'tag','pushbutton1'),'enable','off','foregroundcolor',[0.5 0.5 0.5]); 
set (findobj(handles.figurerange,'tag','pushbutton2'),'enable','off','foregroundcolor',[0.5 0.5 0.5]); 

% UIWAIT makes range_angle_plotanalysis wait for user response (see UIRESUME)
% uiwait(handles.figurerange);


% --- Outputs from this function are returned to the command line.
function varargout = range_angle_plotanalysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18

global chosen_method
global path_loss_final
global prop_fact_final
global free_space_loss
global range_vec_pol
global z_user
global plot_flag
global plot_array_pol
global xmin_pol;
global xmax_pol;
global ymin_pol;
global ymax_pol;
global readx;
global ready;
global new_x_pol;
global new_y_pol;
global hhimage;
global cb;
global imageflag;
global counter;
global endpoint;
global counttick;
global propfacvalue
global pathlossvalue

altitudevalue2 = str2num(get(findobj(gcf,'tag','edit6'),'string'));
load altitude

if isempty(altitudevalue2)
    set (findobj(gcf,'tag','text12'),'string',['Please first enter the altitude value and click the Plot button !']);
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',1,'foregroundcolor',[0 0 0]);
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',0,'foregroundcolor',[0 0 0]);    
elseif (altitudevalue2 ~= altitudevalue)
    set (findobj(gcf,'tag','text12'),'string',['Please first click the Plot button to update the results for the new altitude !']);
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',1,'foregroundcolor',[0 0 0]);
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',0,'foregroundcolor',[0 0 0]);    
else
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',1,'foregroundcolor',[0 0 0]);
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',0,'foregroundcolor',[0 0 0]);
    set (findobj(handles.figurerange,'tag','edit1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','edit2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','pushbutton1'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(handles.figurerange,'tag','pushbutton2'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    
    load results_array
    load angle_list
    edit1_Callback(hObject, eventdata, handles)
    
    counttick = angle_list;
    plot_array_pol = propfacvalue;
    valmin_prop = min(propfacvalue(:));
    valmax_prop = max(propfacvalue(:));
    set (findobj(handles.figurerange,'tag','edit1'),'string',(num2str(valmin_prop)));
    set (findobj(handles.figurerange,'tag','edit2'),'string',(num2str(valmax_prop)));
    
%     plot_flag = 2;
    new_x_pol = range_vec_pol./1e3;
    new_y_pol = counttick;
    xmin_pol = new_x_pol(1);
    xmax_pol = new_x_pol(length(new_x_pol));
    ymin_pol = min(counttick);
    ymax_pol = z_user_pol(length(counttick));
    polarPcolor(range_vec_pol,counttick,plot_array_pol)
    edit1_Callback(hObject, eventdata, handles);
    edit2_Callback(hObject, eventdata, handles);
    set(handles.figurerange,'WindowButtonMotionFcn','guimousevalue_polarplot');
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global chosen_method
global path_loss_final
global prop_fact_final
global free_space_loss
global range_vec_pol
global z_user_pol
global plot_flag
global new_x_pol
global new_y_pol 
global xmin_pol
global xmax_pol
global ymin_pol
global ymax_pol
global readx;
global ready;
global hhimage;
global cb;
global imageflag;
global counter;
global endpoint;
global counttick;
global propfacvalue
global pathlossvalue
global plot_array_pol

altitudevalue2 = str2num(get(findobj(gcf,'tag','edit6'),'string'));
load altitude

if isempty(altitudevalue2)
    set (findobj(gcf,'tag','text12'),'string',['Please first enter the altitude value and click the Plot button !']);
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',0,'foregroundcolor',[0 0 0],'enable','on');
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',1,'foregroundcolor',[0 0 0],'enable','on');    
elseif (altitudevalue2 ~= altitudevalue)
    set (findobj(gcf,'tag','text12'),'string',['Please first click the Plot button to update the results for the new altitude !']);
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',0,'foregroundcolor',[0 0 0],'enable','on');
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',1,'foregroundcolor',[0 0 0],'enable','on');    
else
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',0,'foregroundcolor',[0 0 0],'enable','on');
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',1,'foregroundcolor',[0 0 0],'enable','on');
    set (findobj(handles.figurerange,'tag','edit1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','edit2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','pushbutton1'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(handles.figurerange,'tag','pushbutton2'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    
    load results_array
    load angle_list
    edit1_Callback(hObject, eventdata, handles)
    
    counttick = angle_list;
    plot_array_pol = pathlossvalue;
    valmin_path = min(pathlossvalue(:));
    valmax_path = max(pathlossvalue(:));
    set (findobj(handles.figurerange,'tag','edit1'),'string',(num2str(valmin_path)));
    set (findobj(handles.figurerange,'tag','edit2'),'string',(num2str(valmax_path)));

    %             plot_flag = 2;
    new_x_pol = range_vec_pol/1e3;
    new_y_pol = counttick;
    xmin_pol = new_x_pol(1);
    xmax_pol = new_x_pol(length(new_x_pol));
    ymin_pol = min(counttick);
    ymax_pol = z_user_pol(length(counttick));
    polarPcolor(range_vec_pol,counttick,plot_array_pol)
    edit1_Callback(hObject, eventdata, handles);
    edit2_Callback(hObject, eventdata, handles);
    set(handles.figurerange,'WindowButtonMotionFcn','guimousevalue_polarplot');
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
valmin = str2num(get(findobj(handles.figurerange,'tag','edit1'),'string'));
valmax = str2num(get(findobj(handles.figurerange,'tag','edit2'),'string'));

ca = caxis;

if ~isempty(valmin) && ~isempty(valmax)
    if valmin < valmax
       caxis([valmin valmax]);
    else
       set(findobj(handles.figurerange,'tag','edit1'),'string',num2str(ca(1))); 
       set(findobj(handles.figurerange,'tag','edit2'),'string',num2str(ca(2)));        
    end
elseif ~isempty(valmin) && isempty(valmax)
    caxis([valmin ca(2)]);    
elseif isempty(valmin) && ~isempty(valmax)
    caxis([ca(1) valmax]);
else
    % do nothing
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
set(findobj(handles.figurerange,'tag','text12'),'string',' ');
valmin = str2num(get(findobj(handles.figurerange,'tag','edit1'),'string'));
valmax = str2num(get(findobj(handles.figurerange,'tag','edit2'),'string'));

ca = caxis;

if ~isempty(valmin) && ~isempty(valmax)
    if valmin < valmax
       caxis([valmin valmax]);
    else
       set(findobj(handles.figurerange,'tag','edit1'),'string',num2str(ca(1))); 
       set(findobj(handles.figurerange,'tag','edit2'),'string',num2str(ca(2)));        
    end
elseif ~isempty(valmin) && isempty(valmax)
    caxis([valmin ca(2)]);    
elseif isempty(valmin) && ~isempty(valmax)
    caxis([ca(1) valmax]);
else
    % do nothing
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prop_fact_final;
global path_loss_final;
global range_vec;
global z_user;

load resultpath
load angle_list
 
load altitude
%altitudevalue = str2num(get(findobj(gcf,'tag','edit6'),'string'));
msgbox(['Analysis Results for ',num2str(altitudevalue) ,' meter will be saved.'],'Warning!');
uiwait

load results_array
    
angle_values = angle_list;

set(gcf,'WindowButtonMotionFcn','');

set(findobj(handles.figurerange,'tag','text12'),'string',' ');
cd User_Files\output_result
[fname,pname] = uiputfile('*.mat','Save 3D maps to file');
cd .. 
cd ..
if(fname~=0)
    fpname = strcat(pname,fname);
    if (isempty(findstr(fpname,'.mat'))); fpname = strcat(fpname,'.mat');end 

    if exist(fpname,'file')
        delete(fpname);
    end

    pause(.5)    
    save(fpname,'propfacvalue', 'pathlossvalue', 'range_vec_pol', 'angle_values');
    pause(.5)

    set (findobj(handles.figurerange,'tag','text12'),'string',strcat('3D maps have been saved in  "',fname,'" '));
    pause(1)
end
choice_val = get(findobj(handles.figurerange,'tag','radiobutton2'),'value');
if choice_val == 0
    radiobutton1_Callback(hObject, eventdata, handles)
else
    radiobutton2_Callback(hObject, eventdata, handles)
end
% set(gcf,'WindowButtonMotionFcn','plotanalysis_guimousevalue');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hhimage;
global plot_array_pol
global range_vec_pol;
global z_user;
global new_x_pol
global new_y_pol 
global xmin_pol
global xmax_pol
global ymin_pol
global ymax_pol

load resultpath
load angle_list

set(gcf,'WindowButtonMotionFcn','');
counttick = angle_list;
new_x_pol = range_vec_pol./1e3;
new_y_pol = counttick; 
xmin_pol = new_x_pol(1);
xmax_pol = new_x_pol(length(new_x_pol));
ymin_pol = min(counttick);
ymax_pol = z_user(length(counttick));

    
set(findobj(handles.figurerange,'tag','text12'),'string',' ');
fname = 0; pname = 0;
cd User_Files\output_result
[fname,pname] = uiputfile('*.tif','Save 3D maps to file');
cd .. 
cd ..
if(fname~=0)
    fpname = strcat(pname,fname);
    
    image_gui;
    %axes(axes1)
    hnew=findobj('tag','figureplot');
    polarPcolor(range_vec_pol,counttick,plot_array_pol)
%     hx=xlabel('Range (km)','Linewidth',2,'fontweight','bold','fontsize',11);
%     hy=ylabel('Altitude (m)','Linewidth',2,'fontweight','bold','fontsize',11);

%     cb = colorbar('eastoutside');
%     set(cb,'units', 'pixel');
%     cpos = get(cb,'Position');
%     cpos(3) = cpos(3)/2; % Halve the thickness
%     set(cb,'Position',cpos);
%     set(gca,'units', 'pixel');
%     apos = get(gca,'Position');
%     cpos(1) = apos(1)+apos(3)+8;
%     set(cb,'Position',cpos);
    
    ca(1) = str2num(get(findobj(handles.figurerange,'tag','edit1'),'string'));
    ca(2) = str2num(get(findobj(handles.figurerange,'tag','edit2'),'string'));
    caxis(ca);
    %saveas(hnew, 'sil.jpg', 'jpg');
    
    print(hnew, '-dtiff','-r300',fpname);
    close(hnew)

    set (findobj(handles.figurerange,'tag','text12'),'string',strcat('3D maps have been saved in  "',fname,'" ')); 
end

 
choice_val = get(findobj(handles.figurerange,'tag','radiobutton2'),'value');
if choice_val == 0
    radiobutton1_Callback(hObject, eventdata, handles)
else
    radiobutton2_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in pushbutton5.
% PLOT
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global chosen_method
global path_loss_final
global prop_fact_final
global free_space_loss
global range_vec_pol
global z_user
global plot_flag
global plot_array
global readx_pol;
global readpol;
global hhimage;
global cb;
global imageflag;
global counter;
global endpoint;
global counttick;
global propfacvalue
global pathlossvalue
global plot_array_pol
global new_x_pol
global new_y_pol
global xmin_pol
global xmax_pol
global ymin_pol
global ymax_pol

altitudevalue = str2num(get(findobj(gcf,'tag','edit6'),'string'));
load maxheight.mat

if isempty(altitudevalue)
    set (findobj(gcf,'tag','text12'),'string',['Please enter the altitude value !']);
elseif (altitudevalue > max(heightval)) || (altitudevalue <= 0 )
    set (findobj(gcf,'tag','text12'),'string',['Altitude must be between (0-',num2str(heightval),']']);
else
    set(findobj(handles.figurerange,'tag','radiobutton1'),'value',1,'foregroundcolor',[0 0 0],'enable','on');
    set(findobj(handles.figurerange,'tag','radiobutton2'),'value',0,'foregroundcolor',[0 0 0],'enable','on');
    set (findobj(handles.figurerange,'tag','edit1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','edit2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
    set (findobj(handles.figurerange,'tag','pushbutton1'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(handles.figurerange,'tag','pushbutton2'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    
    save altitude altitudevalue
    load resultpath
    load angle_list
    
    edit1_Callback(hObject, eventdata, handles)
    
    pathlossvalue = [];
    propfacvalue = [];
    
    for countme = 1:length(angle_list)
        load([finalpath '/' num2str(angle_list(countme)) '.mat'])
        path_loss_final_pol = result.path_loss_final;
        prop_fact_final_pol = result.prop_fact_final;
        %             free_space_loss_pol = result.free_space_loss;
        range_vec_pol = result.range_vec;
        z_user_pol = result.z_user;
        %             z = result.z;
        %             altitudeindex = find(round(z_user_pol) == altitudevalue);
        [~, altitudeindex] = min(abs(round(z_user_pol)-altitudevalue));
        
        pathloss_val = path_loss_final_pol(altitudeindex, :);
        propfact_val = prop_fact_final_pol(altitudeindex, :);
        
        pathlossvalue = [pathlossvalue;pathloss_val];
        propfacvalue = [propfacvalue;propfact_val];
    end
    counttick = angle_list;
    plot_array_pol = propfacvalue;
    valmin_prop = min(propfacvalue(:));
    valmax_prop = max(propfacvalue(:));
    set (findobj(handles.figurerange,'tag','edit1'),'string',(num2str(valmin_prop)));
    set (findobj(handles.figurerange,'tag','edit2'),'string',(num2str(valmax_prop)));
    save results_array pathlossvalue propfacvalue z_user_pol range_vec_pol
    
    plot_flag = 2;
    new_x_pol = range_vec_pol./1e3;
    new_y_pol = counttick;
    xmin_pol = new_x_pol(1);
    xmax_pol = new_x_pol(length(new_x_pol));
    ymin_pol = min(counttick);
    ymax_pol = z_user_pol(length(counttick));
    polarPcolor(range_vec_pol,counttick,plot_array_pol)
    edit1_Callback(hObject, eventdata, handles);
    edit2_Callback(hObject, eventdata, handles);
    set(handles.figurerange,'WindowButtonMotionFcn','guimousevalue_polarplot');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figurerange)
