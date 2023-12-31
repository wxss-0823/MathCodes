function [Xpoint,Ypoint] = gui_crosshair(action)
global rx_height
global rx_range
global plot_array_full
global plot_array_rx_height
global plot_array_rx_range
global free_space_loss
global free_space_loss_fix
global new_x
global new_y
global plot_array_full

%  CROSSHAIR:  A gui interface for reading (x,y) values from a plot.
%
%  A set of mouse driven crosshairs is placed on the current axes,
%  and displays the current (x,y) values of the line plot.  There is an
%  option to provide data specific values or interpolated values.  The
%  resolution of the data specific values depends on both the data
%  resolution and the GUI interface (mainly mouse movement resolution).
%  The interpolated values appear to provide a more continuous function,
%  however they too depend on the GUI interface resolution.  There are 
%  no options for extrapolation.
%  
%  For multiple traces, plots with the same length(xdata) are
%  tracked. Each mouse click returns Xpoint,Ypoint values and selecting 
%  'done' will remove the GUI and restore the mouse buttons to previous 
%  values.  Selecting 'exit' will remove the GUI and close the figure.
%
%  Some further help is given in the tool tips of the GUI.
%
%  Useage:  x = [1:10]; y(1,:) = sin(x); y(2,:) = cos(x); x2 = x.^2;
%           figure; plot(x2,y); crosshair
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
%  Licence:        GNU GPL, no express or implied warranties
%  History: 03/96, Richard G. Cobb <cobbr@plk.af.mil>
%           08/01, Darren.Weber@flinders.edu.au
%                  replaced obsolete 'table1' with 'interp1'; fixed bug
%                  with number of 'traces'; rationalized calculations into
%                  a common subfunction for x,y point calc in 'down','up', 
%                  & 'move' button functions; added option to turn on/off
%                  interpolation and the exit button; simplified updates 
%                  to graphics using global GUI handle structure.
%           11/01, Darren.Weber@flinders.edu.au
%                  added tooltips for several GUI handles
%                  added multiple interpolation methods
%                  added GUI for data matrix indices (given no interpolation)
%                  added option to select trace nearest to mouse click point
%                  reversed order of lines in data matrix to be consistent
%                    with the value returned from the nearest trace subfunction
%                  create crosshair lines after finding all plot lines to
%                    avoid confusing them with the plot lines
%           01/02, Darren.Weber@flinders.edu.au
%                  should now work across multiple plot figures, given
%                    that all gui handles and data are now stored in the
%                    plot figure 'userdata' handle.
%                  added functionality to move smoothly from interpolation
%                    back to the delimited data via the "next/previous" 
%                    buttons.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('action','var') 
    action = 'init';
elseif isempty(action)
    action = 'init';
end

XHR_HANDLES = get(gcbf,'userdata');

if strcmp(action, 'init');
    
    % Paint GUI
    XHR_HANDLES = INIT;
    
    % Update and return values
    XHR_HANDLES = updateDATA(XHR_HANDLES);
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');
    
% Mouse Click Down
elseif strcmp(action,'down');
    
    set(XHR_HANDLES.plot,'WindowButtonMotionFcn','gui_crosshair(''move'');');
    set(XHR_HANDLES.plot,'WindowButtonUpFcn','[Xpoint,Ypoint] = gui_crosshair(''up'');');
    
    XHR_HANDLES = updateDATA(XHR_HANDLES);
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');
    
% Mouse Drag Motion
elseif strcmp(action,'move');
    
    XHR_HANDLES = updateDATA(XHR_HANDLES);
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');
    
% Mouse Click Up
elseif strcmp(action,'up');
    
    set(XHR_HANDLES.plot,'WindowButtonMotionFcn',' ');
    set(XHR_HANDLES.plot,'WindowButtonUpFcn',' ');
    
    XHR_HANDLES = updateDATA(XHR_HANDLES);
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');
    
% Next or Previous X point
elseif or(strcmp(action,'nextx'),strcmp(action,'prevx'));
    
    XHR_HANDLES = moveX(XHR_HANDLES,action);
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');

