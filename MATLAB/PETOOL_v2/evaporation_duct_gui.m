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

function varargout = evaporation_duct_gui(varargin)
% EVAPORATION_DUCT_GUI MATLAB code for evaporation_duct_gui.fig
%      EVAPORATION_DUCT_GUI, by itself, creates a new EVAPORATION_DUCT_GUI or raises the existing
%      singleton*.
%
%      H = EVAPORATION_DUCT_GUI returns the handle to a new EVAPORATION_DUCT_GUI or the handle to
%      the existing singleton*.
%
%      EVAPORATION_DUCT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EVAPORATION_DUCT_GUI.M with the given input arguments.
%
%      EVAPORATION_DUCT_GUI('Property','Value',...) creates a new EVAPORATION_DUCT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before evaporation_duct_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to evaporation_duct_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help evaporation_duct_gui

% Last Modified by GUIDE v2.5 01-Nov-2019 22:21:44

% Begin initialization code - DO NOT EDIT
    

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @evaporation_duct_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @evaporation_duct_gui_OutputFcn, ...
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

% --- Executes just before evaporation_duct_gui is made visible.
function evaporation_duct_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to evaporation_duct_gui (see VARARGIN)

% Choose default command line output for evaporation_duct_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

    axes(handles.axes1);
    load inputfigs.mat;
    imshow(fig_evap);

set(findobj(handles.figure7, 'tag', 'edit3'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
set(findobj(handles.figure7, 'tag', 'edit1'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);

set(findobj(handles.figure7, 'tag', 'popupmenuBuharlasmaOlukModelleri'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'popupmenuParametreGirisTipi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);

set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.50]);
set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);

set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);

set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);

global redflag;
redflag = zeros(1,14);

% UIWAIT makes evaporation_duct_gui wait for user response (see UIRESUME)
% uiwait(handles.figure7);

% --- Outputs from this function are returned to the command line.
function varargout = evaporation_duct_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Stub for Callback of the uicontrol handles.pushbutton1.

global redflag;

f7 = findobj('tag','figure7');
if ~isempty(find(redflag,1))
    set(findobj(f7,'tag','text38'),'string', 'Error in inputs !');
else
f = findobj('tag','figure2');
evaporationDuctModelIndex = get(findobj(handles.figure7,'tag','popupmenuBuharlasmaOlukModelleri') ,'value');

maxaltitude = round(str2double(get(findobj(f, 'tag', 'edit2'), 'string')));
altitude = 1:1:maxaltitude;

M0 = str2double(get(findobj(handles.figure7, 'tag', 'edit1'), 'string'));

if get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value') == 1
    c0 = 0.13;                            % M-unit/m
    z0 = 1.5*10^-4;                       % roughness factor (m)
    % M0 = 330;                           % base refractivity (M-units/m)
    
    ductHeight = str2double(get(findobj(handles.figure7, 'tag', 'edit3'), 'string'));
    
    M = M0 + c0*(altitude-ductHeight*log((altitude+z0)/z0));
    
else
    atmosferikSicaklik = str2double(get(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'string'));
    denizYuzeySicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'string'));
    atmosferikBasinc = str2double(get(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'string'));
    bagilNem = str2double(get(findobj(handles.figure7, 'tag', 'editBagilNem'), 'string'));
    spesifikNem = str2double(get(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'string'));
    baslangicPotansiyelSicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'string'));
    ruzgarHizi = str2double(get(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'string'));
    ruzgarHiziOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'string'));
    havaSicakligiOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'string'));
    bagilNemOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'string'));
    ortalamaYuzeyKatmanSicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'string'));
    suBuhariBasinci = str2double(get(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'string'));
    
    [ductHeight, M] = Evaporation_Duct_Models(evaporationDuctModelIndex, altitude, M0, atmosferikSicaklik, denizYuzeySicakligi, bagilNem, spesifikNem, atmosferikBasinc, baslangicPotansiyelSicakligi, ruzgarHizi, ruzgarHiziOlcumYuksekligi, havaSicakligiOlcumYuksekligi, bagilNemOlcumYuksekligi, ortalamaYuzeyKatmanSicakligi);
     M = M.';
