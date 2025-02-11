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

function varargout = Analysis_Parameter(varargin)
% ANALYSIS_PARAMETER MATLAB code for Analysis_Parameter.fig
%      ANALYSIS_PARAMETER, by itself, creates a new ANALYSIS_PARAMETER or raises the existing
%      singleton*.
%
%      H = ANALYSIS_PARAMETER returns the handle to a new ANALYSIS_PARAMETER or the handle to
%      the existing singleton*.
%
%      ANALYSIS_PARAMETER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSIS_PARAMETER.M with the given input arguments.
%
%      ANALYSIS_PARAMETER('Property','Value',...) creates a new ANALYSIS_PARAMETER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Analysis_Parameter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Analysis_Parameter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analysis_Parameter

% Last Modified by GUIDE v2.5 05-Nov-2019 15:59:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analysis_Parameter_OpeningFcn, ...
                   'gui_OutputFcn',  @Analysis_Parameter_OutputFcn, ...
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


% --- Executes just before Analysis_Parameter is made visible.
function Analysis_Parameter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analysis_Parameter (see VARARGIN)

% Choose default command line output for Analysis_Parameter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
load koordinatlar
set(findobj(gcf,'tag','edit3'),'string',num2str(start_degree));
set (findobj(gcf,'tag','edit3'),'enable','inactive','backgroundcolor',[.83 .81 .78],'foregroundcolor',[0.5 0.5 0.5]);

% UIWAIT makes Analysis_Parameter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analysis_Parameter_OutputFcn(hObject, eventdata, handles) 
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

cancelflag = 0;

counter = str2num(get(findobj(gcf,'tag','edit1'),'string'));    
endpoint = str2num(get(findobj(gcf,'tag','edit2'),'string'));
if rem(endpoint,counter) ~= 0
    set(findobj(gcf,'tag','text6'),'string','Scanning Sector Size must be multiple of Angle Step Size !');
    else
    val1 = str2num(get(findobj(gcf,'tag','edit1'),'string'));
    val2 = str2num(get(findobj(gcf,'tag','edit2'),'string'));
    if (isempty(val1) || isempty(val2) )
        set(findobj(gcf,'tag','text6'),'string','No field should left blank!');
    else
        if (counter <= 0 || counter > 360)
            set(findobj(gcf,'tag','text6'),'string','Angle Step Size should be (0 360) !');
        elseif (endpoint < 0 || endpoint > 360)
            set(findobj(gcf,'tag','text6'),'string','Scanning Sector Size should be [0 360] !');
        else
            save analysisparameters counter endpoint cancelflag
            uiresume(gcf); close(gcf);
        end
    end
end



function edit3_Callback(hObject, eventdata, handles)
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


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

close(handles.figure1)

% counter = str2num(get(findobj(gcf,'tag','edit1'),'string')); 
% if ~isempty(counter)
%     uiresume(gcf); close(gcf);
% else
%     default='No';
%     choice = questdlg('Do you want to close the window without entering the parameters ?','Warning!','Yes','No',default);
%     switch choice
%         case 'Yes'
%             counter = [];
%             endpoint = [];
%             save analysisparameters counter endpoint
%             delete(hObject);
%         case 'No'
%             return
%     end
% end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if exist('analysisparameters.mat') ~= 0
load analysisparameters
cancelflag = 1;
save analysisparameters counter endpoint cancelflag
end

close(handles.figure1)
