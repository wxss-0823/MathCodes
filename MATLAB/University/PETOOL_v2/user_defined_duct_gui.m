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

function varargout = user_defined_duct_gui(varargin)
% USER_DEFINED_DUCT_GUI Application M-file for user_defined_duct_gui.fig
%    FIG = USER_DEFINED_DUCT_GUI launch user_defined_duct_gui GUI.
%    USER_DEFINED_DUCT_GUI('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 04-Nov-2019 15:40:35

if nargin == 0  % LAUNCH GUI

    fig = openfig(mfilename,'new');

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

    axes(handles.axes1);
    load inputfigs.mat;
    imshow(fig_elevated);
    
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
global range_int
global height_int
global duct_M_int

heights = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string')); 
M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string')); 

f = findobj('tag','figure2');
if get(findobj(f,'tag','radiobutton13') ,'value')
    if isempty(heights) | isempty(M_units) 
        set (findobj(handles.figure14,'tag','text4'),'string','Error in parameters !');
    elseif ~isempty(find(heights < 0)) | ~isempty(find(heights > height_int(2)))
        set (findobj(handles.figure14,'tag','text4'),'string',['Altitude must be in the range [0,',num2str(height_int(2)),'] m !']);    
    elseif ~isempty(find(M_units < duct_M_int(1))) | ~isempty(find(M_units > duct_M_int(2)))
        set (findobj(handles.figure14,'tag','text4'),'string',['M-units must be in the range [0,',num2str(duct_M_int(2)),'] !']);    
    elseif length(heights) < 2
        set (findobj(handles.figure14,'tag','text4'),'string','At least two altitude-M pairs must be entered !');    
    elseif heights(1) ~= 0
        set (findobj(handles.figure14,'tag','text4'),'string','Altitude 0 m must be defined!');    
    else    
        load duct1
        index = get(findobj(f,'tag','popupmenu6'),'value');
        set (findobj(handles.figure14,'tag','text4'),'string',' ');

        duct_M_array1(index,:) = zeros(1, size(duct_M_array1,2));    
        duct_height_array1(index,:) = zeros(1, size(duct_height_array1,2));   

        duct_M_array1(6,1:length(M_units)) = M_units'; 
        duct_height_array1(6,1:length(heights)) = heights'; 
        save duct1 duct_M_array1 duct_height_array1 
        close(handles.figure14);
        set(findobj(f,'tag','text44' ),'string',' ');
    end
else
    range = str2num(get(findobj(handles.figure14,'tag','edit1'),'string')); 
    f = findobj('tag','figure2');
    if isempty(heights) | isempty(M_units) 
        set (findobj(handles.figure14,'tag','text4'),'string','Error in parameters !');
    elseif ~isempty(find(heights < 0)) | ~isempty(find(heights > height_int(2)))
        set (findobj(handles.figure14,'tag','text4'),'string',['Altitude must be in the range [0,',num2str(height_int(2)),'] m !']);    
    elseif ~isempty(find(M_units < duct_M_int(1))) | ~isempty(find(M_units > duct_M_int(2)))
        set (findobj(handles.figure14,'tag','text4'),'string',['M-units must be in the range [0,',num2str(duct_M_int(2)),'] !']);    
    elseif length(heights) < 2
        set (findobj(handles.figure14,'tag','text4'),'string','At least two altitude-M pairs must be entered !');    
    elseif heights(1) ~= 0
        set (findobj(handles.figure14,'tag','text4'),'string','Altitude 0 m must be defined !');    
    else    
        set (findobj(handles.figure14,'tag','text4'),'string',' ');
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
                str2(index) = cellstr('User defined');
            else
                str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
                str2(index) = cellstr('User defined');
            end
            ranges = sort([ranges ; range]);
            str1 = num2str(ranges);        
        else
            str1 = num2str(ranges);
            str2 = cellstr(get(findobj(f,'tag','listbox4'),'string'));
            str2(index) = cellstr('User defined');
        end

        duct_M_array2(index,:) = zeros(1, size(duct_M_array2,2));    
        duct_height_array2(index,:) = zeros(1, size(duct_height_array2,2));   

        duct_M_array2(index,1:length(M_units)) = M_units';
        duct_height_array2(index,1:length(heights)) = heights';
        
        save duct2 duct_M_array2 duct_height_array2 
        close(handles.figure14)

        set(findobj(f,'tag','text44' ),'string',' ');
        set(findobj(f,'tag','edit23' ),'string',' ');
        set(findobj(f,'tag','listbox3'),'string',str1);
        set(findobj(f,'tag','listbox4'),'string',str2(:));    
    end
end



% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
close(handles.figure14);

% --------------------------------------------------------------------
function varargout = edit1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit1.


% --------------------------------------------------------------------
function varargout = edit2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit2.

f = findobj('tag','figure2');
maxalt = round(str2double(get(findobj(f, 'tag', 'edit2'), 'string')));

val = str2num(get(findobj(handles.figure14,'tag','edit2'),'string'));
if (isempty(val) | length(val)>1)
     set(findobj(handles.figure14,'tag','text4'),'string','Error in altitude !');
     set(findobj(handles.figure14,'tag','edit2'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
elseif (val < 0 | val > maxalt) 
     set(findobj(handles.figure14,'tag','text4'),'string',strcat('Altitude must be in the range (0,',num2str(maxalt),'] !'));
     set(findobj(handles.figure14,'tag','edit2'),'string',' ');
else set(findobj(handles.figure14,'tag','text4'),'string','Enter M-unit');
     set(findobj(handles.figure14,'tag','edit2'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
end


% --------------------------------------------------------------------
function varargout = edit3_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit3.
global duct_M_int

bgcolor = get(findobj(handles.figure14,'tag','edit2'),'backgroundcolor');
val1 = str2num(get(findobj(handles.figure14,'tag','edit2'),'string'));
if (bgcolor == [1 1 1] & ~isempty(val1)) 
   val2 = str2num(get(findobj(handles.figure14,'tag','edit3'),'string'));
   if (isempty(val2) | length(val2)>1)
        set(findobj(handles.figure14,'tag','text4'),'string','Error in M-unit !');
        set(findobj(handles.figure14,'tag','edit3'),'backgroundcolor',[1 0 0],'foregroundcolor',[1 1 1]);
   elseif (val2 < duct_M_int(1) | val2 > duct_M_int(2)) 
        set(findobj(handles.figure14,'tag','text4'),'string',strcat('M-unit must be in the range [',num2str(duct_M_int(1)),',',num2str(duct_M_int(2)),'] !'));
        set(findobj(handles.figure14,'tag','edit3'),'string',' ');
   else
       set(findobj(handles.figure14,'tag','edit3'),'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
       heights = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));
       M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
       if isempty(heights) index = 1; 
       else index = find(val1 == heights); 
       end
       if isempty(index)
           [heights,indices] = sort([heights;val1]);
           [dummy,index] = max(indices);
           M_units = [M_units(1:index-1); val2; M_units(index:end)];
       else
           heights(index) = val1; 
           M_units(index) = val2; 
       end
       set(findobj(handles.figure14,'tag','listbox1'),'string',num2str(heights(:)));
       set(findobj(handles.figure14,'tag','listbox2'),'string',num2str(M_units(:)));
       set(findobj(handles.figure14,'tag','edit2'),'string',' ');
       set(findobj(handles.figure14,'tag','edit3'),'string',' ');
       set(findobj(handles.figure14,'tag','text4'),'string',' ');
       
       %plot
       M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
       altitude = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));
       
       plot(M_units, altitude,  'Color', [1 0 0], 'Linewidth', 1.5);
       xlabel('Modified Refractivity (M-units)');
       ylabel('Altitude (m)');
       title('User-defined Duct Profile');
       axis tight
       grid on

   end
elseif (bgcolor == [1 1 1]) & (isempty(val1))
   set(findobj(handles.figure14,'tag','text4'),'string','Enter altitude first !');
   set(findobj(handles.figure14,'tag','edit3'),'string',' ');
else set(findobj(handles.figure14,'tag','text4'),'string','Error in altitude !');
   set(findobj(handles.figure14,'tag','edit3'),'string',' ');
end
 

% --------------------------------------------------------------------
function varargout = listbox1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.listbox1.
global mflag;

set(findobj(handles.figure14,'tag','text4'),'string',' ');
index = get (findobj(handles.figure14,'tag','listbox1'),'value');
set (findobj(handles.figure14,'tag','listbox2'),'value',index);
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');

if strcmp(ans,'MODIFY')
    str1 = cellstr(get(findobj(handles.figure14,'tag','listbox1'),'string'));
    str2 = cellstr(get(findobj(handles.figure14,'tag','listbox2'),'string'));
    mflag = 1;
    duct_params_gui;
    f = findobj('tag','figure15');
    set(findobj(f,'tag','edit2'),'string',char(str2(index)),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]);
    set(findobj(f,'tag','edit1'),'string',char(str1(index)));
elseif strcmp(ans,'DELETE')
    set(findobj(handles.figure14,'tag','edit2'),'string',' ');
    set(findobj(handles.figure14,'tag','edit3'),'string',' ');    
    str = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure14,'tag','listbox1'),'value',1);
    else set (findobj(handles.figure14,'tag','listbox1'),'value',index-1); end
    set (findobj(handles.figure14,'tag','listbox1'),'string',num2str(str(:)));
    str = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
    if(index < length(str)) str(index : length(str)-1) = str(index+1 : length(str)); end
    str(end) = [];
    if(isempty(str) | index == 1) set (findobj(handles.figure14,'tag','listbox2'),'value',1);
    else set (findobj(handles.figure14,'tag','listbox2'),'value',index-1); end
    set (findobj(handles.figure14,'tag','listbox2'),'string',num2str(str(:)));
