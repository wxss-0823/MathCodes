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

function createbufr(strname,aday,amonth,ayear,alatitude,alongitude,atemprature,...
                     seasurftemp,atmpreasure,relativehum,specifichum,vpreasure,windspeed,...
                     avgsurfacetemprature,initpottemprature,atmtempmeasheight,windspeedmeasheight,relhumidmeasheight)
     
     % BUFR SOURCE 
     % https://www.wmo.int/pages/prog/www/WDM/Guides/Guide-binary-1A.html%
     
     % SECTION-0 Indicator Section
     
         % 1-4 octet BUFR-coded according to the CCITT International Alphabet No. 5
         % For our dataform = 01000010 01010101 01000110 01010010

         % 5-7 octet Length of message in octets incl.Section-0
         % For our dataform = 95 octet

         % 8 octet version
         % For our dataform = 00000010 (Version 2)
     bufr_start = '01000010010101010100011001010010';% 4 octet
     bufr_length = dec2bin(95,24);%3 octet
     bufr_ver = '00000010'; % 1 octet
     section_0 = [bufr_start bufr_length bufr_ver];
     
     fid=fopen(strname,'w');
     fprintf(fid,section_0);% 8 octet for after Section_0
     fclose(fid);
     % SECTION-1 Identification Section
     
         % 1-3 length of section in octets
         % For our dataform = 00010010 (18 octet length)

         % 4 BUFR master table
         % For our dataform = 00000000 (standard WMO FM 94 BUFR Tables)

         % 5-6 octet Originating centre: code table 0 01 031
         % For our dataform = 00000000 00111010 (US Navy - FNOC as placeholder)

         % 7 octet Update sequence number
         % For our dataform = 00000000 (original message)

         % 8 octet Bit 1 = 0 No optional section, = 1 Optional section included
         % Bits 2 - 8 set to zero (reserved)
         % For our dataform = 00000000 (No optional Section)

         % 9 octet Data Category type (BUFR Table A)
         % For our dataform = 00000010 (Vertical soundings (other than satellite) as a placeholder)

         % 10 0ctet Data Category sub-type (defined by local ADP centres)
         % For our dataform = 00000000 (as a placeholder)

         % 11 octet Version number of master tables used (currently 2 for WMO FM 94 BUFR tables)
         % For our dataform = 00000010

         % 12 octet Version number of local tables used to augment the master table in use
         % For our dataform = 00000001

         % 13 octet Year of century
         % For our dataform = 01011010 (90 as a placeholder)

         % 14 octet Month
         % For our dataform = 00000001 (1 as a placeholder)

         % 15 octet Day
         % For our dataform = 00000001 (1 as a placeholder)

         % 16 octet Hour
         % For our dataform = 00000001 (1 as a placeholder)

         % 17 octet Minute
         % For our dataform = 00000001 (1 as a placeholder)

         % 18 octet Reserved for local use by ADP centres
         % For our dataform = 00000000
    
    section_1_begin = ['000000000000000000010010' '00000000' '00000000' '00111010' '00000000' '00000000'...
                       '00000010' '00000000' '00000010' '00000001']; % 12 octet
    
    % Add Begin of Section 1
    fid=fopen(strname,'r+');
    fseek(fid,64,'bof'); %Add after Section-0 8 octet end (8*8 = 64)
    fprintf(fid,section_1_begin); % Total 20 octet till begin
    fclose(fid);
                   
    % Convert Time Data to Binary
    byear=dec2bin(ayear,8);
    bmonth=dec2bin(amonth,8);
    bday=dec2bin(aday,8);
    timedata = [byear bmonth bday];
    
    % Add Time Data to BUFR File
    fid=fopen(strname,'r+');
    fseek(fid,160,'bof'); %Add after Section-1 20 octet end (20*8 = 160)
    fprintf(fid,timedata); % Total 23 octet till begin
    fclose(fid);
    
    %Create hour minute and end of Section-1
    bhour = '00000001';
    bminute = '00000001';
    section1reserve = '00000000';
    restofsection1 = [bhour bminute section1reserve];
    
    % Add End of Section1
    fid=fopen(strname,'r+');
    fseek(fid,184,'bof'); %Add after Section-1 23 octet end (23*8 = 184)
    fprintf(fid,restofsection1); % Total 26 octet till begin
    fclose(fid);
    
    % SECTION-2 (optional)
        % NO Section-2
     
    % SECTION-3 Data Description Section
         % 1-3 octet length of section in octets
         % For our dataform = 000000000000000000100011 (35 octet lenght)

         % 4 octet set to zero (reserved)
         % For our dataform = 00000000

         % 5-6 octet number of data subsets
         % For our dataform = 00000000 00000001 (all observed data)

         % 7 octet Bit 1 = 1 observed data, = 0 other data
         % Bit 2 = 1 compressed data, = 0 non-compressed data
         % Bit 3 - 8 set to zero (reserved)
         % For our dataform = 10000000

         % 8- octet A collection of descriptors of datas (2 octets for each data)
         % Descriptors in F X Y in BUFR Table B 2 bits F, 6 bits X, 8 bits Y
         % For our dataform = 28 octet (14 data * 2 0ctet)
     
    % Start of Section3
    section3_length = '000000000000000000100011'; % 3 octet
    section3_res = '00000000'; % 1 octet
    section_3_subset = '0000000000000001'; % 2 octet
    section_3_res_2 = '10000000'; % 1 octet
    
    section_3_start = [section3_length section3_res section_3_subset section_3_res_2]; %7 octet total
    
    fid=fopen(strname,'r+');
    fseek(fid,208,'bof'); %Add after end of Section-1 26 octet end (26*8 = 208)
    fprintf(fid,section_3_start); % Total 33 octet till begin
    fclose(fid);
    
     % Latitude descriptor -> F = 0, X = 27, Y = 002
     % Latitude Scale = 2, Ref_val = -9000, dat_width = 15 bit
     alatitude_descrip = [dec2bin(0,2) dec2bin(27,6) dec2bin(2,8)]; 
     alatitude_bufr = dec2bin(((alatitude*10^2)-(-9000)),16); 
     % Longitude descriptor -> F = 0, X = 28, Y = 002
     % Longitude Scale = 2, Ref_val = -9000, dat_width = 15 bit
     alongitude_descrip = [dec2bin(0,2) dec2bin(28,6) dec2bin(2,8)];
     alongitude_bufr = dec2bin(((alongitude*10^2)-(-9000)),16);
    
     % Air temperature descriptor -> F = 0, X = 12, Y = 023
     % Air tempreture Scale = 0, Ref_val = -99, dat_width = 8 bit
     atemprature_descrip = [dec2bin(0,2) dec2bin(12,6) dec2bin(23,8)]; 
     atemprature_bufr = dec2bin(((atemprature * 10^0)-(-99)),8);
     
     % Sea Surface temperature descriptor -> F = 0, X = 22, Y = 049 Kelvin
     % Sea Surface tempreture Scale = 2, Ref_val = 0, dat_width = 15 bit
     seasurftemp_descrip = [dec2bin(0,2) dec2bin(22,6) dec2bin(49,8)]; 
     seasurftemp_bufr = dec2bin((((seasurftemp + 273.15) * 10^0)-(0)),16); % need to change celcius to Kelvin
     
     % Atmospheric Pressure descriptor -> F = 0, X = 10, Y = 004 Pa
     % Atmospheric Pressure Scale = -1, Ref_val = 0, dat_width = 14 bit
     atmpreasure_descrip = [dec2bin(0,2) dec2bin(10,6) dec2bin(4,8)]; 
     atmpreasure_bufr = dec2bin((((atmpreasure * 100) * 10^-1)-(0)),16); % need to change mbar to Pa
     
     % Relative Humidity descriptor -> F = 0, X = 13, Y = 003
     % Relative Humidity Scale = 0, Ref_val = 0, dat_width = 7 bit
     relativehum_descrip = [dec2bin(0,2) dec2bin(13,6) dec2bin(3,8)]; 
     relativehum_bufr = dec2bin(((relativehum * 10^0)-(0)),8);
     
     % Specific Humidity descriptor -> F = 0, X = 13, Y = 001
     % Specific Humidity Scale = 5, Ref_val = 0, dat_width = 14 bit
     specifichum_descrip = [dec2bin(0,2) dec2bin(13,6) dec2bin(1,8)]; 
     specifichum_bufr = dec2bin(((specifichum * 10^5)-(0)),16);
     
     % Vapour Pressure descriptor -> F = 0, X = 13, Y = 004
     % Vapour Pressure Scale = -1, Ref_val = 0, dat_width = 10 bit
     vpreasure_descrip = [dec2bin(0,2) dec2bin(13,6) dec2bin(4,8)]; 
     vpreasure_bufr = dec2bin((((vpreasure * 100) * 10^-1)-(0)),16);
    
     % Wind Speed descriptor -> F = 0, X = 11, Y = 002
     % Wind Speed Scale = 1, Ref_val = 0, dat_width = 12 bit
     windspeed_descrip = [dec2bin(0,2) dec2bin(11,6) dec2bin(2,8)]; 
     windspeed_bufr = dec2bin(((windspeed * 10^1)-(0)),16);
     
     % Average Surface Temp descriptor -> F = 0, X = 12, Y = 052
     % Average Surface Temp Scale = 1, Ref_val = 0, dat_width = 12 bit
     avgsurfacetemprature_descrip = [dec2bin(0,2) dec2bin(12,6) dec2bin(52,8)]; 
     avgsurfacetemprature_bufr = dec2bin((((avgsurfacetemprature + 273.15) * 10^1)-(0)),16);
     
     % Initial Pot. Temp descriptor -> F = 0, X = 012, Y = 001
     % Initial Pot. Temp Scale = 1, Ref_val = 0, dat_width = 12 bit
     initpottemprature_descrip = [dec2bin(0,2) dec2bin(1,6) dec2bin(1,8)]; 
     initpottemprature_bufr = dec2bin(((initpottemprature * 10^1)-(0)),16);
    
     % Atm. Temp Meas. Height descriptor -> F = 0, X = 07, Y = 001
     % Atm. Temp Meas. Height Scale = 0, Ref_val = 0, dat_width = 15 bit
     atmtempmeasheight_descrip = [dec2bin(0,2) dec2bin(7,6) dec2bin(1,8)]; 
     atmtempmeasheight_bufr = dec2bin(((atmtempmeasheight * 10^0)-(-400)),16);
    
     % Wind Speed Meas. Height descriptor -> F = 0, X = 07, Y = 001
     % Wind Speed Meas. Height Scale = 0, Ref_val = 0, dat_width = 15 bit
     windspeedmeasheight_descrip = [dec2bin(0,2) dec2bin(7,6) dec2bin(1,8)]; 
     windspeedmeasheight_bufr = dec2bin(((windspeedmeasheight * 10^0)-(-400)),16);
    
     % Relative Humid. Meas. Height descriptor -> F = 0, X = 07, Y = 001
     % Relative Humid. Meas. Height Scale = 0, Ref_val = 0, dat_width = 15 bit
     relhumidmeasheight_descrip = [dec2bin(0,2) dec2bin(7,6) dec2bin(1,8)]; 
     relhumidmeasheight_bufr = dec2bin(((relhumidmeasheight * 10^0)-(-400)),16);
  
     descriptor_part = [alatitude_descrip alongitude_descrip atemprature_descrip seasurftemp_descrip atmpreasure_descrip relativehum_descrip...
                        specifichum_descrip vpreasure_descrip windspeed_descrip avgsurfacetemprature_descrip...
                        initpottemprature_descrip atmtempmeasheight_descrip windspeedmeasheight_descrip relhumidmeasheight_descrip];
    fid=fopen(strname,'r+');
    fseek(fid,264,'bof'); %Add after end of Section-1 33 octet end (33*8 = 264)
    fprintf(fid,descriptor_part); % Total 61 octet till begin
    fclose(fid);
                         
     % SECTION-4 Data Section
         % 1-3 octet length of section in octets
         % For our dataform = 30 0ctet

         % 4 octet set to zero
         % For our dataform = 00000000

         % 5- octet Binary data defined by defined Descriptors in BUFR Table B
         % For our dataform it will change according to value entered on the 
         % BUFR Generator by the user
     % Start of Section4
    section4_length = '000000000000000000011110'; % 3 octet
    section4_res = '00000000'; % 1 octet
    
    section_4_start = [section3_length section3_res]; %4 octet total
    
    fid=fopen(strname,'r+');
    fseek(fid,488,'bof'); %Add after end of Section-3 61 octet end (61*8 = 488)
    fprintf(fid,section_4_start); % Total 65 octet till begin
    fclose(fid);
    
    % Datapart = 26 octet
    data_part = [alatitude_bufr alongitude_bufr atemprature_bufr seasurftemp_bufr...
                 atmpreasure_bufr relativehum_bufr specifichum_bufr vpreasure_bufr...
                 windspeed_bufr avgsurfacetemprature_bufr initpottemprature_bufr...
                 atmtempmeasheight_bufr windspeedmeasheight_bufr relhumidmeasheight_bufr];
    
    fid=fopen(strname,'r+');
    fseek(fid,520,'bof'); %Add after Section-4 begin 65 octet end (65*8 = 520)
    fprintf(fid,data_part); % Total 91 octet till begin
    fclose(fid); 
    
    % SECTION-5 End Section
         % 1-4 octet "7777" (coded according to the CCITT International Alphabet No. 5)
         % For our dataform = 00110111 00110111 00110111 00110111
    
    endofbufr = '00110111001101110011011100110111';
    fid=fopen(strname,'r+');
    fseek(fid,728,'bof'); %Add after end of Section-5  91 octet end (77*8 = 728)
    fprintf(fid,endofbufr); % Total 95 octet till begin
    fclose(fid);
    
end