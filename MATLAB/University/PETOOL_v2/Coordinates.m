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

function varargout = Coordinates(varargin)
% COORDINATES MATLAB code for Coordinates.fig
%      COORDINATES, by itself, creates a new COORDINATES or raises the existing
%      singleton*.
%
%      H = COORDINATES returns the handle to a new COORDINATES or the handle to
%      the existing singleton*.
%
%      COORDINATES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COORDINATES.M with the given input arguments.
%
%      COORDINATES('Property','Value',...) creates a new COORDINATES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Coordinates_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Coordinates_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Coordinates

% Last Modified by GUIDE v2.5 03-Nov-2019 20:45:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Coordinates_OpeningFcn, ...
                   'gui_OutputFcn',  @Coordinates_OutputFcn, ...
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


% --- Executes just before Coordinates is made visible.
function Coordinates_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Coordinates (see VARARGIN)

% Choose default command line output for Coordinates
set(findobj(handles.figurecoordinates,'tag','radiobutton4'),'value',1);
set(findobj(handles.figurecoordinates,'tag','radiobutton3'),'value',0);
set(findobj(handles.figurecoordinates,'tag','edit5'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit6'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit8'),'enable','off');
set(findobj(handles.figurecoordinates,'tag','edit9'),'enable','off');

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Coordinates wait for user response (see UIRESUME)
% uiwait(handles.figurecoordinates);

global redflag;
redflag = zeros(1,6);

% --- Outputs from this function are returned to the command line.
function varargout = Coordinates_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function varargout = edit1_Callback(hObject, eventdata, handles, varargin)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

global redflag;