end

%plot
M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
altitude = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));

plot(M_units, altitude,  'Color', [1 0 0], 'Linewidth', 1.5);
xlabel('Modified Refractivity (M-units)');
ylabel('Altitude (m)');
title('User-defined Duct Profile');
axis tight
grid on

% --------------------------------------------------------------------
function varargout = listbox2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.listbox2.
global mflag;

set(findobj(handles.figure14,'tag','text4'),'string',' ');
index = get (findobj(handles.figure14,'tag','listbox2'),'value');
set (findobj(handles.figure14,'tag','listbox1'),'value',index);
ans = questdlg('What do you want to do?','CHOOSE','MODIFY','DELETE','CANCEL','CANCEL');

if strcmp(ans,'MODIFY')
    str1 = cellstr(get(findobj(handles.figure14,'tag','listbox1'),'string'));
    str2 = cellstr(get(findobj(handles.figure14,'tag','listbox2'),'string'));
    mflag = 2;    
    duct_params_gui;
    f = findobj('tag','figure15');
    set(findobj(f,'tag','edit1'),'string',char(str1(index)),'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]);
    set(findobj(f,'tag','edit2'),'string',char(str2(index)));
elseif strcmp(ans,'DELETE')
    set(findobj(handles.figure14,'tag','edit2'),'string',' ');
    set(findobj(handles.figure14,'tag','edit3'),'string',' ');    
    str1 = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));
    if(index < length(str1)) str1(index : length(str1)-1) = str1(index+1 : length(str1)); end
    str1(end) = [];
    if(isempty(str1) | index == 1) set (findobj(handles.figure14,'tag','listbox1'),'value',1);
    else set (findobj(handles.figure14,'tag','listbox1'),'value',index-1); end
    set (findobj(handles.figure14,'tag','listbox1'),'string',num2str(str1(:)));
    str2 = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
    if(index < length(str2)) str2(index : length(str2)-1) = str2(index+1 : length(str2)); end
    str2(end) = [];
    if(isempty(str2) | index == 1) set (findobj(handles.figure14,'tag','listbox2'),'value',1);
    else set (findobj(handles.figure14,'tag','listbox2'),'value',index-1); end
    set (findobj(handles.figure14,'tag','listbox2'),'string',num2str(str2(:)));
