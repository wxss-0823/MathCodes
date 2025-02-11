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

function [year,month,day,latitude,longitude,atemperature,seasurfacetemperature,...
    atmpressure,relativehumid,specifichumid,vpressure,windspeed,...
    avgsurftemperature,initpottemperature,atmtempmeasheigth,...
    windspeedmeasheight,relhumidmeasheight] = readbufr()
%read bufr files and decode them
cd User_Files\atmosphere_BUFR
[dname,path] = uigetfile('*.txt','Select Atmospheric BUFR Data File');
cd ..
cd ..
fid = fopen([path '/' dname],'r');

if fid ~= -1
    a=fgets(fid);
    bufr_length = bin2dec(a(33:56));% bufr_length should be 91 for our data type
    bufr_version = bin2dec(a(57:64));% version should be 2
    
    if (bufr_length ~= 95) || (bufr_version ~= 2) || (length(a) ~= 760)
        errordialog
    else
        year = bin2dec(a(161:168));
        month = bin2dec(a(169:176));
        day = bin2dec(a(177:185));
        latitude = (bin2dec(a(521:536))+(-9000))/10^2;
        longitude = (bin2dec(a(537:552))+(-9000))/10^2;
        atemperature = (bin2dec(a(553:560))+(-99))/10^0;
        seasurfacetemperature = ((bin2dec(a(561:576))+(0))/10^0)-273.15;
        atmpressure = ((bin2dec(a(577:592))+(0))*10^1)/100;
        relativehumid = (bin2dec(a(593:600))+(0))/10^0;
        specifichumid = (bin2dec(a(601:616))+(0))/10^5;
        vpressure = (bin2dec(a(617:632))+(0))*10^1;
        windspeed = (bin2dec(a(633:648))+(0))/10^1;
        avgsurftemperature = (bin2dec(a(649:664))+(0))/10^1-273.15;
        initpottemperature = (bin2dec(a(665:680))+(0))/10^1;
        atmtempmeasheigth = (bin2dec(a(681:696))+(-400))/10^0;
        windspeedmeasheight = (bin2dec(a(697:712))+(-400))/10^0;
        relhumidmeasheight = (bin2dec(a(713:728))+(-400))/10^0;      
    end

else
    year = [];
    month = [];
    day = [];
    latitude = [];
    longitude = [];
    atemperature = [];
    seasurfacetemperature = [];
    atmpressure = [];
    relativehumid = [];
    specifichumid = [];
    vpressure = [];
    windspeed = [];
    avgsurftemperature = [];
    initpottemperature = [];
    atmtempmeasheigth = [];
    windspeedmeasheight = [];
    relhumidmeasheight = [];
end


%%
function errordialog
    d = dialog('Position',[300 300 250 150],'Name','Error');

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','BUFR Data is Invalid');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