load limits;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit1'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<minlat | val>maxlat) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Initial Latitude should be [',num2str(minlat),',',num2str(maxlat),']  !'));
    set(findobj(handles.figurecoordinates,'tag','edit1'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(1) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(1) = 0;
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



function varargout = edit2_Callback(hObject, eventdata, handles, varargin)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

global redflag;

load limits;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit2'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<minlon | val>maxlon) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Initial Longitude should be [',num2str(minlon),',',num2str(maxlon),']  !'));
    set(findobj(handles.figurecoordinates,'tag','edit2'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(2) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit2'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(2) = 0;
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



function varargout = edit3_Callback(hObject, eventdata, handles, varargin)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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



function varargout = edit4_Callback(hObject, eventdata, handles, varargin)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


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


% --- Executes on button press in pushbutton1.
function varargout = pushbutton1_Callback(hObject, eventdata, handles, varargin)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global redflag;

cancelflag = 0;

fc = findobj('tag','figurecoordinates');
if ~isempty(find(redflag,1))
    set(findobj(fc,'tag','text5'),'string', 'Error in inputs !');
else

e1 = str2num(get(findobj(handles.figurecoordinates,'tag','edit1'),'string'));
e2 = str2num(get(findobj(handles.figurecoordinates,'tag','edit2'),'string'));
e3 = str2num(get(findobj(handles.figurecoordinates,'tag','edit5'),'string'));
e4 = str2num(get(findobj(handles.figurecoordinates,'tag','edit6'),'string'));
range = str2num(get(findobj(handles.figurecoordinates,'tag','edit8'),'string'));
angles = str2num(get(findobj(handles.figurecoordinates,'tag','edit9'),'string'));
load limits

if (get(findobj(handles.figurecoordinates,'tag','radiobutton4'),'value') == 1)
    range = [];
    angles = [];

    if isempty(e1) || isempty(e2) || isempty(e3) || isempty(e4)
        set(findobj(handles.figurecoordinates,'tag','text5'),'string','No field should left blank!');
    elseif (e1==e3) && (e2==e4)
        alertevent = ['Initial and Final Coords. cannot be identical!'];
        set(findobj(handles.figurecoordinates,'tag','text5'),'string',alertevent);
    else
        plat1 = e1;
        plon1 = e2;
        plat2 = e3;
        plon2 = e4;
        c = clock;
        date = [num2str(c(1)) '' num2str(c(2)) '' num2str(c(3)) '' num2str(c(4)) '' num2str(c(5))];
        foldername = [num2str(plat1,2) '_' num2str(plon1,2) '_' date];
        
        if exist(['User_Files/terrain_3Dplot/' foldername],'dir')
            default='No'; 
            choice = questdlg('Folder already exists. Would you like to update results ?','Warning!','Yes','No',default);
            switch choice
                case 'Yes'
                    folderpath = ['User_Files/terrain_3Dplot/' foldername];
                    filelist_1 = dir(folderpath);
                    for counter_1 = 1:length(filelist_1)
                        delete([folderpath '/' filelist_1(counter_1).name]);
                    end
                    folderpath_2 = ['User_Files/output_result_3Dplot/' foldername]; 
                    filelist_2 = dir(folderpath_2);
                    for counter_2 = 1:length(filelist_2)
                        delete([folderpath_2 '/' filelist_2(counter_2).name]);
                    end
                    if (plat2 >= plat1 ) & (plon2 >= plon1)
                        degree = (atand((plon2-plon1)/(plat2-plat1)));
                    elseif (plat2 < plat1)
                        degree = (atand((plon2-plon1)/(plat2-plat1)) + 180);
                    else
                        degree = (atand((plon2-plon1)/(plat2-plat1)) + 360);
                    end
                    start_degree = degree;
                    save koordinatlar plat1 plon1 plat2 plon2 range angles start_degree cancelflag;
                    uiresume(handles.figurecoordinates); close(handles.figurecoordinates);
                case 'No'
                    return
            end
        else
             if (plat2 >= plat1 ) & (plon2 >= plon1)
                degree = (atand((plon2-plon1)/(plat2-plat1)));
            elseif (plat2 < plat1)
                degree = (atand((plon2-plon1)/(plat2-plat1)) + 180);
            else
                degree = (atand((plon2-plon1)/(plat2-plat1)) + 360);
            end
            start_degree = degree;
            save koordinatlar plat1 plon1 plat2 plon2 range angles start_degree cancelflag;
            uiresume(handles.figurecoordinates); close(handles.figurecoordinates);
        end
    end
else
    if isempty(e1) || isempty(e2) || isempty(range) || isempty(angles)
        set(findobj(handles.figurecoordinates,'tag','text5'),'string','No field should left blank!');
    else
        set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
        plat1 = e1; 
        plon1 = e2;
        range = range;
        angles = angles;
        c = clock;
        date = [num2str(c(1)) '' num2str(c(2)) '' num2str(c(3)) '' num2str(c(4)) '' num2str(c(5))];

        foldername = [num2str(plat1,2) '_' num2str(plon1,2) '_' date];
        if exist(['User_Files/terrain_3Dplot/' foldername],'dir')
            default='No'; 
            choice = questdlg('Folder already exists. Would you like to update the results?','Warning!','Yes','No',default);
            switch choice
                case 'Yes'
                    folderpath = ['User_Files/terrain_3Dplot/' foldername];
                    filelist_1 = dir(folderpath);
                    for counter_1 = 1:length(filelist_1)
                        delete([folderpath '/' filelist_1(counter_1).name]);
                    end
                    folderpath_2 = ['User_Files/output_result_3Dplot/' foldername]; 
                    filelist_2 = dir(folderpath_2);
                    for counter_2 = 1:length(filelist_2)
                        delete([folderpath_2 '/' filelist_2(counter_2).name]);
                    end
                    start_degree = angles;
                    save koordinatlar plat1 plon1 range angles start_degree cancelflag;
                    uiresume(handles.figurecoordinates); close(handles.figurecoordinates);
                case 'No'
                    return
            end
        else
            start_degree = angles;
            save koordinatlar plat1 plon1 range angles start_degree cancelflag;
            uiresume(handles.figurecoordinates); close(handles.figurecoordinates);
        end
    end
end

end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

global redflag;

load limits;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit5'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<minlat | val>maxlat) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Final Latitude should be [',num2str(minlat),',',num2str(maxlat),']  !'));
    set(findobj(handles.figurecoordinates,'tag','edit5'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(3) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit5'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(3) = 0;
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

load limits;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit6'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<minlon | val>maxlon) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Final Longitude should be [',num2str(minlon),',',num2str(maxlon),']  !'));
    set(findobj(handles.figurecoordinates,'tag','edit6'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(4) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit6'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(4) = 0;
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


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(findobj(handles.figurecoordinates,'tag','radiobutton4'),'value',0);
set(findobj(handles.figurecoordinates,'tag','radiobutton3'),'value',1);
set(findobj(handles.figurecoordinates,'tag','edit8'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit9'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit5'),'enable','off');
set(findobj(handles.figurecoordinates,'tag','edit6'),'enable','off');


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double

global redflag;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit8'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<=0) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Range should be >',num2str(0),' !'));
    set(findobj(handles.figurecoordinates,'tag','edit8'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(5) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit8'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(5) = 0;
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


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double

global redflag;

set(findobj(handles.figurecoordinates,'tag','text5'),'string',' ');
val = str2num(get(findobj(handles.figurecoordinates,'tag','edit9'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<0 | val>360) set(findobj(handles.figurecoordinates,'tag','text5'), ...
   'string',strcat('Angle should be [',num2str(0),',',num2str(360),']  !'));
    set(findobj(handles.figurecoordinates,'tag','edit9'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(6) = 1;
else
    set(findobj(handles.figurecoordinates,'tag','edit9'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(6) = 0;
end

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function radiobutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(findobj(handles.figurecoordinates,'tag','radiobutton4'),'value',1);
set(findobj(handles.figurecoordinates,'tag','radiobutton3'),'value',0);
set(findobj(handles.figurecoordinates,'tag','edit5'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit6'),'enable','on');
set(findobj(handles.figurecoordinates,'tag','edit8'),'enable','off');
set(findobj(handles.figurecoordinates,'tag','edit9'),'enable','off');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if exist('koordinatlar.mat') ~= 0
load koordinatlar
cancelflag = 1;
save koordinatlar plat1 plon1 range angles start_degree cancelflag;
end

close(handles.figurecoordinates)


% --- Executes on mouse motion over figure - except title and menu.
function figurecoordinates_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figurecoordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