end

%plot
M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
altitude = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));

plot(M_units, altitude,  'Color', [1 0 0], 'Linewidth', 1.5);
xlabel('Modified Refractivity (M-units)');
ylabel('Altitude (m)');
title('User-defined Duct Profile');
axis tight
grid on


% --- Executes on button press in pushbutton3.
% function pushbutton3_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % latitude=36;
% % longitude=42;
% 
% cd Atmospheric_Data
% path = uigetdir('','Select Atmospheric Data Folder');
% cd ..
% 
% if path ~=0
%     bufrfiles = dir([path '/*.txt']);
%     numberof_files=size(bufrfiles,1);
%     
%     latitude = str2double(bufrfiles(1).name(1:2));
%     longitude = str2double(bufrfiles(1).name(4:5));
%     
%     height_M = [];
%     for k=1:numberof_files
%         textFilename = [path '/' num2str(latitude) '_' num2str(longitude) '_' num2str(k) 'bufr.txt'];
%         fid = fopen(textFilename, 'r');
%         
%         a=fgets(fid);
%         
%         % Decoding BUFR Data
%         % Divide by 10 to the power Scale
%         % Add Reference Value
%         
%         year = bin2dec(a(161:168));
%         month = bin2dec(a(169:176));
%         day = bin2dec(a(177:185));
%         latitude = (bin2dec(a(521:536))+(-9000))/10^2;
%         longitude = (bin2dec(a(537:552))+(-9000))/10^2;
%         atemperature = (bin2dec(a(553:560))+(-99))/10^0; % Celcius
%         seasurfacetemperature = ((bin2dec(a(561:576))+(0))/10^0)-273.15; % Kelvin
%         atmpressure = ((bin2dec(a(577:592))+(0))*10^1); % Pascal
%         relativehumid = (bin2dec(a(593:600))+(0))/10^0; % %
%         specifichumid = (bin2dec(a(601:616))+(0))/10^5; % kg/kg
%         vpressure = ((bin2dec(a(617:632))+(0))*10^1); % Pascal
%         windspeed = (bin2dec(a(633:648))+(0))/10^1; % m/s
%         avgsurftemperature = (bin2dec(a(649:664))+(0))/10^1-273.15;  % Kelvin
%         initpottemperature = (bin2dec(a(665:680))+(0))/10^0; % Kelvin
%         atmtempmeasheigth = (bin2dec(a(681:696))+(-400))/10^0; % meter
%         windspeedmeasheight = (bin2dec(a(697:712))+(-400))/10^0; % meter
%         relhumidmeasheight = (bin2dec(a(713:728))+(-400))/10^0; % meter
%         
%         %Debby Formula to calculate refrativity index
%         
%         su_basinci= vpressure*0.01;
%         
%         P_anlik= atmpressure * 0.01;
%         pot_P = 1000;
%         
%         temp_anlik = atemperature + 273.15;
%         pot_temp = temp_anlik * ((pot_P / P_anlik)^0.286);
%         pot_ep = su_basinci * (pot_P/P_anlik);
%         
%         refractivity_index = 1 + ( 77.6e-6 * (pot_P/ pot_temp) )  + (0.373 * (pot_ep / (temp_anlik^2) ));
%         refractivity_index = 10^6*(refractivity_index-1);
%         refractivity_index = refractivity_index + (k/earthRadius('kilometers'));
%         refractivity_index_2 = refractivity_index + (0.157*k);
%         height_M = [height_M; atmtempmeasheigth refractivity_index_2];
%         
%     end
%     height_M(1,2) = height_M(2,2) - 0.02;
%     height_M = sortrows(height_M,1);
%     
%     height_M = [0 height_M(1,2); height_M];
%     
%     duct_height_ar = height_M(:,1);
%     duct_M_ar = height_M(:,2);
%     num = length(duct_height_ar);
%     
%     rg1 = 2;
%     
%     for i = 1:num-1
%         if i == (num-1)
%             rg2 = num;
%         else
%             rg2 = round(duct_height_ar(i+1)/1);
%         end
%         
%         duct_grad = (duct_M_ar(i+1)-duct_M_ar(i))/(duct_height_ar(i+1)-duct_height_ar(i));   % 1/meter, gradient of the profile
%         
%         term = 1*duct_grad;
%         
%         for ii = rg1:rg2
%             duct_M_ar(ii) = duct_M_ar(ii-1)+term;
%         end
%         rg1 = rg2+1;
%     end
%     
%     set (findobj(handles.figure14,'tag','listbox1'),'string',height_M(:,1));
%     set (findobj(handles.figure14,'tag','listbox2'),'string',height_M(:,2));
%     
%     altitude = height_M(:,1);
%     M_units = height_M(:,2);
%     
%     plot(M_units, altitude,  'Color', [1 0 0], 'Linewidth', 1.5);
%     xlabel('Modified Refractivity (M-units)');
%     ylabel('Altitude (m)');
%     title('User-defined Duct Profile');
%     axis tight
%     grid on
%     
% end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

M_units = str2num(get(findobj(handles.figure14,'tag','listbox2'),'string'));
altitude = str2num(get(findobj(handles.figure14,'tag','listbox1'),'string'));

plot(M_units, altitude,  'Color', [1 0 0], 'Linewidth', 1.5);
xlabel('Modified Refractivity (M-units)');
ylabel('Altitude (m)');
title('User-defined Duct Profile');
axis tight
grid on
