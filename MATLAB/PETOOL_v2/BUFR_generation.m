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

function varargout = BUFR_generation(varargin)
% BUFR_GENERATION MATLAB code for BUFR_generation.fig
%      BUFR_GENERATION, by itself, creates a new BUFR_GENERATION or raises the existing
%      singleton*.
%
%      H = BUFR_GENERATION returns the handle to a new BUFR_GENERATION or the handle to
%      the existing singleton*.
%
%      BUFR_GENERATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUFR_GENERATION.M with the given input arguments.
%
%      BUFR_GENERATION('Property','Value',...) creates a new BUFR_GENERATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BUFR_generation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BUFR_generation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BUFR_generation

% Last Modified by GUIDE v2.5 07-Nov-2019 23:46:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BUFR_generation_OpeningFcn, ...
                   'gui_OutputFcn',  @BUFR_generation_OutputFcn, ...
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


% --- Executes just before BUFR_generation is made visible.
function BUFR_generation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BUFR_generation (see VARARGIN)

% Choose default command line output for BUFR_generation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BUFR_generation wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global redflag;
redflag = zeros(1,17);


% --- Outputs from this function are returned to the command line.
function varargout = BUFR_generation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit1'),'string'));
if (isempty(val) | val<1 | val>31) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Day should be between [',num2str(1),',',num2str(31),']  !'));
    set(findobj(f1,'tag','edit1'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(13) = 1;
else
    set(findobj(f1,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(13) = 0;
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

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit2'),'string'));
if (isempty(val) | val<1 | val>12) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Month should be between [',num2str(1),',',num2str(12),']  !'));
    set(findobj(f1,'tag','edit2'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(14) = 1;
else
    set(findobj(f1,'tag','edit2'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(14) = 0;
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit3'),'string'));
if (isempty(val) | val<0 | val>99) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Year should be between [',num2str(0),',',num2str(99),']  !'));
    set(findobj(f1,'tag','edit3'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(15) = 1;
else
    set(findobj(f1,'tag','edit3'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(15) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit4'),'string'));
if (isempty(val) | val<-90 | val>90) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Latitude should be between [',num2str(-90),',',num2str(90),']  !'));
    set(findobj(f1,'tag','edit4'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(16) = 1;
else
    set(findobj(f1,'tag','edit4'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(16) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit5'),'string'));
if (isempty(val) | val<-90 | val>90) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Longitude should be between [',num2str(-180),',',num2str(180),']  !'));
    set(findobj(f1,'tag','edit5'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(18) = 1;
else
    set(findobj(f1,'tag','edit5'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(18) = 0;
end

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
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit6'),'string'));
if (isempty(val) | val<-273 | val>100) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Atmospheric Temperature should be between [',num2str(-273),',',num2str(100),']  !'));
    set(findobj(f1,'tag','edit6'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(1) = 1;
else
    set(findobj(f1,'tag','edit6'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(1) = 0;
end


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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit7'),'string'));
if (isempty(val) | val<0 | val>50) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Sea Surface Temperature should be between [',num2str(0),',',num2str(50),']  !'));
    set(findobj(f1,'tag','edit7'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(2) = 1;
else
    set(findobj(f1,'tag','edit7'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(2) = 0;
end


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit8'),'string'));
if (isempty(val) | val<500 | val>1084) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Atmospheric Pressure should be between [',num2str(500),',',num2str(1084),']  !'));
    set(findobj(f1,'tag','edit8'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(3) = 1;
else
    set(findobj(f1,'tag','edit8'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(3) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit14'),'string'));
if (isempty(val) | val<0 | val>100) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Relative Humidity should be between [',num2str(0),',',num2str(100),']  !'));
    set(findobj(f1,'tag','edit14'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(4) = 1;
else
    set(findobj(f1,'tag','edit14'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(4) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit15'),'string'));
if (isempty(val) | val<0.004 | val>0.02) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Specific Humidity should be between [',num2str(0.004),',',num2str(0.02),']  !'));
    set(findobj(f1,'tag','edit15'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(5) = 1;
else
    set(findobj(f1,'tag','edit15'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(5) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit16'),'string'));
if (isempty(val) | val<10 | val>100) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Vapour Pressure should be between [',num2str(10),',',num2str(100),']  !'));
    set(findobj(f1,'tag','edit16'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(8) = 1;
else
    set(findobj(f1,'tag','edit16'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(8) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit17'),'string'));
if (isempty(val) | val<2 | val>50) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Wind Speed should be between [',num2str(1),',',num2str(50),']  !'));
    set(findobj(f1,'tag','edit17'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(7) = 1;
else
    set(findobj(f1,'tag','edit17'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(7) = 0;
end


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit18'),'string'));
if (isempty(val) | val<0 | val>380) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Average Surface Layer Temperature should be between [',num2str(0),',',num2str(380),']  !'));
    set(findobj(f1,'tag','edit18'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(9) = 1;
else
    set(findobj(f1,'tag','edit18'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(9) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit19'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Wind Speed Measurement Height should be between [',num2str(0),',',num2str(10000),']  !'));
    set(findobj(f1,'tag','edit19'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(10) = 1;
else
    set(findobj(f1,'tag','edit19'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(10) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit20'),'string'));
if (isempty(val) | val<0 | val>380) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Initial Potential Temperature should be between [',num2str(0),',',num2str(380),']  !'));
    set(findobj(f1,'tag','edit20'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(6) = 1;
else
    set(findobj(f1,'tag','edit20'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(6) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double

global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit21'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Atmospheric Temp. Meas. Height should be between [',num2str(0),',',num2str(10000),']  !'));
    set(findobj(f1,'tag','edit21'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(11) = 1;
else
    set(findobj(f1,'tag','edit21'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(11) = 0;
end


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
global redflag;

f1 = findobj('tag','figure1');
set(findobj(f1,'tag','texterror'),'string',' ');
val = str2num(get(findobj(f1,'tag','edit22'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(f1,'tag','texterror'), ...
        'string',strcat('Relative Humidity Meas. Height should be between [',num2str(0),',',num2str(10000),']!'));
    set(findobj(f1,'tag','edit22'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(12) = 1;
else
    set(findobj(f1,'tag','edit22'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(12) = 0;
end


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
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
%Time Data

global redflag;

f1 = findobj('tag','figure1');
if ~isempty(find(redflag,1))
    set(findobj(f1,'tag','texterror'),'string', 'Error in inputs !');
else
    
    aday = str2num(get(findobj(handles.figure1,'tag','edit1'),'string'));
    amonth = str2num(get(findobj(handles.figure1,'tag','edit2'),'string'));
    ayear = str2num(get(findobj(handles.figure1,'tag','edit3'),'string'));
    
    %Location Data
    alatitude = str2num(get(findobj(handles.figure1,'tag','edit4'),'string'));
    alongitude = str2num(get(findobj(handles.figure1,'tag','edit5'),'string'));
    
    %Atmospheric Data
    atemprature = str2num(get(findobj(handles.figure1,'tag','edit6'),'string'));
    seasurftemp = str2num(get(findobj(handles.figure1,'tag','edit7'),'string'));
    atmpreasure = str2num(get(findobj(handles.figure1,'tag','edit8'),'string'));
    relativehum = str2num(get(findobj(handles.figure1,'tag','edit14'),'string'));
    specifichum = str2num(get(findobj(handles.figure1,'tag','edit15'),'string'));
    vpreasure = str2num(get(findobj(handles.figure1,'tag','edit16'),'string'));
    windspeed = str2num(get(findobj(handles.figure1,'tag','edit17'),'string'));
    avgsurfacetemprature = str2num(get(findobj(handles.figure1,'tag','edit18'),'string'));
    initpottemprature = str2num(get(findobj(handles.figure1,'tag','edit20'),'string'));
    atmtempmeasheight = str2num(get(findobj(handles.figure1,'tag','edit21'),'string'));
    windspeedmeasheight = str2num(get(findobj(handles.figure1,'tag','edit19'),'string'));
    relhumidmeasheight = str2num(get(findobj(handles.figure1,'tag','edit22'),'string'));
    
    if (isempty(ayear) || isempty(amonth) || isempty(aday) || isempty(alatitude) ||...
            isempty(alongitude)|| isempty(atemprature) || isempty(seasurftemp) || isempty(atmpreasure) ||...
            isempty(relativehum) || isempty(specifichum) || isempty(vpreasure) || isempty(windspeed) || isempty(avgsurfacetemprature) ||...
            isempty(initpottemprature) || isempty(atmtempmeasheight) || isempty(windspeedmeasheight) || isempty(relhumidmeasheight))
        set(findobj(handles.figure1,'tag','texterror'),'string','No field should left blank!');
        
    else
        
        cd User_Files\atmosphere_BUFR
        [fname,pname] = uiputfile('*.txt','Save file');
        cd ..
        cd ..
        if fname~=0
            fpname = strcat(pname,fname);
            if (isempty(findstr(fpname,'.txt'))); fpname = strcat(fpname,'.txt');end
            
            createbufr(fpname,aday,amonth,ayear,alatitude,alongitude,atemprature,...
                seasurftemp,atmpreasure,relativehum,specifichum,vpreasure,windspeed,...
                avgsurfacetemprature,initpottemprature,atmtempmeasheight,windspeedmeasheight,relhumidmeasheight)
            set (findobj(handles.figure1,'tag','texterror'),'string',strcat('Saved in file  "',fname,'"  '));
        end
    end
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(handles.figure1);

if exist('redflag.mat') ~= 0
   delete redflag.mat;
end