% Exit crosshairs GUI
elseif strcmp(action,'done')
    cd User_Files\output_result
    [fname,pname] = uiputfile('*.txt','Save output to file');
    cd ..
    cd ..
    if fname ~= 0
        fpname = strcat(pname,fname);
        if (isempty(findstr(fpname,'.txt'))); fpname = strcat(fpname,'.txt');end 
        fid = fopen(fpname,'w');
        switch(get(gcf,'name'))
        case ['Propagation Factor vs Altitude (Range=',num2str(round(rx_range*1e-3*10)/10),' km)'],   
            fprintf(fid,'Propagation Factor vs Altitude (Range=%4.2f km)\n\n',round(rx_range*1e-3*10)/10);
            %fprintf(fid,'Free-space loss(dB) = %f\n\n',free_space_loss_fix);
            fprintf(fid,'Altitude(m)\t\tPropagation Factor(dB)\n\n');
            dummy = zeros(length(new_y),3);
            dummy(:,1) = new_y(:);
            dummy(:,2) = plot_array_rx_height(:);
            for i=1:length(new_y); fprintf(fid,'%f\t\t\t%f\n',dummy(i,1),dummy(i,2)); end
        case ['Path Loss vs Altitude (Range=',num2str(round(rx_range*1e-3*10)/10),' km)'],    
            fprintf(fid,'Path Loss vs Altitude (Range=%4.2f km)\n\n',round(rx_range*1e-3*10)/10);
            fprintf(fid,'Altitude(m)\t\tPath Loss(dB)\n\n');
            dummy(:,1) = new_y(:);
            dummy(:,2) = plot_array_rx_height(:);
            for i=1:length(new_y); fprintf(fid,'%f\t\t\t%f\n',dummy(i,1),dummy(i,2)); end
        case ['Path Loss vs Range (Altitude=',num2str(round(rx_height*10)/10),' m)'],
            fprintf(fid,'Path Loss vs Range (Altitude=%4.2f m)\n\n',round(rx_height*10)/10);
            fprintf(fid,'Range(km)\t\t\tPath Loss(dB)\tFree-space loss(dB)\n\n');
            dummy = zeros(length(new_x),3);
            dummy(:,1) = new_x(:);
            dummy(:,2) = plot_array_full(:,1);
            dummy(:,3) = plot_array_full(:,2);
            for i=1:length(new_x); fprintf(fid,'%f\t\t\t%f\t\t\t%f\n',dummy(i,1),dummy(i,2),dummy(i,3)); end
        case ['Propagation Factor vs Range (Altitude=',num2str(round(rx_height*10)/10),' m)'],
            fprintf(fid,'Propagation Factor vs Range (Altitude=%4.2f m)\n\n',round(rx_height*10)/10);
            fprintf(fid,'Range(km)\t\t\tPropagation Factor(dB)\n\n');
            dummy(:,1) = new_x(:);
            dummy(:,2) = plot_array_rx_range(:);
            for i=1:length(new_x); fprintf(fid,'%f\t\t\t%f\n',dummy(i,1),dummy(i,2)); end
        end
        fclose(fid);
    end
    
elseif strcmp(action,'exit')
    
    XHR_HANDLES = get(gcbf,'userdata');
    
    Xpoint = get(XHR_HANDLES.xvalue,'Value');
    Ypoint = get(XHR_HANDLES.yvalue,'Value');
    
    delete(XHR_HANDLES.interp);
    delete(XHR_HANDLES.xline);
    delete(XHR_HANDLES.yline);
    delete(XHR_HANDLES.xvalueLabel);
    delete(XHR_HANDLES.xvalue);
    delete(XHR_HANDLES.xindexLabel);
    delete(XHR_HANDLES.xindex);
    delete(XHR_HANDLES.xnext);
    delete(XHR_HANDLES.xprev);
    delete(XHR_HANDLES.yvalueLabel);
    delete(XHR_HANDLES.yvalue);
    delete(XHR_HANDLES.yindexLabel);
    delete(XHR_HANDLES.yindex);
    delete(XHR_HANDLES.trace);
    delete(XHR_HANDLES.traceLabel);
    delete(XHR_HANDLES.traceNearest);
    delete(XHR_HANDLES.done);
    delete(XHR_HANDLES.exit);
    close(XHR_HANDLES.plot);
    clear XHR_HANDLES;
    return;
    
end

set(gcf,'userdata',XHR_HANDLES);