end

M = [M(1) M];
altitude = [0 altitude];

evaporationDuctModelIndex = get(findobj(handles.figure7,'tag','popupmenuBuharlasmaOlukModelleri') ,'value');
parametreGirisTipiIndex = get(findobj(handles.figure7,'tag','popupmenuParametreGirisTipi') ,'value');
OlukYuksekligiSecenekleriIndex = get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value');

f = findobj('tag','figure2');
if get(findobj(f,'tag','radiobutton13') ,'value') % range-independent
    load duct1
    index = get(findobj(f,'tag','popupmenu6'),'value');
    set (findobj(handles.figure7,'tag','text38'),'string',' ');
    
    duct_M_array1(index,:) = zeros(1, size(duct_M_array1,2));
    duct_M_array1(index,1) = M0;
    duct_M_array1(index,2:length(M)+1) = M;
    if get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value') == 2
        duct_M_array1(index,length(M)+2:length(M)+13) = [atmosferikSicaklik denizYuzeySicakligi atmosferikBasinc ...
            bagilNem spesifikNem baslangicPotansiyelSicakligi ruzgarHizi ...
            suBuhariBasinci ortalamaYuzeyKatmanSicakligi ruzgarHiziOlcumYuksekligi ...
            havaSicakligiOlcumYuksekligi bagilNemOlcumYuksekligi];
    else
        duct_M_array1(index,length(M)+2:length(M)+13) = [25 15 900 40 0.02 310 10 10 290 1 1 1]; %defaults
    end
 
    duct_height_array1(index,:) = zeros(1, size(duct_height_array1,2));    
    duct_height_array1(index,1) = ductHeight;
    duct_height_array1(index,2:length(M)+1) = altitude;
    duct_height_array1(index,length(M)+2:length(M)+13) = [OlukYuksekligiSecenekleriIndex parametreGirisTipiIndex evaporationDuctModelIndex zeros(1,9)];
    
    duct_M_array1(index, length(M)+14:end) = -1;
    duct_height_array1(index, length(M)+14:end) = 0;

    save duct1 duct_M_array1 duct_height_array1
    close(handles.figure7)
    
else % range-dependent
    range = str2num(get(findobj(handles.figure7,'tag','edit4'),'string'));
    f = findobj('tag','figure2');
    
    set (findobj(handles.figure7,'tag','text38'),'string',' ');
    ranges = str2num(get(findobj(f,'tag','listbox3'),'string'));
    index = find(range == ranges);
    load duct2

    if isempty(index)
        array = find(range>ranges);
        index = length(array)+1;
        if (index <= length(ranges))
            duct_M_array2(index+1:end+1,:) = duct_M_array2(index:end,:);
            duct_height_array2(index+1:end+1,:) = duct_height_array2(index:end,:);
            str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
            str2(index+1:end+1) = str2(index:end);
            str2(index) = cellstr('Evaporation duct');
        else
            str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
            str2(index) = cellstr('Evaporation duct');
        end
        ranges = sort([ranges ; range]);
        str1 = num2str(ranges);
    else
        str1 = num2str(ranges);
        str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
        str2(index) = cellstr('Evaporation duct');
    end

    duct_M_array2(index,:) = zeros(1, size(duct_M_array2,2));
    duct_M_array2(index,1) = M0;
    duct_M_array2(index,2:length(M)+1) = M;
    if get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value') == 2
        duct_M_array2(index,length(M)+2:length(M)+13) = [atmosferikSicaklik denizYuzeySicakligi atmosferikBasinc ...
            bagilNem spesifikNem baslangicPotansiyelSicakligi ruzgarHizi ...
            suBuhariBasinci ortalamaYuzeyKatmanSicakligi ruzgarHiziOlcumYuksekligi ...
            havaSicakligiOlcumYuksekligi bagilNemOlcumYuksekligi];
    else
        duct_M_array2(index,length(M)+2:length(M)+13) = [25 15 900 40 0.02 310 10 10 290 1 1 1]; %defaults
    end
           
    duct_height_array2(index,:) = zeros(1, size(duct_height_array2,2));   
    duct_height_array2(index,1) = ductHeight;
    duct_height_array2(index,2:length(M)+1) = altitude;
    duct_height_array2(index,length(M)+2:length(M)+13) = [OlukYuksekligiSecenekleriIndex parametreGirisTipiIndex evaporationDuctModelIndex zeros(1,9)];
    
    duct_M_array2(index, length(M)+14:end) = -1;
    duct_height_array2(index, length(M)+14:end) = 0;

    save duct2 duct_M_array2 duct_height_array2
    close(handles.figure7)
    
    set(findobj(f,'tag','text44' ),'string',' ');
    set(findobj(f,'tag','edit23' ),'string',' ');
    set(findobj(f,'tag','listbox3'),'string',str1);
    set(findobj(f,'tag','listbox4'),'string',str2(:));
