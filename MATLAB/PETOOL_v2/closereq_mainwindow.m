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
% It closes the main window by saving the parameters, 
% when the user pushes "exit" button
% ************************************************************************
global close_ans
close_ans = questdlg('Would like to to save the changes?','QUESTION','YES','NO','CANCEL','CANCEL');
if strcmp(close_ans,'YES')
    f = findobj('tag','figure2');
    set(findobj(f,'tag','texterror'),'string',' ');
    err = filesave('defaultinputs.mat');
    if (isempty(err)) delete(f); 
    else set(findobj(f,'tag','texterror'),'string',[err,'  >>>  Changes have not been saved !']); 
    end 
    close all;
elseif strcmp(close_ans,'NO') f = findobj('tag','figure2'); delete(f);
    close all;
elseif strcmp(close_ans,'CANCEL')
    % do nothing
end

if exist('duct1.mat') ~= 0
   delete duct1.mat;
end

if exist('duct2.mat') ~= 0
   delete duct2.mat;
end

if exist('inputs.mat') ~= 0
   delete inputs.mat;
end

if exist('input_ready_flag.mat') ~= 0
   delete input_ready_flag.mat;
end

if exist('limits.mat') ~= 0
   delete limits.mat;
end

if exist('mapprofileparameter.mat') ~= 0
   delete mapprofileparameter.mat;
end

if exist('koordinatlar.mat') ~= 0
   delete koordinatlar.mat;
end

if exist('terrainpath.mat') ~= 0
   delete terrainpath.mat;
end

if exist('flag.mat') ~= 0
   delete flag.mat;
end

if exist('redflag.mat') ~= 0
   delete redflag.mat;
end

if exist('analysisparameters.mat') ~= 0
   delete analysisparameters.mat;
end

if exist('degree.mat') ~= 0
   delete degree.mat;
end

if exist('maxheight.mat') ~= 0
   delete maxheight.mat;
end

if exist('resultpath.mat') ~= 0
   delete resultpath.mat;
end

if exist('altitudepath.mat') ~= 0
   delete altitudepath.mat;
end

if exist('angle_list.mat') ~= 0
   delete angle_list.mat;
end

if exist('angle_list_pol.mat') ~= 0
   delete angle_list_pol.mat;
end

if exist('results_array.mat') ~= 0
   delete results_array.mat;
end

if exist('altitude.mat') ~= 0
   delete altitude.mat;
end


