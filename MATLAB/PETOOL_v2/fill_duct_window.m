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

%% ************************************************************************
% This function sets the refractivity (atmosphere) parameters in the main 
% window by using the stored parameters in .mat files.
% ************************************************************************
function dummy = fill_duct_window(selection,index,range)
f2 = findobj('tag','figure2');
if (get(findobj(f2,'tag','radiobutton13'),'value')) 
    load duct1.mat
    duct_M_array = duct_M_array1(index,:);
    duct_height_array = duct_height_array1(index,:);
    index = 1;
 else 
    load duct2
    duct_M_array = duct_M_array2; 
    duct_height_array = duct_height_array2;
end

listedeki = get(findobj(f2,'tag','listbox4'),'string');

if(selection == 1 | strcmp(selection,'Standard atmosphere'))
     standard_gui; f = findobj('tag','figure3');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'Standard atmosphere') | get(findobj(f2,'tag','radiobutton13'),'value'))
         set(findobj(f,'tag','edit1'),'string',num2str(duct_M_array(index,1)));
     end

     f2 = findobj('tag','figure2');
     if get(findobj(f2,'tag','radiobutton13'),'value') 
         set(findobj(f,'tag','edit5'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit5'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end     
elseif(selection == 2 | strcmp(selection,'Surface duct')) 
     surface_gui; f = findobj('tag','figure4');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'Surface duct') | get(findobj(f2,'tag','radiobutton13'),'value'))
         set(findobj(f,'tag','edit1'),'string',num2str(duct_M_array(index,1)));
         set(findobj(f,'tag','edit3'),'string',num2str(duct_M_array(index,2)));
         set(findobj(f,'tag','edit5'),'string',num2str(duct_M_array(index,3)));
         set(findobj(f,'tag','edit4'),'string',num2str(duct_height_array(index,2)));
         set(findobj(f,'tag','edit6'),'string',num2str(duct_height_array(index,3)));
     end
     f2 = findobj('tag','figure2');
     if get(findobj(f2,'tag','radiobutton13'),'value') 
         set(findobj(f,'tag','edit7'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit7'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end     
elseif(selection == 3 | strcmp(selection,'Surface-based duct')) 
     surface_based_duct_gui; f = findobj('tag','figure5');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'Surface-based duct') | get(findobj(f2,'tag','radiobutton13'),'value'))
         set(findobj(f,'tag','edit1'),'string',num2str(duct_M_array(index,1)));
         set(findobj(f,'tag','edit3'),'string',num2str(duct_M_array(index,2)));
         set(findobj(f,'tag','edit5'),'string',num2str(duct_M_array(index,3)));
         set(findobj(f,'tag','edit7'),'string',num2str(duct_M_array(index,4)));          
         set(findobj(f,'tag','edit4'),'string',num2str(duct_height_array(index,2)));
         set(findobj(f,'tag','edit6'),'string',num2str(duct_height_array(index,3)));
         set(findobj(f,'tag','edit8'),'string',num2str(duct_height_array(index,4)));
     end
     f2 = findobj('tag','figure2');      
     if get(findobj(f2,'tag','radiobutton13'),'value')
         set(findobj(f,'tag','edit9'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit9'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end     
elseif(selection == 4 | strcmp(selection,'Elevated duct'))
     elevated_duct_gui; f = findobj('tag','figure6');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'Elevated duct') | get(findobj(f2,'tag','radiobutton13'),'value'))
         set(findobj(f,'tag','edit1'),'string',num2str(duct_M_array(index,1)));
         set(findobj(f,'tag','edit3'),'string',num2str(duct_M_array(index,2)));
         set(findobj(f,'tag','edit5'),'string',num2str(duct_M_array(index,3)));
         set(findobj(f,'tag','edit7'),'string',num2str(duct_M_array(index,4)));          
         set(findobj(f,'tag','edit4'),'string',num2str(duct_height_array(index,2)));
         set(findobj(f,'tag','edit6'),'string',num2str(duct_height_array(index,3)));
         set(findobj(f,'tag','edit8'),'string',num2str(duct_height_array(index,4)));
     end
     f2 = findobj('tag','figure2');
     if get(findobj(f2,'tag','radiobutton13'),'value') 
         set(findobj(f,'tag','edit9'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit9'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end 
     
elseif(selection == 5 | strcmp(selection,'Evaporation duct'))
     evaporation_duct_gui; f = findobj('tag','figure7');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'Evaporation duct') | get(findobj(f2,'tag','radiobutton13'),'value'))
         ind = find(duct_M_array(index,:) ~= -1);
         len = length(ind); %length(duct_height_array(index,:));
         evaporationDuctModelIndex = duct_height_array(index,len-12+3);
         parametreGirisTipiIndex = duct_height_array(index,len-12+2);
         OlukYuksekligiSecenekleriIndex = duct_height_array(index,len-12+1);

         if evaporationDuctModelIndex ~= 0
         set(findobj(f,'tag','edit1'),'string',num2str(duct_M_array(index,1)));
         set(findobj(f,'tag','edit3'),'string',num2str(duct_height_array(index,1)));

         set(findobj(f,'tag','popupmenuBuharlasmaOlukModelleri'),'value',evaporationDuctModelIndex);
         set(findobj(f,'tag','popupmenuParametreGirisTipi'),'value',parametreGirisTipiIndex);
         set(findobj(f,'tag','popupmenuOlukYuksekligiSecenekleri'),'value',OlukYuksekligiSecenekleriIndex);

         atmosferikSicaklik = duct_M_array(index,len-12+1);
         denizYuzeySicakligi = duct_M_array(index,len-12+2);
         atmosferikBasinc = duct_M_array(index,len-12+3);
         bagilNem = duct_M_array(index,len-12+4);
         spesifikNem = duct_M_array(index,len-12+5);
         baslangicPotansiyelSicakligi = duct_M_array(index,len-12+6);
         ruzgarHizi = duct_M_array(index,len-12+7);
         suBuhariBasinci = duct_M_array(index,len-12+8);
         ortalamaYuzeyKatmanSicakligi = duct_M_array(index,len-12+9);
         ruzgarHiziOlcumYuksekligi = duct_M_array(index,len-12+10);
         havaSicakligiOlcumYuksekligi = duct_M_array(index,len-12+11);
         bagilNemOlcumYuksekligi = duct_M_array(index,len-12+12);
        
         set(findobj(f,'tag','editAtmSicaklik' ),'string',num2str(atmosferikSicaklik));
         set(findobj(f,'tag','editDenizYuzeySicaklik' ),'string',num2str(denizYuzeySicakligi));
         set(findobj(f,'tag','editAtmosferikBasinc' ),'string',num2str(atmosferikBasinc));
         set(findobj(f,'tag','editBagilNem' ),'string',num2str(bagilNem));
         set(findobj(f,'tag','editSpesifikNem' ),'string',num2str(spesifikNem));
         set(findobj(f,'tag','editBaslangicPotansiyelSicakligi' ),'string',num2str(baslangicPotansiyelSicakligi));
         set(findobj(f,'tag','editRuzgarHizi' ),'string',num2str(ruzgarHizi));
         set(findobj(f,'tag','editRuzgarHiziOlcumYuksekligi' ),'string',num2str(ruzgarHiziOlcumYuksekligi));
         set(findobj(f,'tag','editAtmosferSicakligiOlcumYuksekligi' ),'string',num2str(havaSicakligiOlcumYuksekligi));
         set(findobj(f,'tag','editBagilNemOlcumYuksekligi' ),'string',num2str(bagilNemOlcumYuksekligi));
         set(findobj(f,'tag','editOrtalamaYuzeyKatmanSicakligi' ),'string',num2str(ortalamaYuzeyKatmanSicakligi));
         set(findobj(f,'tag','editvapourpressure' ),'string',num2str(suBuhariBasinci));
         
         switch OlukYuksekligiSecenekleriIndex
             case 1 % User Enter Duct Height
                 set(findobj(f, 'tag', 'edit3'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                 set(findobj(f, 'tag', 'edit1'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                 
                 set(findobj(f, 'tag', 'popupmenuBuharlasmaOlukModelleri'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'popupmenuParametreGirisTipi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.50]);
                 set(findobj(f, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 
             case 2 % Select Duct Model
                 
                 set(findobj(f, 'tag', 'edit3'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'edit1'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                 set(findobj(f, 'tag', 'popupmenuBuharlasmaOlukModelleri'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                 set(findobj(f, 'tag', 'popupmenuParametreGirisTipi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                 
                 if parametreGirisTipiIndex == 1  % User Enter Atm Parameter and Select Duct Model
                     set(findobj(f, 'tag', 'editAtmSicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editAtmosferikBasinc'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editBagilNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editSpesifikNem'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editRuzgarHizi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'editvapourpressure'), 'enable', 'on', 'backgroundcolor', [1 1 1], 'foregroundcolor', [0 0 0]);
                     set(findobj(f, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     
                 elseif parametreGirisTipiIndex == 2 % User Load Atm Parameter and Select Duct Model
                     
                     set(findobj(f, 'tag', 'editAtmSicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editDenizYuzeySicaklik'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editAtmosferikBasinc'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editBagilNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editSpesifikNem'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editBaslangicPotansiyelSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editRuzgarHizi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editRuzgarHiziOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editAtmosferSicakligiOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editBagilNemOlcumYuksekligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editOrtalamaYuzeyKatmanSicakligi'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'editvapourpressure'), 'enable', 'inactive', 'backgroundcolor', [.83 .81 .78], 'foregroundcolor', [0.5 0.5 0.5]);
                     set(findobj(f, 'tag', 'pushbuttonAtmDataYukle'), 'enable', 'on', 'backgroundcolor', [0.9 0.9 0.9], 'foregroundcolor', [0 0 0], 'fontweight', 'bold');
                 end
         end
     end
     end

     f2 = findobj('tag','figure2');
     if get(findobj(f2,'tag','radiobutton13'),'value') 
         set(findobj(f,'tag','edit4'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit4'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end  
     
elseif(selection == 6 | strcmp(selection,'User defined'))
     user_defined_duct_gui; f = findobj('tag','figure14');
     if ~isempty(duct_M_array) & ~isempty(duct_height_array) & (strcmp(listedeki(index),'User defined') | get(findobj(f2,'tag','radiobutton13'),'value'))
         indices = find(duct_height_array(index,:) == 0);
         if(length(indices) > 1)last_index = indices(2)-1;
         else last_index = length(duct_height_array(index,:)); 
         end
         set(findobj(f,'tag','listbox1'),'string',num2str(duct_height_array(index,1:last_index)'));
         set(findobj(f,'tag','listbox2'),'string',num2str(duct_M_array(index,1:last_index)'));
     end
     f2 = findobj('tag','figure2');
     if get(findobj(f2,'tag','radiobutton13'),'value') 
         set(findobj(f,'tag','edit1'),'string',' ','enable','off','backgroundcolor',[.75 .75 .75],'foregroundcolor',[.75 .75 .75]);
     else set(findobj(f,'tag','edit1'),'string',range,'enable','inactive','backgroundcolor',[1 1 1],'foregroundcolor',[0.5 0.5 0.5]); 
     end     
end