end
  
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure7)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','edit1'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<0 | val>3000) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('M0 should be between [',num2str(0),',',num2str(3000),']  !'));
    set(findobj(handles.figure7,'tag','edit1'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(1) = 1;
else
    set(findobj(handles.figure7,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
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



function edit4_Callback(hObject, eventdata, handles)
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
% Stub for Callback of the uicontrol handles.edit3.
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','edit3'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<=0 | val>100) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Duct Height should be between (',num2str(0),',',num2str(100),']  !'));
    set(findobj(handles.figure7,'tag','edit3'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(2) = 1;
else
    set(findobj(handles.figure7,'tag','edit3'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(2) = 0;
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


% --- Executes on selection change in popupmenuOlukYuksekligiSecenekleri.
function popupmenuOlukYuksekligiSecenekleri_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuOlukYuksekligiSecenekleri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuOlukYuksekligiSecenekleri contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuOlukYuksekligiSecenekleri
olukYukseklikSecenekleriIndex = get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value');
parametreGirisTipiIndex = get(findobj(handles.figure7,'tag','popupmenuParametreGirisTipi') ,'value');

switch olukYukseklikSecenekleriIndex
    case 1 % User Enter Duct Height
        set(findobj(handles.figure7, 'tag', 'edit3'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
        set(findobj(handles.figure7, 'tag', 'edit1'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);

        set(findobj(handles.figure7, 'tag', 'popupmenuBuharlasmaOlukModelleri'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'popupmenuParametreGirisTipi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.50]);
        set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
         
        set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                
        set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);

    case 2 % Select Duct Model 

        set(findobj(handles.figure7, 'tag', 'edit3'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'edit1'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        set(findobj(handles.figure7, 'tag', 'popupmenuBuharlasmaOlukModelleri'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
        set(findobj(handles.figure7, 'tag', 'popupmenuParametreGirisTipi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);

        if parametreGirisTipiIndex == 1  % User Enter Atm Parameter and Select Duct Model   
            set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);            
            set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
            set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
        
            set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            
            set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                                   
        elseif parametreGirisTipiIndex == 2 % User Load Atm Parameter and Select Duct Model          

            set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            
            set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'on', 'backgroundcolor', [0.9 0.9 0.9], 'foregroundcolor', [0 0 0], 'fontweight', 'bold');
         
            set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
            set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
        end
end

% --- Executes during object creation, after setting all properties.
function popupmenuOlukYuksekligiSecenekleri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuOlukYuksekligiSecenekleri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuParametreGirisTipi.
function popupmenuParametreGirisTipi_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuParametreGirisTipi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuParametreGirisTipi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuParametreGirisTipi
parametreGirisTipiIndex = get(findobj(handles.figure7,'tag','popupmenuParametreGirisTipi') ,'value');

if parametreGirisTipiIndex == 1  % User Enter Atm Parameter and Select Duct Model
    set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
    
    set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    
    set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    
elseif parametreGirisTipiIndex == 2 % User Load Atm Parameter and Select Duct Model
    
    set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    
    set(findobj(handles.figure7, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'on', 'backgroundcolor', [0.9 0.9 0.9], 'foregroundcolor', [0 0 0], 'fontweight', 'bold');
    
    set(findobj(handles.figure7, 'tag', 'editEnlem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editBoylam'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editDay'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editAy'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
    set(findobj(handles.figure7, 'tag', 'editYil'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
end

% --- Executes during object creation, after setting all properties.
function popupmenuParametreGirisTipi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuParametreGirisTipi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuBuharlasmaOlukModelleri.
function popupmenuBuharlasmaOlukModelleri_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuBuharlasmaOlukModelleri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuBuharlasmaOlukModelleri contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuBuharlasmaOlukModelleri

updatebutton_Callback(hObject, eventdata, handles) % call update


% --- Executes during object creation, after setting all properties.
function popupmenuBuharlasmaOlukModelleri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuBuharlasmaOlukModelleri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editBaslangicPotansiyelSicakligi_Callback(hObject, eventdata, handles)
% hObject    handle to editBaslangicPotansiyelSicakligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBaslangicPotansiyelSicakligi as text
%        str2double(get(hObject,'String')) returns contents of editBaslangicPotansiyelSicakligi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editBaslangicPotansiyelSicakligi'),'string'));
if (isempty(val) | val<0 | val>380) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Initial Potential Temperature should be between [',num2str(0),',',num2str(380),']  !'));
    set(findobj(handles.figure7,'tag','editBaslangicPotansiyelSicakligi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(3) = 1;
else
    set(findobj(handles.figure7,'tag','editBaslangicPotansiyelSicakligi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(3) = 0;
end

% --- Executes during object creation, after setting all properties.
function editBaslangicPotansiyelSicakligi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBaslangicPotansiyelSicakligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editRuzgarHiziOlcumYuksekligi_Callback(hObject, eventdata, handles)
% hObject    handle to editRuzgarHiziOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRuzgarHiziOlcumYuksekligi as text
%        str2double(get(hObject,'String')) returns contents of editRuzgarHiziOlcumYuksekligi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editRuzgarHiziOlcumYuksekligi'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Wind Speed Measurement Height should be between [',num2str(0),',',num2str(10000),']  !'));
    set(findobj(handles.figure7,'tag','editRuzgarHiziOlcumYuksekligi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(4) = 1;
else
    set(findobj(handles.figure7,'tag','editRuzgarHiziOlcumYuksekligi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(4) = 0;
end


% --- Executes during object creation, after setting all properties.
function editRuzgarHiziOlcumYuksekligi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRuzgarHiziOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editAtmosferSicakligiOlcumYuksekligi_Callback(hObject, eventdata, handles)
% hObject    handle to editAtmosferSicakligiOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtmosferSicakligiOlcumYuksekligi as text
%        str2double(get(hObject,'String')) returns contents of editAtmosferSicakligiOlcumYuksekligi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editAtmosferSicakligiOlcumYuksekligi'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Atmospheric Temperature Measurement Height should be between [',num2str(0),',',num2str(10000),']  !'));
    set(findobj(handles.figure7,'tag','editAtmosferSicakligiOlcumYuksekligi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(5) = 1;
else
    set(findobj(handles.figure7,'tag','editAtmosferSicakligiOlcumYuksekligi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(5) = 0;
end


% --- Executes during object creation, after setting all properties.
function editAtmosferSicakligiOlcumYuksekligi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtmosferSicakligiOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editBagilNemOlcumYuksekligi_Callback(hObject, eventdata, handles)
% hObject    handle to editBagilNemOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBagilNemOlcumYuksekligi as text
%        str2double(get(hObject,'String')) returns contents of editBagilNemOlcumYuksekligi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editBagilNemOlcumYuksekligi'),'string'));
if (isempty(val) | val<0 | val>10000) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Relative Humidity Measurement Height should be between [',num2str(0),',',num2str(10000),']  !'));
    set(findobj(handles.figure7,'tag','editBagilNemOlcumYuksekligi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(6) = 1;
else
    set(findobj(handles.figure7,'tag','editBagilNemOlcumYuksekligi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(6) = 0;
end

% --- Executes during object creation, after setting all properties.
function editBagilNemOlcumYuksekligi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBagilNemOlcumYuksekligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editAtmSicaklik_Callback(hObject, eventdata, handles)
% hObject    handle to editAtmSicaklik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtmSicaklik as text
%        str2double(get(hObject,'String')) returns contents of editAtmSicaklik as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editAtmSicaklik'),'string'));
if (isempty(val) | val<-273 | val>100) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Atmospheric Temperature should be between [',num2str(-273),',',num2str(100),']  !'));
    set(findobj(handles.figure7,'tag','editAtmSicaklik'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(7) = 1;
else
    set(findobj(handles.figure7,'tag','editAtmSicaklik'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(7) = 0;
end


% --- Executes during object creation, after setting all properties.
function editAtmSicaklik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtmSicaklik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editDenizYuzeySicaklik_Callback(hObject, eventdata, handles)
% hObject    handle to editDenizYuzeySicaklik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDenizYuzeySicaklik as text
%        str2double(get(hObject,'String')) returns contents of editDenizYuzeySicaklik as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editDenizYuzeySicaklik'),'string'));
if (isempty(val) | val<0 | val>50) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Sea Surface Temperature should be between [',num2str(0),',',num2str(50),']  !'));
    set(findobj(handles.figure7,'tag','editDenizYuzeySicaklik'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(8) = 1;
else
    set(findobj(handles.figure7,'tag','editDenizYuzeySicaklik'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(8) = 0;
end

% --- Executes during object creation, after setting all properties.
function editDenizYuzeySicaklik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDenizYuzeySicaklik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editAtmosferikBasinc_Callback(hObject, eventdata, handles)
% hObject    handle to editAtmosferikBasinc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtmosferikBasinc as text
%        str2double(get(hObject,'String')) returns contents of editAtmosferikBasinc as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editAtmosferikBasinc'),'string'));
if (isempty(val) | val<500 | val>1084) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Atmospheric Pressure should be between [',num2str(500),',',num2str(1084),']  !'));
    set(findobj(handles.figure7,'tag','editAtmosferikBasinc'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(9) = 1;
else
    set(findobj(handles.figure7,'tag','editAtmosferikBasinc'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(9) = 0;
end


% --- Executes during object creation, after setting all properties.
function editAtmosferikBasinc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtmosferikBasinc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editBagilNem_Callback(hObject, eventdata, handles)
% hObject    handle to editBagilNem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBagilNem as text
%        str2double(get(hObject,'String')) returns contents of editBagilNem as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editBagilNem'),'string'));
if (isempty(val) | val<0 | val>100) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Relative Humidity should be between [',num2str(0),',',num2str(100),']  !'));
    set(findobj(handles.figure7,'tag','editBagilNem'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(10) = 1;
else
    set(findobj(handles.figure7,'tag','editBagilNem'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(10) = 0;
end


% --- Executes during object creation, after setting all properties.
function editBagilNem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBagilNem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editSpesifikNem_Callback(hObject, eventdata, handles)
% hObject    handle to editSpesifikNem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSpesifikNem as text
%        str2double(get(hObject,'String')) returns contents of editSpesifikNem as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editSpesifikNem'),'string'));
if (isempty(val) | val<0.004 | val>0.02) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Specific Humidity should be between [',num2str(0.004),',',num2str(0.02),']  !'));
    set(findobj(handles.figure7,'tag','editSpesifikNem'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(11) = 1;
else
    set(findobj(handles.figure7,'tag','editSpesifikNem'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(11) = 0;
end


% --- Executes during object creation, after setting all properties.
function editSpesifikNem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSpesifikNem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editRuzgarHizi_Callback(hObject, eventdata, handles)
% hObject    handle to editRuzgarHizi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRuzgarHizi as text
%        str2double(get(hObject,'String')) returns contents of editRuzgarHizi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editRuzgarHizi'),'string'));
if (isempty(val) | val<1 | val>50) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Wind Speed should be between [',num2str(1),',',num2str(50),']  !'));
    set(findobj(handles.figure7,'tag','editRuzgarHizi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(12) = 1;
else
    set(findobj(handles.figure7,'tag','editRuzgarHizi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(12) = 0;
end

% --- Executes during object creation, after setting all properties.
function editRuzgarHizi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRuzgarHizi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editOrtalamaYuzeyKatmanSicakligi_Callback(hObject, eventdata, handles)
% hObject    handle to editOrtalamaYuzeyKatmanSicakligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOrtalamaYuzeyKatmanSicakligi as text
%        str2double(get(hObject,'String')) returns contents of editOrtalamaYuzeyKatmanSicakligi as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editOrtalamaYuzeyKatmanSicakligi'),'string'));
if (isempty(val) | val<0 | val>380) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Average Surface Layer Temperature should be between [',num2str(0),',',num2str(380),']  !'));
    set(findobj(handles.figure7,'tag','editOrtalamaYuzeyKatmanSicakligi'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(13) = 1;
else
    set(findobj(handles.figure7,'tag','editOrtalamaYuzeyKatmanSicakligi'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(13) = 0;
end


% --- Executes during object creation, after setting all properties.
function editOrtalamaYuzeyKatmanSicakligi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOrtalamaYuzeyKatmanSicakligi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editvapourpressure_Callback(hObject, eventdata, handles)
% hObject    handle to editvapourpressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editvapourpressure as text
%        str2double(get(hObject,'String')) returns contents of editvapourpressure as a double
global redflag;

set(findobj(handles.figure7,'tag','text38'),'string',' ');
val = str2num(get(findobj(handles.figure7,'tag','editvapourpressure'),'string'));
if (isempty(val) | val<10 | val>100) set(findobj(handles.figure7,'tag','text38'), ...
   'string',strcat('Vapour Pressure should be between [',num2str(10),',',num2str(100),']  !'));
    set(findobj(handles.figure7,'tag','editvapourpressure'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
redflag(14) = 1;
else
    set(findobj(handles.figure7,'tag','editvapourpressure'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
redflag(14) = 0;
end


% --- Executes during object creation, after setting all properties.
function editvapourpressure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editvapourpressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editEnlem_Callback(hObject, eventdata, handles)
% hObject    handle to editEnlem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEnlem as text
%        str2double(get(hObject,'String')) returns contents of editEnlem as a double

% --- Executes during object creation, after setting all properties.
function editEnlem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEnlem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editBoylam_Callback(hObject, eventdata, handles)
% hObject    handle to editBoylam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBoylam as text
%        str2double(get(hObject,'String')) returns contents of editBoylam as a double

% --- Executes during object creation, after setting all properties.
function editBoylam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBoylam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDay_Callback(hObject, eventdata, handles)
% hObject    handle to editDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDay as text
%        str2double(get(hObject,'String')) returns contents of editDay as a double

% --- Executes during object creation, after setting all properties.
function editDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editAy_Callback(hObject, eventdata, handles)
% hObject    handle to editAy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAy as text
%        str2double(get(hObject,'String')) returns contents of editAy as a double

% --- Executes during object creation, after setting all properties.
function editAy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYil_Callback(hObject, eventdata, handles)
% hObject    handle to editYil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYil as text
%        str2double(get(hObject,'String')) returns contents of editYil as a double


% --- Executes during object creation, after setting all properties.
function editYil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonAtmDataYukle.
function pushbuttonAtmDataYukle_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAtmDataYukle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[year,month,day,latitude,longitude,atemperature,seasurfacetemperature,...
    atmpressure,relativehumid,specifichumid,vpressure,windspeed,...
    avgsurftemperature,initpottemperature,atmtempmeasheigth,...
    windspeedmeasheight,relhumidmeasheight] = readbufr();

if ~isempty(year)
set(findobj(handles.figure7, 'tag', 'editYil'), 'string', num2str(year));
set(findobj(handles.figure7, 'tag', 'editAy'), 'string',num2str(month));
set(findobj(handles.figure7, 'tag', 'editDay'), 'string',num2str(day));
set(findobj(handles.figure7, 'tag', 'editEnlem'), 'string',num2str(latitude));
set(findobj(handles.figure7, 'tag', 'editBoylam'), 'string',num2str(longitude));
set(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'string',num2str(atemperature));
set(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'string',num2str(seasurfacetemperature));
set(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'string',num2str(atmpressure));
set(findobj(handles.figure7, 'tag', 'editBagilNem'), 'string',num2str(relativehumid));
set(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'string',num2str(specifichumid));
set(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'string',num2str(vpressure));
set(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'string',num2str(windspeed));
set(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'string',num2str(initpottemperature));
set(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'string',num2str(windspeedmeasheight));
set(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'string',num2str(atmtempmeasheigth));
set(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'string',num2str(relhumidmeasheight));
set(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'string',num2str(avgsurftemperature));
         
updatebutton_Callback(hObject, eventdata, handles)
end

% --- Executes on button press in updatebutton.
function updatebutton_Callback(hObject, eventdata, handles)
% hObject    handle to updatebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
cla;
f = findobj('tag','figure2');
evaporationDuctModelIndex = get(findobj(handles.figure7,'tag','popupmenuBuharlasmaOlukModelleri') ,'value'); 

maxaltitude = round(str2double(get(findobj(f, 'tag', 'edit2'), 'string')));
altitude = 1:1:maxaltitude;
    
M0 = str2double(get(findobj(handles.figure7, 'tag', 'edit1'), 'string'));

if get(findobj(handles.figure7,'tag','popupmenuOlukYuksekligiSecenekleri') ,'value') == 1
    c0 = 0.13;                            % M-unit/m
    z0 = 1.5*10^-4;                       % roughness factor (m)
    % M0 = 330;                           % base refractivity (M-units/m)
       
    dh = str2double(get(findobj(handles.figure7, 'tag', 'edit3'), 'string'));
    
    M = M0 + c0*(altitude-dh*log((altitude+z0)/z0));
    
    plot(M, altitude, 'Color', [1 0 0], 'Linewidth', 1.5);
    xlabel('Modified Refractivity (M-units)');
    ylabel('Altitude (m)');
    title('Evaporation Duct Profile');
    grid on
else
    atmosferikSicaklik = str2double(get(findobj(handles.figure7, 'tag', 'editAtmSicaklik'), 'string'));
    denizYuzeySicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editDenizYuzeySicaklik'), 'string'));
    atmosferikBasinc = str2double(get(findobj(handles.figure7, 'tag', 'editAtmosferikBasinc'), 'string'));
    bagilNem = str2double(get(findobj(handles.figure7, 'tag', 'editBagilNem'), 'string'));
    spesifikNem = str2double(get(findobj(handles.figure7, 'tag', 'editSpesifikNem'), 'string'));
    baslangicPotansiyelSicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editBaslangicPotansiyelSicakligi'), 'string'));
    ruzgarHizi = str2double(get(findobj(handles.figure7, 'tag', 'editRuzgarHizi'), 'string'));
    ruzgarHiziOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'string'));
    havaSicakligiOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'string'));
    bagilNemOlcumYuksekligi = str2double(get(findobj(handles.figure7, 'tag', 'editBagilNemOlcumYuksekligi'), 'string'));
    ortalamaYuzeyKatmanSicakligi = str2double(get(findobj(handles.figure7, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'string'));
    suBuhariBasinci = str2double(get(findobj(handles.figure7, 'tag', 'editvapourpressure'), 'string'));

    [ductHeight, M] = Evaporation_Duct_Models(evaporationDuctModelIndex, altitude, M0, atmosferikSicaklik, denizYuzeySicakligi, bagilNem, spesifikNem, atmosferikBasinc, baslangicPotansiyelSicakligi, ruzgarHizi, ruzgarHiziOlcumYuksekligi, havaSicakligiOlcumYuksekligi, bagilNemOlcumYuksekligi, ortalamaYuzeyKatmanSicakligi);
    
    set(findobj(handles.figure7,'tag','edit3'),'string',ductHeight);  
    
    plot(M, altitude, 'Color', [1 0 0], 'Linewidth', 1.5);
    xlabel('Modified Refractivity (M-units)'); 
    ylabel('Altitude (m)');
    title('Evaporation Duct Profile');
    axis tight
    grid on
end
