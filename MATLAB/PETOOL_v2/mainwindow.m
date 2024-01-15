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

function varargout = mainwindow(varargin)
%MAINWINDOW M-file for mainwindow.fig
%      MAINWINDOW, by itself, creates a new MAINWINDOW or raises the existing
%      singleton*.
%
%      H = MAINWINDOW returns the handle to a new MAINWINDOW or the handle to
%      the existing singleton*.
%
%      MAINWINDOW('Property','Value',...) creates a new MAINWINDOW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to mainwindow_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAINWINDOW('CALLBACK') and MAINWINDOW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAINWINDOW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainwindow

% Last Modified by GUIDE v2.5 03-Nov-2019 17:48:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainwindow_OpeningFcn, ...
                   'gui_OutputFcn',  @mainwindow_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
   %icon;   
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before mainwindow is made visible.
function mainwindow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for mainwindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainwindow wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global imb;
global introflag;

introflag=1;

%figt = imread('top.tif');    
%imshow(figt,'Parent',handles.axestop); 
%figt = importdata('top.jpg');    
load inputfigs.mat;
imt = image(figt,'Parent',handles.axestop); 
set(handles.axestop, 'Xtick',[], 'Ytick',[])
%figb = importdata('bottom.jpg');    
imb = image(figb,'Parent',handles.axesbottom); 
set(handles.axesbottom, 'Xtick',[], 'Ytick',[])


