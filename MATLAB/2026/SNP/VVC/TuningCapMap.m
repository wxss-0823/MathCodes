clear;
clc;
close all;

load("process_data.mat")
step01 = process_data(:, 1);
step02 = process_data(:, 3);
Z01 = process_data(:, 2);
Z02 = process_data(:, 4);

delta_z1 = zeros(length(Z01), 2);
for i=1:1:length(Z01)
    [delta_z1(i, 1), delta_z1(i, 2)] = min(abs(Z02-Z01(i, 1)));
    
    

end

