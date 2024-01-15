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

function varargout = duct_params_gui(varargin)
% DUCT_PARAMS_GUI Application M-file for duct_params_gui.fig
%    FIG = DUCT_PARAMS_GUI launch duct_params_gui GUI.
%    DUCT_PARAMS_GUI('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 17-Oct-2002 14:27:54

if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'new');

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

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
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton1.
global duct_M_int
global mflag;

f = findobj('tag','figure2');
maxalt = round(str2double(get(findobj(f, 'tag', 'edit2'), 'string')));

height = str2num(get(findobj(handles.figure15,'tag','edit1'),'string'));
M_unit = str2num(get(findobj(handles.figure15,'tag','edit2'),'string'));
if isempty(M_unit) | length(M_unit)>1
    set(findobj(handles.figure15,'tag','text1'),'string','Error in M !');
elseif M_unit>duct_M_int(2) | M_unit<duct_M_int(1)
    set(findobj(handles.figure15,'tag','text1'),'string',['M must be in the range [',num2str(duct_M_int(1)),',',num2str(duct_M_int(2)),'] !']);
elseif height>maxalt | height<0
    set(findobj(handles.figure15,'tag','text1'),'string',['Altitude must be in the range [',num2str(0),',',num2str(maxalt),'] !']);    
else
    f = findobj('tag','figure14');
    heights = str2num(get(findobj(f,'tag','listbox1'),'string'));
    M_units = str2num(get(findobj(f,'tag','listbox2'),'string'));
    if mflag == 1
       index = find(M_unit == M_units); 
    else
       index = find(height == heights);         
    end
    
    if isempty(index)
        [heights,indices] = sort([heights;height]);
        [~,index] = max(indices);
        M_units = [M_units(1:index-1); M_unit; M_units(index:end)];
    else
        heights(index) = height; 
        M_units(index) = M_unit; 
    end
    set(findobj(f,'tag','listbox1'),'string',num2str(heights(:)));
    set(findobj(f,'tag','listbox2'),'string',num2str(M_units(:)));
    close(handles.figure15)
end


% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
close(handles.figure15);


% --------------------------------------------------------------------
function varargout = edit1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit1.


% --------------------------------------------------------------------
function varargout = edit2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit2.