% --- Outputs from this function are returned to the command line.
function varargout = mainwindow_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when figure2 is resized.
function figure2_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton13'),'value',0);
set (findobj(handles.figure2,'tag','radiobutton14'),'value',1);
set (findobj(handles.figure2,'tag','popupmenu6'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
set (findobj(handles.figure2,'tag','edit23'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
set (findobj(handles.figure2,'tag','popupmenu7'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
set (findobj(handles.figure2,'tag','listbox3'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','listbox4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton12'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton13'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton13'),'value',1);
set (findobj(handles.figure2,'tag','radiobutton14'),'value',0);
set (findobj(handles.figure2,'tag','popupmenu6'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
set (findobj(handles.figure2,'tag','edit23'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5],'string',' ');
set (findobj(handles.figure2,'tag','popupmenu7'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 
set (findobj(handles.figure2,'tag','listbox3'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','listbox4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton12'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton13'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton11'),'value',0);
set (findobj(handles.figure2,'tag','radiobutton12'),'value',1);
set (findobj(handles.figure2,'tag','edit22'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
set (findobj(handles.figure2,'tag','popupmenu5'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' '); % Tag popupmenu5 ama editbox
set (findobj(handles.figure2,'tag','listbox1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','listbox2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton7'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton8'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton9'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton10'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton11'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','edit24'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','popupmenu1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton11'),'value',1);
set (findobj(handles.figure2,'tag','radiobutton12'),'value',0);

set (findobj(handles.figure2,'tag','edit22'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5],'string',' ');
set (findobj(handles.figure2,'tag','popupmenu5'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5],'string',' '); % Tag popupmenu5 ama editbox
set (findobj(handles.figure2,'tag','listbox1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','listbox2'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','edit24'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton7'),'enable','off','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton8'),'enable','off','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton9'),'enable','off','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton10'),'enable','off','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','pushbutton11'),'enable','off','foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','popupmenu1'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]); 


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton9'),'value',0);
set (findobj(handles.figure2,'tag','radiobutton10'),'value',1);
set (findobj(handles.figure2,'tag','popupmenu4'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','edit20'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','edit21'),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton9'),'value',1);
set (findobj(handles.figure2,'tag','radiobutton10'),'value',0);
set (findobj(handles.figure2,'tag','popupmenu4'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','edit20'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);
set (findobj(handles.figure2,'tag','edit21'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global range_max_int
global range_int
set(findobj(handles.figure2,'tag','texterrror'),'string',' ');
val = str2num(get(findobj(handles.figure2,'tag','edit1'),'string'));
if (isempty(val) | val<=range_max_int(1) | val>=range_max_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
    'string',strcat('Enter the range between (',num2str(range_max_int(1)),',',num2str(range_max_int(2)),') !'));
    set(findobj(handles.figure2,'tag','edit1'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    input_ready_flag = 0;
    save input_ready_flag input_ready_flag
    set(findobj(handles.figure2,'tag','edit22'),'tooltipstring',' ');
    set(findobj(handles.figure2,'tag','edit23'),'tooltipstring',' ');
else
    set(findobj(handles.figure2,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set(findobj(handles.figure2,'tag','texterror'),'string','  ');
    range_int = [0,val];
    set(findobj(handles.figure2,'tag','edit22'),'tooltipstring',['Enter between [0,',num2str(val),']']);
    set(findobj(handles.figure2,'tag','edit23'),'tooltipstring',['Enter between [0,',num2str(val),']']);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global Zmax_user_int
global height_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit2'),'string'));

if (isempty(val) | val<Zmax_user_int(1) | val>Zmax_user_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
    'string',strcat('Enter the height between [',num2str(Zmax_user_int(1)),',',num2str(Zmax_user_int(2)),'] !'));
    set(findobj(handles.figure2,'tag','edit2'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    set(findobj(handles.figure2,'tag','popupmenu5'),'tooltipstring',' ');
else
    set(findobj(handles.figure2,'tag','edit2'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    height_int = [0,val];
    set(findobj(handles.figure2,'tag','popupmenu5'),'tooltipstring',['Enter between [0,',num2str(val),']']);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global freq_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit3'),'string'));
if (isempty(val) | val<freq_int(1) | val>freq_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the frequency between [',num2str(freq_int(1)),',',num2str(freq_int(2)),'] !'));
    set(findobj(handles.figure2,'tag','edit3'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit3'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
global thetabw_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit10'),'string'));
if (isempty(val) | val<thetabw_int(1) | val>thetabw_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the 3dB beamwidth between [',num2str(thetabw_int(1)),',',num2str(thetabw_int(2)),']!'));
    set(findobj(handles.figure2,'tag','edit10'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit10'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global thetae_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit11'),'string'));
if (isempty(val) | val<thetae_int(1) | val>thetae_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the beam pointing angle between [',num2str(thetae_int(1)),',',num2str(thetae_int(2)),'] !'));
    set(findobj(handles.figure2,'tag','edit11'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit11'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
global tx_height_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit12'),'string'));
if (isempty(val) | val<tx_height_int(1) | val>tx_height_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the antenna height between [',num2str(tx_height_int(1)),',',num2str(tx_height_int(2)),']  !'));
    set(findobj(handles.figure2,'tag','edit12'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit12'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
if (get(findobj(handles.figure2,'tag','popupmenu4'),'value') == 6)
    set(findobj(handles.figure2,'tag','texterror'),'string','Enter the dielectric constant and conductivity !'); 
    set(findobj(handles.figure2,'tag','edit20'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set(findobj(handles.figure2,'tag','edit21'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
else
    soil_type = get(findobj(handles.figure2,'tag','popupmenu4'),'value');
    frequency = str2num(get(findobj(handles.figure2,'tag','edit3'),'string'));
    if(isempty(frequency)) 
        set(findobj(handles.figure2,'tag','texterror'),'string','Enter the frequency first !'); 
    else
        set(findobj(handles.figure2,'tag','texterror'),'string',' '); 
        [eps,cond] = gui_ground(soil_type,frequency);   
        set (findobj(handles.figure2,'tag','edit20'),'string',num2str(eps),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[.5 .5 .5]);
        set (findobj(handles.figure2,'tag','edit21'),'string',num2str(cond),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[.5 .5 .5]);
        str = get (findobj(handles.figure2,'tag','edit20'),'string');
        set (findobj(handles.figure2,'tag','edit20'),'userdata',str);
        str = get (findobj(handles.figure2,'tag','edit21'),'string');
        set (findobj(handles.figure2,'tag','edit21'),'userdata',str);
    end
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
global epsilon_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit20'),'string'));
if (isempty(val) | val<epsilon_int(1) | val>epsilon_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the dielectric constant between [',num2str(epsilon_int(1)),',',num2str(epsilon_int(2)),'] !'));
    set(findobj(handles.figure2,'tag','edit20'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit20'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double

global sigma_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit21'),'string'));
if (isempty(val) | val<sigma_int(1) | val>sigma_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Enter the conductivity between [',num2str(sigma_int(1)),',',num2str(sigma_int(2)),'] !'));
    set(findobj(handles.figure2,'tag','edit21'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit21'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
global range_int
global range_max_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
bgcolor = get(findobj(handles.figure2,'tag','edit1'),'backgroundcolor');
if (bgcolor == [1 1 1])
    val = str2num(get(findobj(handles.figure2,'tag','edit22'),'string'));
    if (isempty(val) | length(val)>1)
        set(findobj(handles.figure2,'tag','texterror'),'string','Error in the range value!');
        set(findobj(handles.figure2,'tag','edit22'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    elseif (val<=range_int(1) | val>=range_int(2)) 
        set(findobj(handles.figure2,'tag','texterror'),'string',strcat('Enter the range between (',num2str(range_int(1)),',',num2str(range_int(2)),') !'));
        set(findobj(handles.figure2,'tag','edit22'),'string',' ');
    else set(findobj(handles.figure2,'tag','texterror'),'string','Enter the height!');
        set(findobj(handles.figure2,'tag','edit22'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    end
else set(findobj(handles.figure2,'tag','texterror'),'string', ...
     ['The last range value must be between (',num2str(range_max_int(1)),',',num2str(range_max_int(2)),') !']);
     set(findobj(handles.figure2,'tag','edit22'),'string',' ');
end



function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of popupmenu5 as text
%        str2double(get(hObject,'String')) returns contents of popupmenu5 as a double
global height_int
global Zmax_user_int
global range_max_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
bgcolor1 = get(findobj(handles.figure2,'tag','edit1'),'backgroundcolor');
bgcolor2 = get(findobj(handles.figure2,'tag','edit2'),'backgroundcolor');

if (bgcolor1 == [1 1 1] & bgcolor2 == [1 1 1]) 
    val1 = str2num(get(findobj(handles.figure2,'tag','edit22'),'string'));
    bgcolor = get(findobj(handles.figure2,'tag','edit22'),'backgroundcolor');
    if (bgcolor == [1 1 1]) & (~isempty(val1))
        val2 = str2num(get(findobj(handles.figure2,'tag','popupmenu5'),'string'));
        if (isempty(val2) | length(val2)>1)
            set(findobj(handles.figure2,'tag','texterror'),'string','Enter the height !');
            set(findobj(handles.figure2,'tag','popupmenu5'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
        elseif (val2<height_int(1) | val2>height_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
            'string',strcat('Enter the height between [',num2str(height_int(1)),',',num2str(height_int(2)),'] !'));
            set(findobj(handles.figure2,'tag','popupmenu5'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
        else
            set(findobj(handles.figure2,'tag','popupmenu5'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
            set(findobj(handles.figure2,'tag','texterror'),'string',' ');
            ranges = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'));
            heights = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'));
            index = find(val1 == ranges); 
            if isempty(index)
                [ranges,indices] = sort([ranges;val1]);
                [dummy,index] = max(indices);
                heights = [heights(1:index-1); val2; heights(index:end)];
            else
                ranges(index) = val1; 
                heights(index) = val2; 
            end
            set(findobj(handles.figure2,'tag','listbox1'),'string',num2str(ranges(:)));
            set(findobj(handles.figure2,'tag','listbox2'),'string',num2str(heights(:)));
            set(findobj(handles.figure2,'tag','edit22'),'string',' ');
            set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');
        end
    elseif (bgcolor == [1 1 1]) & (isempty(val1))
        set(findobj(handles.figure2,'tag','texterror'),'string','Enter the range value first !');
        set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');
    else set(findobj(handles.figure2,'tag','texterror'),'string','Error in the range value !');
        set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');
    end
elseif (bgcolor2 == [1 0 0]) set(findobj(handles.figure2,'tag','texterror'),'string', ...
     ['The last height value must be between [',num2str(Zmax_user_int(1)),',',num2str(Zmax_user_int(2)),'] !']);
     set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');
elseif (bgcolor1 == [1 0 0]) set(findobj(handles.figure2,'tag','texterror'),'string', ...
     ['The last range value must be between (',num2str(range_max_int(1)),',',num2str(range_max_int(2)),') !']);
     set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');
end 



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global knifeflag;

knifeflag =1;
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
index = get (findobj(handles.figure2,'tag','listbox1'),'value');
set (findobj(handles.figure2,'tag','listbox2'),'value',index);
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');

if strcmp(ans,'MODIFY')
    str1 = cellstr(get(findobj(handles.figure2,'tag','listbox1'),'string'));
    str2 = cellstr(get(findobj(handles.figure2,'tag','listbox2'),'string'));
    terrainparams_gui;
    f = findobj('tag','figure13');
    set(findobj(f,'tag','edit2'),'string',char(str2(index)),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]);
    set(findobj(f,'tag','edit1'),'string',char(str1(index)));
elseif strcmp(ans,'DELETE')
    set(findobj(handles.figure2,'tag','edit22'),'string',' ');
    set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');    
    str = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox1'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox1'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox1'),'string',num2str(str(:)));
    str = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox2'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox2'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox2'),'string',num2str(str(:)));
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
global knifeflag;

knifeflag =2;

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
index = get (findobj(handles.figure2,'tag','listbox2'),'value');
set (findobj(handles.figure2,'tag','listbox1'),'value',index);
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');
if strcmp(ans,'MODIFY')
    str1 = cellstr(get(findobj(handles.figure2,'tag','listbox1'),'string'));
    str2 = cellstr(get(findobj(handles.figure2,'tag','listbox2'),'string'));
    terrainparams_gui;
    f = findobj('tag','figure13');
    set(findobj(f,'tag','edit1'),'string',char(str1(index)),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]);
    set(findobj(f,'tag','edit2'),'string',char(str2(index)));
elseif strcmp(ans,'DELETE')
    set(findobj(handles.figure2,'tag','edit22'),'string',' ');
    set(findobj(handles.figure2,'tag','popupmenu5'),'string',' ');    
    str = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox1'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox1'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox1'),'string',num2str(str(:)));
    str = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox2'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox2'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox2'),'string',num2str(str(:)));
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
duct_type = get(findobj(handles.figure2,'tag','popupmenu6') ,'value');

fill_duct_window(duct_type, duct_type, []); 



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double
global range_int
global range_max_int
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
bgcolor = get(findobj(handles.figure2,'tag','edit1'),'backgroundcolor');
if (bgcolor == [1 1 1])
    val = str2num(get(findobj(handles.figure2,'tag','edit23'),'string'));
    if (isempty(val) | length(val)>1)
        set(findobj(handles.figure2,'tag','texterror'),'string','Error in the range value !');
        set(findobj(handles.figure2,'tag','edit23'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    elseif (val<range_int(1) | val>range_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
       'string',strcat('Enter the range between [',num2str(range_int(1)),',',num2str(range_int(2)),'] !'));
        set(findobj(handles.figure2,'tag','edit23'),'string',' ');
    else set(findobj(handles.figure2,'tag','texterror'),'string','Choose the atmosphere profile !');
        set(findobj(handles.figure2,'tag','edit23'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    end
else set(findobj(handles.figure2,'tag','texterror'),'string',['The last range value must be between [',num2str(range_max_int(1)),',',num2str(range_max_int(2)),'] !']);
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7
global range_int
global height_int
global duct_M_int

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
range = str2num(get(findobj(handles.figure2,'tag','edit23'),'string'));
if (isempty(range))
    set(findobj(handles.figure2,'tag','texterror'),'string','First enter the range!');
elseif (range<range_int(1) | range>range_int(2)) set(findobj(handles.figure2,'tag','texterror'), ...
       'string',strcat('Enter the range between [',num2str(range_int(1)),',',num2str(range_int(2)),'] !'));
else 
    ranges = str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'));
    index = find(range == ranges);
    if isempty(index); index = length(ranges+1); end
    if index ~= length(ranges+1) 
        fill_duct_window(get(findobj(handles.figure2,'tag','popupmenu7') ,'value'), index, range);        
    else
        switch(get(findobj(handles.figure2,'tag','popupmenu7') ,'value'))
        case 1, standard_gui;               f = findobj('tag','figure3'); set(findobj(f,'tag','edit5'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        case 2, surface_gui;                f = findobj('tag','figure4'); set(findobj(f,'tag','edit7'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        case 3, surface_based_duct_gui;     f = findobj('tag','figure5'); set(findobj(f,'tag','edit9'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        case 4, elevated_duct_gui;          f = findobj('tag','figure6'); set(findobj(f,'tag','edit9'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        case 5, evaporation_duct_gui;       f = findobj('tag','figure7'); set(findobj(f,'tag','edit4'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        case 6, user_defined_duct_gui;      f = findobj('tag','figure14'); set(findobj(f,'tag','edit1'),'string',range,...
                                                'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
        end
    end
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
index = get(findobj(handles.figure2,'tag','listbox3'),'value');
str = str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'));
range = num2str(str(index));
set (findobj(handles.figure2,'tag','listbox4'),'value',index);
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');
if strcmp(ans,'MODIFY')
    %str = cellstr(get(findobj(handles.figure2,'tag','listbox4'),'string'));
    %fill_duct_window(char(str(index)), index, range); 
    str1 = cellstr(get(findobj(handles.figure2,'tag','listbox3'),'string'));
    terrain_gui2;
    f = findobj('tag','figure13n');
    set(findobj(f,'tag','edit1'),'string',char(str1(index)));
    
elseif strcmp(ans,'DELETE')
    load duct2
    set (findobj(handles.figure2,'tag','edit23'),'string',' ');
    set (findobj(handles.figure2,'tag','popupmenu7'),'value',1);

    str = str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox3'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox3'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox3'),'string',num2str(str(:)));
    
    str = cellstr(get(findobj(handles.figure2,'tag','listbox4'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox4'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox4'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox4'),'string',str);

    if index <= length(str) 
        duct_M_array2(index:end-1,:) = duct_M_array2(index+1:end,:);
        duct_height_array2(index:end-1,:) = duct_height_array2(index+1:end,:);
    end
    duct_M_array2(end,:) = [];
    duct_height_array2(end,:) = [];
    save duct2 duct_M_array2 duct_height_array2 
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
index = get (findobj(handles.figure2,'tag','listbox4'),'value');
set (findobj(handles.figure2,'tag','listbox3'),'value',index);
str = str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'));
range = num2str(str(index));
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');
if strcmp(ans,'MODIFY')
    str = cellstr(get(findobj(handles.figure2,'tag','listbox4'),'string'));
    fill_duct_window(char(str(index)), index, range);    
elseif strcmp(ans,'DELETE')
    load duct2
    set (findobj(handles.figure2,'tag','edit23'),'string',' ');
    set (findobj(handles.figure2,'tag','popupmenu7'),'value',1);

    str = str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox3'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox3'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox3'),'string',num2str(str(:)));
    
    str = cellstr(get(findobj(handles.figure2,'tag','listbox4'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure2,'tag','listbox4'),'value',1);
    else set (findobj(handles.figure2,'tag','listbox4'),'value',index-1); end
    set (findobj(handles.figure2,'tag','listbox4'),'string',str);

    if index <= length(str) 
        duct_M_array2(index:end-1,:) = duct_M_array2(index+1:end,:);
        duct_height_array2(index:end-1,:) = duct_height_array2(index+1:end,:);
    end
    duct_M_array2(end,:) = [];
    duct_height_array2(end,:) = [];
    save duct2 duct_M_array2 duct_height_array2 
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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

set(gcf,'WindowButtonMotionFcn','');

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
cd User_Files\input_params
[fname,pname] = uigetfile('*.mat','Load file');
cd .. 
cd ..
if(fname~=0)
fpname = strcat(pname,fname);
x = load(fpname);

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
set(findobj(gcf,'tag','popupmenu1'),'value',x.interp_type);

set(findobj(gcf,'tag','popupmenu3'),'value',x.polrz);
set(findobj(gcf,'tag','popupmenu4'),'value',x.surface_type);
set (findobj(gcf,'tag','editdeltaz'),'string',num2str(x.deltaz));
set (findobj(gcf,'tag','editdeltax'),'string',num2str(x.deltax));

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

set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
global backward;
global xmin;
global xmax;
global ymin;
global ymax;
global readx;
global ready;
global new_x;
global new_y;
global hhimage;
global cb;
global imageflag;
global introflag;
global imb
range_vals = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'));
height_vals = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'));
antennaheight = str2num(get(findobj(handles.figure2,'tag','edit12'),'string'));
altitudeval = str2num(get(findobj(handles.figure2,'tag','edit2'),'string'));

if isempty(range_vals)
    range_vals = 0;
end
if isempty(height_vals)
    height_vals = 0;
end

if (range_vals(1) == 0) & (height_vals(1) > antennaheight) & get(findobj(handles.figure2,'tag','radiobutton12'),'value') 
    set(findobj(handles.figure2,'tag','texterror'),'string',['Antenna height should be higher than ',num2str(height_vals(1)), ' !']);
elseif (antennaheight > altitudeval)
    set(findobj(handles.figure2,'tag','texterror'),'string',['Antenna height should be less than ', num2str(altitudeval), ' !']);    
elseif (antennaheight <= 0)
    set(findobj(handles.figure2,'tag','texterror'),'string',['Antenna height should be higher than ', num2str(0), ' !']);    
else
    err = filesave('inputs.mat');
    if (isempty(err)), 
        input_ready_flag = 1;
        save input_ready_flag input_ready_flag
    else set(findobj(handles.figure2,'tag','texterror'),'string',[err,'Error in inputs !']); 
    end


    load input_ready_flag
    if input_ready_flag
        x = load('inputs.mat');
        if(x.refrac_type == 1) 
            duct_M_array = x.duct_M_array1(x.duct_type_array1,:); 
            duct_height_array = x.duct_height_array1(x.duct_type_array1,:);
            duct_type_array = x.duct_type_array1;
            duct_range_array = 0;
        else 
            duct_M_array = x.duct_M_array2; 
            duct_height_array = x.duct_height_array2; 
            duct_type_array = x.duct_type_array2;
            duct_range_array = x.duct_range_array;
        end


        set(handles.figure2,'pointer','watch');
        set(handles.figure2,'handlevisibility','off');

        eedit1 = get (findobj(handles.figure2,'tag','edit1'),'enable');
        eedit2 = get (findobj(handles.figure2,'tag','edit2'),'enable');     
        epop1 = get (findobj(handles.figure2,'tag','popupmenu1'),'enable');
        epop3 = get (findobj(handles.figure2,'tag','popupmenu3'),'enable');
        eedit10 = get (findobj(handles.figure2,'tag','edit10'),'enable');        
        eedit11 = get (findobj(handles.figure2,'tag','edit11'),'enable'); 
        eedit12 = get (findobj(handles.figure2,'tag','edit12'),'enable'); 
        eedit3 = get (findobj(handles.figure2,'tag','edit3'),'enable');        
        eradio9 = get (findobj(handles.figure2,'tag','radiobutton9'),'enable');        
        eradio10 = get (findobj(handles.figure2,'tag','radiobutton10'),'enable');  
        epop4 = get (findobj(handles.figure2,'tag','popupmenu4'),'enable');
        eedit20 = get (findobj(handles.figure2,'tag','edit20'),'enable');        
        eedit21 = get (findobj(handles.figure2,'tag','edit21'),'enable');        
        eradio11 = get (findobj(handles.figure2,'tag','radiobutton11'),'enable');        
        eradio12 = get (findobj(handles.figure2,'tag','radiobutton12'),'enable');        
        eradio15 = get (findobj(handles.figure2,'tag','radiobutton15'),'enable'); 
        eradio20 = get (findobj(handles.figure2,'tag','radiobutton20'),'enable');     
        eedit22 = get (findobj(handles.figure2,'tag','edit22'),'enable');        
        epop5 = get (findobj(handles.figure2,'tag','popupmenu5'),'enable');
        elist1 = get (findobj(handles.figure2,'tag','listbox1'),'enable');
        elist2 = get (findobj(handles.figure2,'tag','listbox2'),'enable');
        eradio13 = get (findobj(handles.figure2,'tag','radiobutton13'),'enable' );        
        eradio14 = get (findobj(handles.figure2,'tag','radiobutton14'),'enable' );        
        epop6 = get (findobj(handles.figure2,'tag','popupmenu6'),'enable' );
        epop7 = get (findobj(handles.figure2,'tag','popupmenu7'),'enable' );
        eedit23 = get (findobj(handles.figure2,'tag','edit23'),'enable' );        
        elist3 = get (findobj(handles.figure2,'tag','listbox3'),'enable' );
        elist4 = get (findobj(handles.figure2,'tag','listbox4'),'enable' );
        elist1 = get (findobj(handles.figure2,'tag','listbox1'),'enable' );
        epush1 = get (findobj(handles.figure2,'tag','pushbutton1'),'enable' );
        epush2 = get (findobj(handles.figure2,'tag','pushbutton2'),'enable' );
        epush3 = get (findobj(handles.figure2,'tag','pushbutton3'),'enable' );
        epush4 = get (findobj(handles.figure2,'tag','pushbutton4'),'enable' );
        epush5 = get (findobj(handles.figure2,'tag','pushbutton5'),'enable' );
        epush6 = get (findobj(handles.figure2,'tag','pushbutton6'),'enable' );
        eedit24 = get (findobj(handles.figure2,'tag','edit24'),'enable'); 
        epush7 = get (findobj(handles.figure2,'tag','pushbutton7'),'enable' );
        epush8 = get (findobj(handles.figure2,'tag','pushbutton8'),'enable' );
        epush9 = get (findobj(handles.figure2,'tag','pushbutton9'),'enable' );

        set (findobj(handles.figure2,'tag','edit1'),'enable','inactive' );    
        set (findobj(handles.figure2,'tag','edit2'),'enable','inactive' );     
        set (findobj(handles.figure2,'tag','popupmenu1'),'enable','inactive' );    
        set (findobj(handles.figure2,'tag','popupmenu3'),'enable','inactive' );    
        set (findobj(handles.figure2,'tag','edit10'),'enable','inactive' );       
        set (findobj(handles.figure2,'tag','edit11'),'enable','inactive' );     
        set (findobj(handles.figure2,'tag','edit12'),'enable','inactive' );     
        set (findobj(handles.figure2,'tag','edit3'),'enable','inactive' );      
        set (findobj(handles.figure2,'tag','radiobutton9'),'enable','inactive' );      
        set (findobj(handles.figure2,'tag','radiobutton10'),'enable','inactive' );      
        set (findobj(handles.figure2,'tag','popupmenu4'),'enable','inactive' );    
        set (findobj(handles.figure2,'tag','edit20'),'enable','inactive' );    
        set (findobj(handles.figure2,'tag','edit21'),'enable','inactive' );      
        set (findobj(handles.figure2,'tag','radiobutton11'),'enable','inactive' );       
        set (findobj(handles.figure2,'tag','radiobutton12'),'enable','inactive' );       
        set (findobj(handles.figure2,'tag','radiobutton15'),'enable','inactive' );   
        set (findobj(handles.figure2,'tag','radiobutton20'),'enable','inactive' );      
        set (findobj(handles.figure2,'tag','edit22'),'enable','inactive' );       
        set (findobj(handles.figure2,'tag','popupmenu5'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','listbox1'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','listbox2'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','radiobutton13'),'enable','inactive' );        
        set (findobj(handles.figure2,'tag','radiobutton14'),'enable','inactive' );        
        set (findobj(handles.figure2,'tag','popupmenu6'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','popupmenu7'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','edit23'),'enable','inactive' );        
        set (findobj(handles.figure2,'tag','listbox3'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','listbox4'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','listbox1'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton1'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton2'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton3'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton4'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton5'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton6'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','edit24'),'enable','inactive' ); 
        set (findobj(handles.figure2,'tag','pushbutton7'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton8'),'enable','inactive' );
        set (findobj(handles.figure2,'tag','pushbutton9'),'enable','inactive');


        stopflag = 0;             

        wl = (3*1e8) / (x.freq*1e6); % wavelength
        tmax = 45*4/3; % max angle
        dzc = wl/(2*sin(tmax*pi/180));
        dzc = dzc/2;

        if (x.deltaz < dzc) && (x.ground_type == 2)
           set (findobj(handles.figure2,'tag','texterror'),'string',strcat('Altitude step is too small for this analysis. Try increasing > ',num2str(4*dzc)));       
           warndlg(strcat('Altitude step is too small for this analysis. Try increasing > ',num2str(4*dzc)));
           stopflag = 1;       
        else

        [path_loss_final, prop_fact_final, free_space_loss, range_vec, z_user, z, stopflag] =  SSPE_function(x.freq, ...
        x.thetabw, x.thetae, x.polrz, x.tx_height, x.range, x.Zmax_user, x.edge_range_array, x.edge_height_array, ...
        duct_type_array, duct_M_array, duct_height_array, duct_range_array, x.terrain_type, x.interp_type, x.backward, ...
        x.ground_type, x.epsilon, x.sigma, x.deltax, x.deltaz);

        end;

    f1 = findobj('tag','figurew');
    close(f1);


        set(handles.figure2,'pointer','arrow');
        set(handles.figure2,'handlevisibility','on');    
        set (findobj(handles.figure2,'tag','edit1'),'enable',eedit1);
        set (findobj(handles.figure2,'tag','edit2'),'enable',eedit2);        
        set (findobj(handles.figure2,'tag','popupmenu1'),'enable',epop1);
        set (findobj(handles.figure2,'tag','popupmenu3'),'enable',epop3);
        set (findobj(handles.figure2,'tag','edit10'),'enable',eedit10);        
        set (findobj(handles.figure2,'tag','edit11'),'enable',eedit11);        
        set (findobj(handles.figure2,'tag','edit12'),'enable',eedit12);        
        set (findobj(handles.figure2,'tag','edit3'),'enable',eedit3);        
        set (findobj(handles.figure2,'tag','radiobutton9'),'enable',eradio9);        
        set (findobj(handles.figure2,'tag','radiobutton10'),'enable',eradio10);        
        set (findobj(handles.figure2,'tag','popupmenu4'),'enable',epop4);
        set (findobj(handles.figure2,'tag','edit20'),'enable',eedit20);        
        set (findobj(handles.figure2,'tag','edit21'),'enable',eedit21);        
        set (findobj(handles.figure2,'tag','radiobutton11'),'enable',eradio11);        
        set (findobj(handles.figure2,'tag','radiobutton12'),'enable',eradio12);        
        set (findobj(handles.figure2,'tag','radiobutton15'),'enable',eradio15);  
        set (findobj(handles.figure2,'tag','radiobutton20'),'enable',eradio20);    
        set (findobj(handles.figure2,'tag','edit22'),'enable',eedit22);        
        set (findobj(handles.figure2,'tag','popupmenu5'),'enable',epop5);
        set (findobj(handles.figure2,'tag','listbox1'),'enable',elist1);
        set (findobj(handles.figure2,'tag','listbox2'),'enable',elist2);
        set (findobj(handles.figure2,'tag','radiobutton13'),'enable',eradio13);        
        set (findobj(handles.figure2,'tag','radiobutton14'),'enable',eradio14);        
        set (findobj(handles.figure2,'tag','popupmenu6'),'enable',epop6);
        set (findobj(handles.figure2,'tag','popupmenu7'),'enable',epop7);
        set (findobj(handles.figure2,'tag','edit23'),'enable',eedit23);        
        set (findobj(handles.figure2,'tag','listbox3'),'enable',elist3);
        set (findobj(handles.figure2,'tag','listbox4'),'enable',elist4);
        set (findobj(handles.figure2,'tag','listbox1'),'enable',elist1);
        set (findobj(handles.figure2,'tag','pushbutton1'),'enable',epush1);
        set (findobj(handles.figure2,'tag','pushbutton2'),'enable',epush2);
        set (findobj(handles.figure2,'tag','pushbutton3'),'enable',epush3);
        set (findobj(handles.figure2,'tag','pushbutton4'),'enable',epush4);
        set (findobj(handles.figure2,'tag','pushbutton5'),'enable',epush5);
        set (findobj(handles.figure2,'tag','pushbutton6'),'enable',epush6);
        set (findobj(handles.figure2,'tag','edit24'),'enable',eedit24);        
        set (findobj(handles.figure2,'tag','pushbutton7'),'enable',epush7);
        set (findobj(handles.figure2,'tag','pushbutton8'),'enable',epush8);
        set (findobj(handles.figure2,'tag','pushbutton9'),'enable',epush9);


    set (findobj(gcf,'tag','radiobutton18'),'enable','on','foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','radiobutton19'),'enable','on','foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','edit27'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','edit28'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','edit25'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','edit26'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','pushbutton15'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','pushbutton17'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','pushbutton18'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
    set (findobj(gcf,'tag','pushbutton19'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);



        if stopflag == 0

        set(findobj(handles.figure2,'tag','radiobutton18'),'value',1);
        set(findobj(handles.figure2,'tag','radiobutton19'),'value',0);    

        plot_array = prop_fact_final;
        plot_flag = 2;

    if introflag
    delete(imb)
    introflag=0;
    end


        % PLOT
        axes(handles.axesbottom);

        new_x = range_vec./1e3;
        new_y = z_user; 
        xmin = new_x(1);
        xmax = new_x(length(new_x));
        ymin = z_user(1);
        ymax = z_user(length(z_user));

        cla;
        hhimage = imagesc(new_x, new_y, plot_array); shading interp; view(0,90);


        set(gcf,'WindowButtonMotionFcn','guimousevalue');
        imageflag = 1;

        set(gca,'Ydir','normal');
        hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
        hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
        set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
        %set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);

        axis tight;

        cb = colorbar('eastoutside');
    %     set(cb,'units', 'pixel');
    %     cpos = get(cb,'Position');
    %     cpos(3) = cpos(3)/2; % Halve the thickness
    %     set(cb,'Position',cpos);
    %     set(gca,'units', 'pixel');
    %     apos = get(gca,'Position');
    %     cpos(1) = apos(1)+apos(3)+8;
    %     set(cb,'Position',cpos);


        %gui_plot_contour(range_vec, z_user, z, x.freq, free_space_loss, f8);

        ca = caxis;
        set(findobj(handles.figure2,'tag','edit25'),'string',num2str(ca(1)));
        set(findobj(handles.figure2,'tag','edit26'),'string',num2str(ca(2)));

        if get(findobj(handles.figure2,'tag','radiobutton12'),'value')
            pushbutton11_Callback(hObject, eventdata, handles)
            set (findobj(handles.figure2,'tag','pushbutton11'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
        end
        
        end % stoplag    
    end

    guidata(hObject, handles); %updates the handles

end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'WindowButtonMotionFcn','');

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
cd User_Files\input_params
[fname,pname] = uiputfile('*.mat','Save file');
cd .. 
cd ..
if fname~=0
    fpname = strcat(pname,fname);
    if (isempty(findstr(fpname,'.mat'))); fpname = strcat(fpname,'.mat');end 

    err = filesave(fpname);
    if (isempty(err)) set (findobj(handles.figure2,'tag','texterror'),'string',strcat('Saved in file  "',fname,'"  ')); 
    else set(findobj(handles.figure2,'tag','texterror'),'string',[err,'Error in saving file !']); 
    end
end

set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq_mainwindow;
close all;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aboutgui;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpgui;



% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'WindowButtonMotionFcn','');

xrange = []; xheight = [];

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
cd User_Files\terrain
[fname,pname] = uigetfile('*.*','Load file');
cd .. 
cd ..
if(fname~=0)
fpname = strcat(pname,fname);
x = load(fpname);

if ~isempty(x)
x = sortrows(x,1);
xrange = x(:,1);
xheight = x(:,2);
end

set (findobj(gcf,'tag','listbox1'),'string',num2str(xrange));
set (findobj(gcf,'tag','listbox2'),'string',num2str(xheight));
end

set(gcf,'WindowButtonMotionFcn','guimousevalue');

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag

ans = questdlg('Do you want to delete all terrain parameters?','QUESTION','YES','NO','NO');

if strcmp(ans,'YES')
    str = [];
    set (findobj(handles.figure2,'tag','listbox1'),'string',num2str(str));
    set (findobj(handles.figure2,'tag','listbox2'),'string',num2str(str));  
end



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj(handles.figure2,'tag','texterror'),'string',' ');

set(gcf,'WindowButtonMotionFcn','');

edge_range_array  = (str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'))).';
edge_height_array = (str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'))).';

cd User_Files\terrain
[fname,pname] = uiputfile('*.txt','Save file');
cd .. 
cd ..
if fname ~= 0
    fpname = strcat(pname,fname);
    if (isempty(findstr(fpname,'.txt'))); fpname = strcat(fpname,'.txt');end 
    fid = fopen(fpname,'w');
    %fprintf(fid,'Terrain Profile:\n\n');
    %fprintf(fid,'Range(km)\t\t\tAltitude(m)\n\n');
    for i=1:length(edge_range_array)
        fprintf(fid,'%.2f\t%.2f\n',edge_range_array(i),edge_height_array(i));            
    end
    fclose(fid);
    
    set (findobj(handles.figure2,'tag','texterror'),'string',strcat('Terrain has been saved in  "',fname,'" ')); 

end

set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes on button press in pushbutton10.
% LOCATE POINTS
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global hhimage;
global cb;
global imageflag;
global imb;
global introflag;

val = str2num(get(findobj(handles.figure2,'tag','edit24'),'string'));

if (isempty(val) | val<1 ) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('The number of points must be larger than zero!'));
    set(findobj(handles.figure2,'tag','edit24'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else

%set (findobj(handles.figure2,'tag','pushbutton4'),'enable','off');

interp_type = get(findobj(handles.figure2,'tag','popupmenu1'),'value');

NN = str2num(get(findobj(handles.figure2,'tag','edit24'),'string'));
rangekm = str2num(get(findobj(handles.figure2,'tag','edit1'),'string'));
hmax = str2num(get(findobj(handles.figure2,'tag','edit2'),'string'));

set(handles.axesbottom, 'Visible','on')

if introflag
delete(imb)
introflag=0;
end

if (imageflag == 1)
set(hhimage, 'Visible','off')
set(cb, 'Visible','off')
end

axes(handles.axesbottom);
axis off

axes(handles.axestop);

h1 = plot(0,0);cla

ylim([0,hmax]); xlim([0,rangekm]);   hold on, grid on, box on
hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
%set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
%set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);
x_selected=zeros(1,NN);y_selected=zeros(1,NN);

set(findobj(handles.figure2,'Tag','texterror'),'string','Move cursor to the top axes and click to select! Click outside to quit!');

done = 1;

for i=1:NN,
    try
       [xi, yi] = ginput(1);
    catch            
       return
    end
    
    if ~((xi > rangekm) || (xi < 0) || (yi < 0) || (yi > hmax)) % inside the axes
                        
        x_selected(i) = xi;
        y_selected(i) = yi;    
        set(findobj(handles.figure2,'tag','texterror'),'string',' ');
        plot(x_selected(i),y_selected(i),'ko')
        ylim([0,hmax]);    xlim([0,rangekm]); 
        
    else
        set(findobj(handles.figure2,'Tag','texterror'),'string','Locate points quit! Press locate points to create the terrain!');
        done = 0;
        cla; plot(0,0);
        %delete(hx); delete(hy);    
        hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
        hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
        %set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
        %set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);
        
        break;
    end 
    
end

if done
%To sort the selected points, this enables the user to select points in any order
[x_selected,index]=sort(x_selected);
y_selected=y_selected(index);

if (interp_type == 2) & (NN > 1)
   aa=fit(x_selected.', y_selected.', 'linear');
elseif (interp_type == 3) & (NN > 1)
   aa=fit(x_selected.', y_selected.', 'cubicspline');    
end

delxx = (x_selected(NN)-x_selected(1))/200;

if ((interp_type == 2) | (interp_type == 3)) & (NN > 1)
xsurface = x_selected(1):delxx:x_selected(NN);
ysurface = aa(xsurface);
xsurface = vec2mat(xsurface,1);

else % knife edge
    xsurface = x_selected;
    ysurface = y_selected;
end

s=size(ysurface);
for i=1:s(1)
    if ysurface(i)<0
        ysurface(i)=0;
    elseif ysurface(i)>hmax
        ysurface(i)=hmax;
    end
end

cla %to clear the figure
if ((interp_type == 2) | (interp_type == 3)) & (NN > 1)
area(xsurface,ysurface,'FaceColor',[0 1 0.502])
hold on
plot(x_selected,y_selected,'ko')
hold off

else
    hold on
    for ii = 1:length(x_selected)
        area([x_selected(ii)-0.2 x_selected(ii)-0.2 x_selected(ii)+0.2 x_selected(ii)+0.2], ...
              [0 y_selected(ii) y_selected(ii) 0],'FaceColor',[0 1 0.502])
    end
    hold off
end


set(findobj(handles.figure2,'tag','listbox1'),'string',num2str(x_selected.'));
set(findobj(handles.figure2,'tag','listbox2'),'string',num2str(y_selected.'));

%set (findobj(handles.figure2,'tag','pushbutton4'),'enable','on');

set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('Press RUN to see the results for the new terrain!'));

end % done

set(handles.axesbottom, 'Visible','on')
if (imageflag == 1)
set(hhimage, 'Visible','on')
set(cb, 'Visible','on')
end

end; 

axes(handles.axesbottom);

guidata(hObject, handles); %updates the handles


%PLOT
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axestop);

x_selected = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string')).';
y_selected = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string')).';
cla %to clear the figure

if ~isempty(x_selected)
    
ind = find(diff(x_selected) == 0);
x_selected(ind) = [];
y_selected(ind) = [];

interp_type = get(findobj(handles.figure2,'tag','popupmenu1'),'value');

rangekm = str2num(get(findobj(handles.figure2,'tag','edit1'),'string'));
hmax = str2num(get(findobj(handles.figure2,'tag','edit2'),'string'));

NN = length(x_selected);

axes(handles.axestop);

h1 = plot(0,0);cla

ylim([0,hmax]); xlim([0,rangekm]);   hold on, grid on, box on
hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
%set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
%set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);


%To sort the selected points, this enables the user to select points in any order
[x_selected,index]=sort(x_selected);
y_selected=y_selected(index);

if (interp_type == 2) & (NN > 1)
   aa=fit(x_selected.', y_selected.', 'linear');
elseif (interp_type == 3) & (NN > 1)
   aa=fit(x_selected.', y_selected.', 'cubicspline');    
end

delxx = (x_selected(NN)-x_selected(1))/200;

if ((interp_type == 2) | (interp_type == 3)) & (NN > 1)
xsurface = x_selected(1):delxx:x_selected(NN);
ysurface = aa(xsurface);
xsurface = vec2mat(xsurface,1);

else % knife edge
    xsurface = x_selected;
    ysurface = y_selected;
end

s=size(ysurface);
for i=1:s(1)
    if ysurface(i)<0
        ysurface(i)=0;
    elseif ysurface(i)>hmax
        ysurface(i)=hmax;
    end
end

cla %to clear the figure
if ((interp_type == 2) | (interp_type == 3)) & (NN > 1)
area(xsurface,ysurface,'FaceColor',[0 1 0.502])
hold on
plot(x_selected,y_selected,'ko')
hold off

else
    hold on
    for ii = 1:length(x_selected)
        area([x_selected(ii)-0.2 x_selected(ii)-0.2 x_selected(ii)+0.2 x_selected(ii)+0.2], ...
              [0 y_selected(ii) y_selected(ii) 0],'FaceColor',[0 1 0.502])
    end
    hold off
end

end
guidata(hObject, handles); %updates the handles

axes(handles.axesbottom);



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','edit24'),'string'));
val = round(val);
set(findobj(handles.figure2,'tag','edit24'),'string', num2str(val));

if (isempty(val) | val<1 ) set(findobj(handles.figure2,'tag','texterror'), ...
   'string',strcat('The number of points must be larger than zero!'));
    set(findobj(handles.figure2,'tag','edit24'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','edit24'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --- Executes on button press in pushbutton12.
% LOAD
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj(handles.figure2,'tag','texterror'),'string',' ');

set(gcf,'WindowButtonMotionFcn','');

input_ready_flag = 0;
save input_ready_flag input_ready_flag

cd User_Files\atmosphere
[fname,pname] = uigetfile('*.mat','Load file');
cd .. 
cd ..

if(fname~=0)
fpname = strcat(pname,fname);
x = load(fpname);

duct_M_array2 = x.duct_M_array2;
duct_height_array2 = x.duct_height_array2;
duct_range_array = x.duct_range_array;
duct_type_array2 = x.duct_type_array2;

save duct2 duct_M_array2 duct_height_array2 

set (findobj(handles.figure2,'tag','listbox3'),'string',num2str(duct_range_array.'));
index_array = duct_type_array2;
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
set (findobj(handles.figure2,'tag','listbox4'),'string',type_array);

end

set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes on button press in pushbutton13.
%SAVE
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj(handles.figure2,'tag','texterror'),'string',' ');

set(gcf,'WindowButtonMotionFcn','');

duct_range_array  = (str2num(get(findobj(handles.figure2,'tag','listbox3'),'string'))).';
con = cellstr(get(findobj(handles.figure2,'tag','listbox4'),'string'));
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


cd User_Files\atmosphere
[fname,pname] = uiputfile('*.mat','Save file');
cd .. 
cd ..
if fname ~= 0
    fpname = strcat(pname,fname);
    if (isempty(findstr(fpname,'.mat'))); fpname = strcat(fpname,'.mat');end 
        
    load duct2;
    save(fpname, 'duct_M_array2', 'duct_height_array2', 'duct_range_array', 'duct_type_array2');
    
    set (findobj(handles.figure2,'tag','texterror'),'string',strcat('Atmosphere has been saved in  "',fname,'" ')); 
    
end

set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton15'),'value',1);
set (findobj(handles.figure2,'tag','radiobutton20'),'value',0);


% --- Executes on button press in radiobutton20.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton20
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
set (findobj(handles.figure2,'tag','radiobutton15'),'value',0);
set (findobj(handles.figure2,'tag','radiobutton20'),'value',1);



% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18
global prop_fact_final
global free_space_loss
global range_vec
global z_user
global z
global plot_flag
global plot_array
global hhimage;
global cb;
global imageflag;

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
set(findobj(handles.figure2,'tag','radiobutton18'),'value',1);
set(findobj(handles.figure2,'tag','radiobutton19'),'value',0);
x = load('inputs.mat');
plot_array = prop_fact_final;
plot_flag = 2; 
set(handles.figure2,'pointer','watch');

    % PLOT
    axes(handles.axesbottom);    

    new_x = range_vec./1e3;
    new_y = z_user; 
    xmin = new_x(1);
    xmax = new_x(length(new_x));
    ymin = z_user(1);
    ymax = z_user(length(z_user));

    cla;
    hhimage = imagesc(new_x, new_y, plot_array); shading interp; view(0,90);
    set(gcf,'WindowButtonMotionFcn','guimousevalue');
    imageflag = 1;

    set(gca,'Ydir','normal');
    hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
    hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
    set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
    %set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);
    axis tight;

    cb = colorbar('eastoutside');
%     set(cb,'units', 'pixel');
%     cpos = get(cb,'Position');
%     cpos(3) = cpos(3)/2; % Halve the thickness
%     set(cb,'Position',cpos);
%     set(gca,'units', 'pixel');
%     apos = get(gca,'Position');
%     cpos(1) = apos(1)+apos(3)+8;
%     set(cb,'Position',cpos);
    
    set(handles.figure2,'pointer','arrow');

    ca = caxis;
    set(findobj(handles.figure2,'tag','edit25'),'string',num2str(ca(1)));
    set(findobj(handles.figure2,'tag','edit26'),'string',num2str(ca(2)));

guidata(hObject, handles); %updates the handles
    

% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19
global path_loss_final
global free_space_loss
global range_vec
global z_user
global z
global plot_flag
global plot_array
global hhimage;
global cb;
global imageflag;

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
set(findobj(handles.figure2,'tag','radiobutton18'),'value',0);
set(findobj(handles.figure2,'tag','radiobutton19'),'value',1);
x = load('inputs.mat');
plot_array = path_loss_final;

plot_flag = 1; 
set(handles.figure2,'pointer','watch');

    % PLOT
    axes(handles.axesbottom);

    new_x = range_vec./1e3;
    new_y = z_user; 
    xmin = new_x(1);
    xmax = new_x(length(new_x));
    ymin = z_user(1);
    ymax = z_user(length(z_user));

    cla;
    hhimage = imagesc(new_x, new_y, plot_array); shading interp; view(0,90);
    set(gcf,'WindowButtonMotionFcn','guimousevalue');
    imageflag = 1;

    set(gca,'Ydir','normal');
    hx=xlabel('Range (km)','Linewidth',2,'fontsize',9);
    hy=ylabel('Altitude (m)','Linewidth',2,'fontsize',9);
    set(hx,'pos',get(hx,'pos') + [0 10.0 0]);
    %set(hy,'pos',get(hy,'pos') + [0.3 0.0 0]);
    axis tight;

    cb = colorbar('eastoutside');
%     set(cb,'units', 'pixel');
%     cpos = get(cb,'Position');
%     cpos(3) = cpos(3)/2; % Halve the thickness
%     set(cb,'Position',cpos);
%     set(gca,'units', 'pixel');
%     apos = get(gca,'Position');
%     cpos(1) = apos(1)+apos(3)+8;
%     set(cb,'Position',cpos);
    
    set(handles.figure2,'pointer','arrow');

    ca = caxis;
    set(findobj(handles.figure2,'tag','edit25'),'string',num2str(ca(1)));
    set(findobj(handles.figure2,'tag','edit26'),'string',num2str(ca(2)));

guidata(hObject, handles); %updates the handles


function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
valmin = str2num(get(findobj(handles.figure2,'tag','edit25'),'string'));
valmax = str2num(get(findobj(handles.figure2,'tag','edit26'),'string'));

ca = caxis;

if ~isempty(valmin) && ~isempty(valmax)
    if valmin < valmax
       caxis([valmin valmax]);
    else
       set(findobj(handles.figure2,'tag','edit25'),'string',num2str(ca(1))); 
       set(findobj(handles.figure2,'tag','edit26'),'string',num2str(ca(2)));        
    end
elseif ~isempty(valmin) && isempty(valmax)
    caxis([valmin ca(2)]);    
elseif isempty(valmin) && ~isempty(valmax)
    caxis([ca(1) valmax]);
else
    % do nothing
end


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
valmin = str2num(get(findobj(handles.figure2,'tag','edit25'),'string'));
valmax = str2num(get(findobj(handles.figure2,'tag','edit26'),'string'));

ca = caxis;

if ~isempty(valmin) && ~isempty(valmax)
    if valmin < valmax
       caxis([valmin valmax]);
    else
       set(findobj(handles.figure2,'tag','edit25'),'string',num2str(ca(1))); 
       set(findobj(handles.figure2,'tag','edit26'),'string',num2str(ca(2)));        
    end
elseif ~isempty(valmin) && isempty(valmax)
    caxis([valmin ca(2)]);    
elseif isempty(valmin) && ~isempty(valmax)
    caxis([ca(1) valmax]);
else
    % do nothing
end


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prop_fact_final
global path_loss_final
global free_space_loss
global range_vec
global z_user
global z
global plot_flag
global plot_array
global rx_range
global range_int

set(findobj(handles.figure2,'tag','texterror'),'string',' '); 
rx_range = str2num(get(findobj(handles.figure2,'tag','edit27'),'string'));
if (isempty(rx_range)) 
    set(findobj(handles.figure2,'tag','texterror'),'string','Enter range and press Plot!'); 
elseif rx_range < range_int(1) | rx_range > range_int(2)
    set(findobj(handles.figure2,'tag','texterror'),'string',['Range must be between [',num2str(range_int(1)),',',num2str(range_int(2)),'] ']); 
    set(findobj(handles.figure2,'tag','edit27'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);    
else
    set(findobj(handles.figure2,'tag','edit27'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);    
    
    if(get(findobj(handles.figure2,'tag','radiobutton18'),'value'))
        plot_flag = 2;
        plot_array = prop_fact_final;
        gui_plot_height;
    else
        plot_flag = 1;
        plot_array = path_loss_final;
        gui_plot_height;
    end
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prop_fact_final
global path_loss_final
global free_space_loss
global range_vec
global rx_height
global z_user
global z
global plot_flag
global plot_array
global height_int

set(findobj(handles.figure2,'tag','texterror'),'string',' '); 
rx_height = str2num(get(findobj(handles.figure2,'tag','edit28'),'string'));
if (isempty(rx_height)) 
    set(findobj(handles.figure2,'tag','texterror'),'string','Enter altitude and press Plot!'); 
elseif rx_height < height_int(1) | rx_height > height_int(2)
    set(findobj(handles.figure2,'tag','texterror'),'string',['Altitude must be between [',num2str(height_int(1)),',',num2str(height_int(2)),']']); 
    set(findobj(handles.figure2,'tag','edit28'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);        
else
    set(findobj(handles.figure2,'tag','edit28'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);        
    if(get(findobj(handles.figure2,'tag','radiobutton18'),'value'))
        plot_array = prop_fact_final;
        plot_flag = 2;
        gui_plot_range;
    else
        plot_array = path_loss_final;
        plot_flag = 1;
        gui_plot_range;
    end
end



% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prop_fact_final;
global path_loss_final;
global range_vec;
global z_user;

set(gcf,'WindowButtonMotionFcn','');

set(findobj(handles.figure2,'tag','texterror'),'string',' ');
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
    save(fpname,'prop_fact_final', 'path_loss_final', 'range_vec', 'z_user');
    pause(.5)
    
    set (findobj(handles.figure2,'tag','texterror'),'string',strcat('3D maps have been saved in  "',fname,'" ')); 
end

set(gcf,'WindowButtonMotionFcn','guimousevalue');



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hhimage;
global plot_array
global range_vec;
global z_user;

set(gcf,'WindowButtonMotionFcn','');

new_x = range_vec./1e3;
new_y = z_user; 
xmin = new_x(1);
xmax = new_x(length(new_x));
ymin = z_user(1);
ymax = z_user(length(z_user));

    
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
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
    imagesc(new_x, new_y, plot_array); shading interp; view(0,90); set(gca,'Ydir','normal');

% x = str2num(get(findobj(handles.figure2,'tag','listbox1'),'string'));
% y = str2num(get(findobj(handles.figure2,'tag','listbox2'),'string'));
% area(x, y,'FaceColor',[0 1 0.502])
% axis([0 max(x) 0 max(y)])

    hx=xlabel('Range (km)','Linewidth',2,'fontweight','bold','fontsize',11);
    hy=ylabel('Altitude (m)','Linewidth',2,'fontweight','bold','fontsize',11);

    cb = colorbar('eastoutside');

%     set(cb,'units', 'pixel');
%     cpos = get(cb,'Position');
%     cpos(3) = cpos(3)/2; % Halve the thickness
%     set(cb,'Position',cpos);
%     set(gca,'units', 'pixel');
%     apos = get(gca,'Position');
%     cpos(1) = apos(1)+apos(3)+8;
%     set(cb,'Position',cpos);
    
    ca(1) = str2num(get(findobj(handles.figure2,'tag','edit25'),'string'));
    ca(2) = str2num(get(findobj(handles.figure2,'tag','edit26'),'string'));
    caxis(ca);

    %saveas(hnew, 'sil.jpg', 'jpg');
    
    print(hnew, '-dtiff','-r300',fpname);
    close(hnew)

    set (findobj(handles.figure2,'tag','texterror'),'string',strcat('3D maps have been saved in  "',fname,'" ')); 
end

 
%f=getframe(handles.figure2, [410 100 640 242]);
%[x,map]=frame2im(f);
%imwrite(x,'sil.tif','tif','Resolution',600);


set(gcf,'WindowButtonMotionFcn','guimousevalue');


% --- Executes when uipanel15 is resized.
function uipanel15_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editdeltax_Callback(hObject, eventdata, handles)
% hObject    handle to editdeltax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editdeltax as text
%        str2double(get(hObject,'String')) returns contents of editdeltax as a double
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','editdeltax'),'string'));

val2 = str2num(get(findobj(handles.figure2,'tag','edit1'),'string')); % max range

if (isempty(val) | val<=0 | val>val2*1e3) set(findobj(handles.figure2,'tag','texterror'), ...
    'string',strcat('Enter the range step larger than zero and less than the max range!'));
    set(findobj(handles.figure2,'tag','editdeltax'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','editdeltax'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --- Executes during object creation, after setting all properties.
function editdeltax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editdeltax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editdeltaz_Callback(hObject, eventdata, handles)
% hObject    handle to editdeltaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editdeltaz as text
%        str2double(get(hObject,'String')) returns contents of editdeltaz as a double
set(findobj(handles.figure2,'tag','texterror'),'string',' ');
input_ready_flag = 0;
save input_ready_flag input_ready_flag
val = str2num(get(findobj(handles.figure2,'tag','editdeltaz'),'string'));

val2 = str2num(get(findobj(handles.figure2,'tag','edit2'),'string')); % max altitude

if (isempty(val) | val<=0 | val>=val2) set(findobj(handles.figure2,'tag','texterror'), ...
    'string',strcat('Enter the altitude step larger than zero and less than the max altitude!'));
    set(findobj(handles.figure2,'tag','editdeltaz'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
else
    set(findobj(handles.figure2,'tag','editdeltaz'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --- Executes during object creation, after setting all properties.
function editdeltaz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editdeltaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;


global strname;
global plat1;
global plon1;
global plat2;
global plon2;
global maxlat;
global minlat;
global maxlon;
global minlon;
% global dname;
global range;
global angles;
global height_int;
global range_int;

%%
set(gcf,'WindowButtonMotionFcn','');

set (findobj(handles.figure2,'tag','radiobutton11'),'value',0);
set (findobj(handles.figure2,'tag','radiobutton12'),'value',1);
set (findobj(handles.figure2,'tag','edit22'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' ');
set (findobj(handles.figure2,'tag','popupmenu5'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0],'string',' '); % Tag popupmenu5 ama editbox
set (findobj(handles.figure2,'tag','listbox1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','listbox2'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton7'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton8'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton9'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton10'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','pushbutton11'),'enable','on','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','edit24'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
set (findobj(handles.figure2,'tag','popupmenu1'),'enable','on','backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);

cd Maps
dname = uigetdir('','Select Country DTED Folder');
cd ..

if dname ~= 0
    %Check DTED Path
    path1 = strcat(dname,'/dted');
    path2 = dname;
    [status,~] = fileattrib(path1);
    [status2,~] = fileattrib(path2);
    if status ~= 0
        path = path1;
    elseif status2 ~= 0
        path = path2;
        dname = dname(1:end-5);
    else
        errordlg('DTED File not found!','File Error');
        return
    end
    
    set(gcf,'WindowButtonMotionFcn','');
    warning_gui;
%     hw = warndlg('Map is loading... Please wait!','Warning','modal');
    
    
    %     save pathname dname
    Files=dir(path);
    lonfilearray = [];
    for k=1:length(Files)
        filename = Files(k).name;
        lonfilearray = [lonfilearray,str2num(filename(2:end))];
    end
    
    latfilename = Files(3).name;
    latpath = strcat(path,'/');
    latfilepath = strcat(latpath,latfilename);
    latfiles = dir(latfilepath);
    latfilearray = [];
    for l=3:length(latfiles)
        filenames = latfiles(l).name;
        latfilearray = [latfilearray,str2num(filenames(2:3))];
    end
    
    minlat = min(latfilearray);
    minlon = min(lonfilearray);
    
    maxlat = max(latfilearray);
    maxlon = max(lonfilearray);
    
    save limits minlat minlon maxlat maxlon
    
    latlim = [minlat maxlat];
    lonlim = [minlon maxlon];
    
    %Chek if DTED is proper
    if isempty(latlim) || isempty (lonlim)
        errordlg('DTED File is not proper!','File Error');
        fw = findobj('tag','figurew');
        close(fw);
        return
    else
        dteds(latlim,lonlim,0);
        samplefactor = 1;
        [Z,ref] = dted(dname,samplefactor,latlim,lonlim);
        Z(Z == 0) = -1;
        
        fm = figure('Name','Map','NumberTitle','off', 'Color', 'w');
        
        ax = worldmap(latlim,lonlim);
        
        marmara = shaperead('landareas','UseGeoCoords', true,'BoundingBox', [lonlim' latlim']);
        geoshow(ax, marmara, 'FaceColor','none');
        meshm(Z, ref);
        demcmap(Z)
        
        close(warning_gui);
%         close(hw);
        Coordinates gui;
        uiwait;
        if exist('koordinatlar.mat') ~= 0
            load koordinatlar
        else
            cancelflag = 1;
        end        
        
        if cancelflag == 0
            
            if ~isempty(range)
                range = range;
                angles = angles;
                new_coor=reckon(plat1,plon1,km2deg(range),angles);
                plat2=new_coor(1);
                plon2=new_coor(2);
            end
            
            plat = [plat1 plat2];
            plon = [plon1 plon2];
            
            [z,rng,lat,lon] = mapprofile(Z,ref,plat,plon);
            
            % Draw Line between Points
            plot3m(lat,lon,z,'r','LineWidth',2)
            
            % Altitude Change between points
            a=deg2km(distance('rh',plat1,plon1,plat2,plon2));
            b=[deg2km(rng),z];
            
            Z = b(:,2);
            Z(Z == -1) = 0;
            b(:,2) = Z;
            ranger = num2str(b(:,1));
            heigther = num2str(b(:,2));
            maxrange = max(b(:,1));
            maxheight = max(b(:,2));
            
            altitude = str2num(get(findobj(handles.figure2,'tag','edit2'),'string')); % altitude
%             offset_height = max(altitude, (maxheight * 1.2));
            if (maxheight * 1.2) < 100
                offset_height = 100;
            else
                offset_height = maxheight * 1.2;
            end
            
            set (findobj(handles.figure2,'tag','listbox1'),'string',ranger);
            set (findobj(handles.figure2,'tag','listbox2'),'string',heigther);            
            set (findobj(handles.figure2,'tag','edit1'),'string',num2str((round((maxrange)))));
            set (findobj(handles.figure2,'tag','edit2'),'string',num2str((round(offset_height))));
            if round(b(1,2) ~= 0)
               set (findobj(handles.figure2,'tag','edit12'),'string',num2str((round((b(1,2))))));
            end
            set (findobj(handles.figure2,'tag','texterror'),'string',' ');
            set(findobj(handles.figure2,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
            set(findobj(handles.figure2,'tag','edit2'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
            set(findobj(handles.figure2,'tag','edit12'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);

            height_int = [0, round(offset_height)];
            range_int = [0, round(maxrange)];
            
            %         latfile=num2str(plat2);
            %         lonfile=num2str(plon2);
            %         strname=[latfile '_' lonfile '.txt'];
            %         fname = 'User_Files/terrain';
            %         save terrainpath fname;
            %         fname = [fname '/' strname];
            %         fid = fopen(fname,'w');
            %
            %         for i=1:length(rng)
            %             fprintf(fid,'%.2f\t%.2f\n',b(i,1),b(i,2));
            %         end
            
            pushbutton11_Callback(hObject, eventdata, handles)
            
        else % cancelflag
            close(warning_gui);
            close(fm);
        end
    end
end

set(gcf,'WindowButtonMotionFcn','guimousevalue');
