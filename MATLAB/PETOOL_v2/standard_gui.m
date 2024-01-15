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

function varargout = standard_gui(varargin)
% STANDARD_GUI Application M-file for standard_gui.fig
%    FIG = STANDARD_GUI launch standard_gui GUI.
%    STANDARD_GUI('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 04-Nov-2019 00:26:07

if nargin == 0  % LAUNCH GUI
   
	fig = openfig(mfilename,'new');
    
    % Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

    %fig_standard = imread('standard.jpg','jpg');
    axes(handles.axes1);
    load inputfigs.mat;
    imshow(fig_standard);

redflag = zeros(1,1);
save redflag.mat redflag

    if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
	catch
		disp(lasterr);
	end

end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and 
%| sets objects' callback properties to call them through the FEVAL 
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.

% --------------------------------------------------------------------
function varargout = edit1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit1.

load redflag.mat

set(findobj(handles.figure3,'tag','text11'),'string',' ');
val = str2num(get(findobj(handles.figure3,'tag','edit1'),'string'));
len = length(val);
if (isempty(val) | len>1 | val<0 | val>3000) set(findobj(handles.figure3,'tag','text11'), ...
   'string',strcat('M should be between [',num2str(0),',',num2str(3000),']  !'));
    set(findobj(handles.figure3,'tag','edit1'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
    redflag(1) = 1;
else
    set(findobj(handles.figure3,'tag','edit1'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
    redflag(1) = 0;
end
save redflag.mat redflag

% --------------------------------------------------------------------
function varargout = edit2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit2.


% --------------------------------------------------------------------
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton1.

load redflag.mat;

f3 = findobj('tag','figure3');
if ~isempty(find(redflag,1))
    set(findobj(f3,'tag','text11'),'string', 'Error in inputs !');
else

e1 = str2num(get(findobj(handles.figure3,'tag','edit1'),'string')); 
e2 = str2num(get(findobj(handles.figure3,'tag','edit2'),'string')); 
f = findobj('tag','figure2');
if get(findobj(f,'tag','radiobutton13') ,'value')
    load duct1
    index = get(findobj(f,'tag','popupmenu6'),'value');
    set (findobj(handles.figure3,'tag','text11'),'string',' ');
    
    duct_M_array1(index,:) = zeros(1, size(duct_M_array1,2));
    duct_height_array1(index,:) = zeros(1, size(duct_height_array1,2));
    
    duct_M_array1(index,1) = e1;
    duct_height_array1(index,1) = e2;
    save duct1 duct_M_array1 duct_height_array1
    close(handles.figure3)
    set(findobj(f,'tag','text44' ),'string',' ');
    delete redflag.mat;
else
    range = str2num(get(findobj(handles.figure3,'tag','edit5'),'string')); lrange = length(range);
    f = findobj('tag','figure2');
    set (findobj(handles.figure3,'tag','text11'),'string',' ');
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
            str2(index) = cellstr('Standard atmosphere');
        else
            str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
            str2(index) = cellstr('Standard atmosphere');
        end
        ranges = sort([ranges ; range]);
        str1 = num2str(ranges);
    else
        str1 = num2str(ranges);
        str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
        str2(index) = cellstr('Standard atmosphere');
    end
    
    duct_M_array2(index,:) = zeros(1, size(duct_M_array2,2));
    duct_height_array2(index,:) = zeros(1, size(duct_height_array2,2));
    
    duct_M_array2(index,1) = e1;
    duct_height_array2(index,1) = e2;
    save duct2 duct_M_array2 duct_height_array2
    close(handles.figure3)
    
    set(findobj(f,'tag','text44' ),'string',' ');
    set(findobj(f,'tag','edit23' ),'string',' ');
    set(findobj(f,'tag','listbox3'),'string',str1);
    set(findobj(f,'tag','listbox4'),'string',str2(:));
    
    delete redflag.mat;
end
end


% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
close(handles.figure3)
delete redflag.mat;

% --------------------------------------------------------------------
function varargout = edit5_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit5.


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load redflag.mat;

f3 = findobj('tag','figure3');
if ~isempty(find(redflag,1))
    set(findobj(f3,'tag','text11'),'string', 'Error in inputs !');
else
    
    e1 = str2num(get(findobj(handles.figure3,'tag','edit1'),'string'));
    e2 = str2num(get(findobj(handles.figure3,'tag','edit2'),'string'));
    
    set (findobj(handles.figure3,'tag','text11'),'string',' ');
    
    sgrad = 0.118;
    f = findobj('tag','figure2');
    maxalt = round(str2double(get(findobj(f, 'tag', 'edit2'), 'string')));
    
    term = 1*sgrad;
    M0 = e1;
    M = M0*ones(1,maxalt);
    M = M + (0:term:(maxalt-1)*term);
    
    plot(M, 1:maxalt, 'Color', [1 0 0], 'Linewidth', 1.5);
    xlabel('Modified Refractivity (M-units)');
    ylabel('Altitude (m)');
    title('Standard Atmosphere Profile');
    axis tight
    grid on
end
