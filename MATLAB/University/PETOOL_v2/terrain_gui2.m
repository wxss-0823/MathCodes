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

function varargout = terrain_gui2(varargin)
% TERRAIN_GUI2 Application M-file for terrain_gui2.fig
%    FIG = TERRAIN_GUI2 launch terrain_gui2 GUI.
%    TERRAIN_GUI2('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 23-Oct-2010 23:02:40

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
function varargout = edit1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit1.


% --------------------------------------------------------------------
function varargout = edit2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit2.


% --------------------------------------------------------------------
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton1.
global range_int
val1 = str2num(get(findobj(handles.figure13n,'tag','edit1'),'string'));
if isempty(val1) | length(val1)>1
    set(findobj(handles.figure13n,'tag','text4'),'string','Error in inputs!');
elseif val1>range_int(2) | val1<range_int(1)
    set(findobj(handles.figure13n,'tag','text4'),'string',['Enter the range between [',num2str(range_int(1)),',',num2str(range_int(2)),']!']);
else
    f = findobj('tag','figure2');
    ranges = str2num(get(findobj(f,'tag','listbox3'),'string'));

    index = get(findobj(f,'tag','listbox3'),'val');

    if isempty(index)
        [ranges,indices] = sort([ranges;val1]);
        [dummy,index] = max(indices);
    else
        ranges(index) = val1; 
    end
    num2str(ranges(:))
    set(findobj(f,'tag','listbox3'),'string',num2str(ranges(:)));
    close(handles.figure13n)
end

% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
close(handles.figure13n)