return;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H] = moveX(H,move)
    
    interp = get(H.interp,'Value');
    if (interp > 1)
        xdata = H.DATA.xdata(:,H.DATA.yindex);
        [H.DATA.xindex] = NearestXYArrayPoint( xdata, H.DATA.xpoint, move );
    end
    
    if strcmp(move,'nextx')
        % Increase current xindex by one
        if(interp == 1), H.DATA.xindex = H.DATA.xindex + 1; end
        
    elseif strcmp(move,'prevx')
        % Decrease current xindex by one
        if(interp == 1), H.DATA.xindex = H.DATA.xindex - 1; end
        
    end
    
    % Get x point/value at new xindex
    s = size(H.DATA.xdata);
    if  H.DATA.xindex <= 0
        H.DATA.xindex = 1;
    elseif H.DATA.xindex >= s(1)
        H.DATA.xindex = s(1);
    end
    H.DATA.xpoint = H.DATA.xdata(H.DATA.xindex,H.DATA.yindex);
    H.DATA.ypoint = H.DATA.ydata(H.DATA.xindex,H.DATA.yindex);
    
    set(H.interp,'Value',1);
    updateGUI(H);
    
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ H ] = updateDATA( H )

    CurrentPoint  = get(H.axis,'Currentpoint');
    H.DATA.xpoint = CurrentPoint(1,1);
    H.DATA.ypoint = CurrentPoint(1,2);
    
    doNearTrace   = get(H.traceNearest,'Value');
    
    if (doNearTrace > 0)
        
        % Get new yindex for nearest trace
        [ H.DATA.xpoint, ...
          H.DATA.xindex, ...
          H.DATA.ypoint, ...
          H.DATA.yindex ] = NearestXYMatrixPoint( H.DATA.xdata,...
                                                  H.DATA.ydata,...
                                                  H.DATA.xpoint,...
                                                  H.DATA.ypoint);
    else
        H.DATA.yindex = get(H.trace,'Value');
    end
    
    CurrentPoint  = get(H.axis,'Currentpoint');
    H.DATA.xpoint = CurrentPoint(1,1);
    H.DATA.ypoint = CurrentPoint(1,2);
    
    H = interpY(H);
    H = updateGUI(H);

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ H ] = updateGUI( H )

    InterpMethod = get(H.interp,'Value');
    if (InterpMethod > 1)
        % There is no specific matrix x-index for 
        % an interpolated point, but the nearest xindex
        % is always returned from the interp function below
        % so that next/prev move function works correctly
        set(H.xindex,'String','');
    else
        set(H.xindex,'String',num2str(H.DATA.xindex));
    end
    set(H.xindex,'Value',H.DATA.xindex);
    
    tracestr = sprintf('%d',H.DATA.yindex);
    set(H.yindex,'String',tracestr,'Value',uint16(H.DATA.yindex));
    set(H.trace,'Value',uint16(H.DATA.yindex));
    
    % Create the crosshair lines on the figure, crossing at the x,y point
    x_rng  = get(H.axis,'Xlim');
    y_rng  = get(H.axis,'Ylim');
    set(H.xline,'Xdata',[H.DATA.xpoint H.DATA.xpoint],'Ydata',y_rng);
    set(H.yline,'Ydata',[H.DATA.ypoint H.DATA.ypoint],'Xdata',x_rng);
    
    % Update the x,y values displayed for the x,y point
    xstring = sprintf('%14.6f',H.DATA.xpoint);
    ystring = sprintf('%14.6f',H.DATA.ypoint);
    set(H.xvalue,'String',xstring,'Value',H.DATA.xpoint);
    set(H.yvalue,'String',ystring,'Value',H.DATA.ypoint);

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ H ] = interpY( H )
    
    % In this function, xdata & ydata are arrays, not matrices
    xdata = H.DATA.xdata(:,H.DATA.yindex);
    ydata = H.DATA.ydata(:,H.DATA.yindex);
    
    if      H.DATA.xpoint >= max(xdata)                
            H.DATA.xpoint  = max(xdata);
            H.DATA.xindex  = find(xdata == max(xdata));
            H.DATA.ypoint  = ydata(H.DATA.xindex);
            return;
    elseif  H.DATA.xpoint <= min(xdata)
            H.DATA.xpoint  = min(xdata);
            H.DATA.xindex  = find(xdata == min(xdata));
            H.DATA.ypoint  = ydata(H.DATA.xindex);
            return;
    end
    
    % 'none|nearest|linear|spline|cubic'
    interp = get(H.interp,'Value');
    
    switch interp
    case 1
        % Given that xdata & ydata are the same length arrays,
        % we can find the ypoint given the nearest xpoint.
        [H.DATA.xindex, H.DATA.xpoint] = NearestXYArrayPoint( xdata, H.DATA.xpoint );
        H.DATA.ypoint = ydata(H.DATA.xindex);
    case 2
        H.DATA.ypoint = interp1( xdata, ydata, H.DATA.xpoint, 'nearest' );
    case 3
        H.DATA.ypoint = interp1( xdata, ydata, H.DATA.xpoint, 'linear' );
    case 4
        H.DATA.ypoint = interp1( xdata, ydata, H.DATA.xpoint, 'spline' );
    case 5
        H.DATA.ypoint = interp1( xdata, ydata, H.DATA.xpoint, 'cubic' );
    otherwise
        %use default (linear in matlabR12)
        H.DATA.ypoint = interp1( xdata, ydata, H.DATA.xpoint );
    end

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ index, point ] = NearestXYArrayPoint( data_array, point, type )
    
    if ~exist('type','var') type = ''; end

    % In this function, input data_array is an array, not a matrix.
    % This function returns the data point in the array
    % that has the closest value to the value given (point).  In
    % the context of 'crosshair' the point is a mouse position.
    
    if      point >= max(data_array)
            point  = max(data_array);
            index  = find(data_array == point);
            return;
    elseif  point <= min(data_array)
            point  = min(data_array);
            index  = find(data_array == point);
            return;
    end
    
    data_sorted = sort(data_array);
    
    greater = find(data_sorted > point);
    greater_index = greater(1);
    
    lesser = find(data_sorted < point);
    lesser_index = lesser(length(lesser));
    
    greater_dif = data_sorted(greater_index) - point;
    lesser_dif  = point - data_sorted(lesser_index);
    
    if strcmp(type,'nextx'),
        index = greater_index;
    elseif strcmp(type,'prevx'),
        index = lesser_index;
    else
        if (greater_dif < lesser_dif)
            index = find(data_array == data_sorted(greater_index));
        else
            index = find(data_array == data_sorted(lesser_index));
        end
    end
    point = data_array(index);
    
