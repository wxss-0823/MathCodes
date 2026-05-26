clc
close all
clear
%% 修改找零速度：固定间隔 15 ms
speed1 = load("速度150.txt");
speed2 = load("速度250.txt");
speed3 = load("速度300.txt");
plot(speed1(1:200,1));hold on
plot(speed2(1:200,1));hold on
plot(speed3(1:200,1));hold on

%% 
figure
findZero = load("3-30pF找零.DAT");
plot(1:1:length(findZero(:, 1)), findZero(:, 1))