return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ xpoint, xindex, ypoint, yindex ] = NearestXYMatrixPoint( Xdata, Ydata, xpoint, ypoint )

    % In this function, Xdata & Ydata are matrices of the same dimensions.
    % This function attempts to find the nearest values in Xdata & Ydata
    % to the mouse position (xpoint, ypoint).
    
    % It is assumed that Xdata has identical columns, so we only really
    % need the first column to find the nearest value to xpoint.
    
    [ xindex, xpoint ] = NearestXYArrayPoint( Xdata(:,1), xpoint );
    
    % Now, given the xpoint, we can select just that row of the
    % Ydata matrix corresponding to the xpoint.
    ydata = Ydata(xindex,:);
    
    % The ydata array is searched in same manner as the xdata
    % array for the nearest value.
    [ yindex, ypoint ] = NearestXYArrayPoint( ydata, ypoint );
    
return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H] = INIT
global rx_range
global rx_height

    H.plot = gcf; % Get current figure handles
    H.axis = gca; % Get current axis handles
    
    % store current button fcn
    H.button = get(H.plot,'WindowButtonDownFcn');
    % set XHR button down fcn
    set(H.plot,'WindowButtonDownFcn','gui_crosshair(''down'');');
    xaxis_label = [];
    yaxis_label = [];

    interpstr     =   'None|Nearest|Linear|Spline|Cubic';
    H.interp      =   uicontrol('Style','popup','Units','pixels',...
                              'Position',[90 493 65 20],...
                              'Tag','INTERP',...
                              'String',interpstr, ...
                              'backgroundcolor',[1 1 1], ...
                              'visible','off', ...
                              'enable','off');
                          
    switch(get(H.plot,'name'))
       case ['Path Loss vs Altitude (Range=',num2str(round(rx_range*1e-3*10)/10),' km)']    
           xaxis_label = 'Altitude (m)'; yaxis_label = 'Path Loss (dB)';
       case ['Propagation Factor vs Altitude (Range=',num2str(round(rx_range*1e-3*10)/10),' km)']    
           xaxis_label = 'Altitude (m)'; yaxis_label = 'Propag. Factor (dB)';
       case ['Path Loss vs Range (Altitude=',num2str(round(rx_height*10)/10),' m)']
           xaxis_label = 'Range (km)'; yaxis_label = 'Path Loss (dB)';
       case ['Propagation Factor vs Range (Altitude=',num2str(round(rx_height*10)/10),' m)']
           xaxis_label = 'Range (km)'; yaxis_label = 'Propag. Factor (dB)';
    end

    
    H.xvalueLabel = uicontrol('Style','text','Units','pixels',...
                              'Position',[90 490 65 20],...
                              'fontunits','pixels','fontsize',11,'fontname','arial',...
                              'Tag','XVALUELAB',...
                              'BackGroundColor',[.7 .7 .7],'String',xaxis_label);
                          
    H.xvalue      = uicontrol('Style','edit','Units','pixels',...
                              'Position',[155 492 85 20],...
                              'fontunits','pixels','fontsize',11,'fontname','arial','horizontalalignment','center',...
                              'Tag','XVALUE',...
                              'BackGroundColor',[ 1 1 1],'String',' ');   
                          
    H.yvalueLabel = uicontrol('Style','text','Units','pixels',...
                              'Position',[250 490 100 20],...
                              'fontunits','pixels','fontsize',11,'fontname','arial',...
                              'Tag','YVALUELAB',...
                              'BackGroundColor',[.7 .7 .7],'String',yaxis_label);
                          
    H.yvalue      = uicontrol('Style','edit','Units','pixels',...
                              'Position',[350 492 85 20],...
                              'fontunits','pixels','fontsize',11,'fontname','arial','horizontalalignment','center',...
                              'Tag','YVALUE',...
                              'BackGroundColor',[1 1 1],'String',' ');
    
    H.yindexLabel = uicontrol('Style','edit','Units','Normalized',...
                              'Position',[.92 .85 .08 .05],...
                              'Tag','YINDEXLAB',...
                              'BackGroundColor',[.7 .7 .7],'String','Yindex',...
                              'visible','off');
    H.yindex      = uicontrol('Style','edit','Units','Normalized',...
                              'Position',[.92 .80 .08 .05],...
                              'Tag','YINDEX',...
                              'BackGroundColor',[ 0 .7 .7],'String','',...
                              'visible','off');
    H.xindexLabel = uicontrol('Style','edit','Units','Normalized',...
                              'Position',[.92 .75 .08 .05],...
                              'Tag','XINDEXLAB',...
                              'BackGroundColor',[.7 .7 .7],'String','Xindex',...
                              'visible','off');
    H.xindex      = uicontrol('Style','edit','Units','Normalized',...
                              'Position',[.92 .70 .08 .05],...
                              'Tag','XINDEX',...
                              'BackGroundColor',[ 0 .7 .7],'String','',...
                              'visible','off');
   
    H.xprev       = uicontrol('Style','Push','Units','pixels',...
                              'Position',[500 492 65 20],...
                              'String','Previous',...
                              'fontunits','pixels','fontsize',11,'fontname','tahoma','fontweight','bold',...
                              'Tag','XPREV',...
                              'TooltipString','Go to previous index',...
                              'CallBack','gui_crosshair(''prevx'');');
                          
    H.xnext       = uicontrol('Style','Push','Units','pixels',...
                              'Position',[570 492 65 20],...
                              'String','Next',...
                              'fontunits','pixels','fontsize',11,'fontname','tahoma','fontweight','bold',...
                              'Tag','XNEXT',...
                              'TooltipString','Go to next index',...
                              'CallBack','gui_crosshair(''nextx'');');
                              
    H.done        = uicontrol('Style','Push','Units','pixels',...
                              'Position',[555 10 65 20],...
                              'String','Save',...
                              'fontunits','pixels','fontsize',11,'fontname','tahoma','fontweight','bold',...
                              'Tag','DONE',...
                              'TooltipString','Save data', ...
                              'CallBack','gui_crosshair(''done'');');
                          
    H.exit        = uicontrol('Style','Push','Units','pixels',...
                              'Position',[625 10 65 20],...
                              'String','Close',...
                              'fontunits','pixels','fontsize',11,'fontname','tahoma','fontweight','bold',...
                              'Tag','EXIT',...
                              'TooltipString','Close the figure', ...
                              'CallBack','gui_crosshair(''exit'');');
                          
set(findobj(gcf, 'tag', 'EXIT'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'DONE'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'XVALUELAB'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'YVALUELAB'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'XVALUE'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'YVALUE'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'XPREV'), 'units', 'characters','fontunits','points');
set(findobj(gcf, 'tag', 'XNEXT'), 'units', 'characters','fontunits','points');

% set(findobj(gcf, 'tag', 'XVALUELAB'), 'string', xaxis_label);
% set(findobj(gcf, 'tag', 'YVALUELAB'), 'string', yaxis_label);           


    %%%%%%%%%%%%%%%%%%%%%%%%%
    % Get Line Data from Plot
    
    % Lines are referenced as axis children, among other
    % axis children; so first get all axis children
    sibs = get(H.axis,'Children');
    
    % Now search axis children for any line types.
    % Because the columns of the y data matrix in a plot
    % command seem to be reversed in the axis children, 
    % count down from max sibs to the first sib.
    lines = 0;
    H.DATA.xdata = [];
    H.DATA.ydata = [];
    H.DATA.xpoint = [];
    H.DATA.ypoint = [];
    H.DATA.xindex = 1;
    H.DATA.yindex = 1;
    i = max(size(sibs));
    while i >= 1
        if strcmp(get(sibs(i),'Type'),'line')
            
            % OK, found a line among the axis children.
            lines = lines + 1;
            
            % put line data into a column of DATA.xdata|DATA.ydata
            H.DATA.xdata(:,lines) = get(sibs(i),'XData').';
            H.DATA.ydata(:,lines) = get(sibs(i),'YData').';
        end
        i = i - 1;
    end
    
    % 'traces' string variable must be in ascending order
    traces  = '';
    i = 1;
    while i <= lines;
        if i < lines
            tracelabel = sprintf('Path Loss|',i);            
        else
            tracelabel = sprintf('Free-space loss',i);
        end
        traces = strcat(traces,tracelabel);
        i = i + 1;
    end
    
    % If more than one line, provide GUI for line selection
    
    % Switch off||on Trace Selection GUI
    Vis = 'Off';
    if lines > 1,
        Vis = 'On';
    elseif lines == 0
        error('No lines found in the current plot window\n');
    end
    
    % Create Trace Index GUI
    H.traceLabel   = uicontrol('Style','text', 'Units','pixels',...
                               'Position',[10 6 70 20],...
                               'Tag','TRACELABEL',...
                               'Visible',Vis,'String','Which curve',...
                               'TooltipString','Choose the curve',...
                               'fontunits','pixels','fontsize',11,'fontname','arial',...
                               'BackGroundColor',[.7 .7 .7]);

    H.trace        = uicontrol('Style','Popup','Units','pixels',...
                               'Position',[80 8 150 20],...
                               'Tag','TRACESWITCH',...
                               'BackGroundColor','w','String',traces,...
                               'Visible',Vis,...
                               'CallBack',['[Xpoint,Ypoint] = gui_crosshair(''up'');',],...
                               'BackGroundColor',[1 1 1]);    
                           
    H.traceNearest = uicontrol('Style','checkbox', 'Units','pixels',...
                               'Position',[240 8 148 10],...
                               'Tag','TRACENEAREST',...
                               'Visible',Vis,'String','Follow the closest curve','Value',0,...
                               'TooltipString','Follow the closest curve',...
                               'BackGroundColor',[.7 .7 .7]);
    
    % Set X,Y cross hair lines
    % Do this after finding all the line axis children
    % to avoid confusing these lines with those of the
    % plot itself (counted above).
    x_rng = get(H.axis,'Xlim');
    y_rng = get(H.axis,'Ylim');
    H.xline = line(x_rng,[y_rng(1) y_rng(1)]);
    H.yline = line(x_rng,[y_rng(1) y_rng(1)]);
%     set(H.xline,'Color','r','EraseMode','xor','Tag','XLINE');
%     set(H.yline,'Color','r','EraseMode','xor','Tag','YLINE');
    set(H.xline,'Color','r','Tag','XLINE');
    set(H.yline,'Color','r','Tag','YLINE');
    
    
    set(findobj(gcf, 'tag', 'TRACELABEL'), 'units', 'characters','fontunits','points');
    set(findobj(gcf, 'tag', 'TRACESWITCH'), 'units', 'characters','fontunits','points');
    set(findobj(gcf, 'tag', 'TRACENEAREST'), 'units', 'characters','fontunits','points');

return


