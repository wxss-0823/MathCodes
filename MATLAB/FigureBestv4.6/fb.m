% % FigureBest start
% @ ͼͨ��
% ֧�� macos,windows,matlab after or 2016a
% ---------------------------
% % ��ΰ�װ����fb?
% ��һ������ѹ�����
% �ڶ������������ļ������ں��ʵĲ�������λ�ã�ȷ��ӵ�ж���дȨ�ޣ��������������/���ڹ�������
% ������������fb.m��������һ������ʱ��
% ���Ĳ���֮������������ڶ���������£�����fb���ɿ�������
% �Ϸ�������Ҫ�����Զ�����·��
%
% % �����ٶ����Ų�����?
% ��һ������֮�󣬿���ע�ͳ������һ������������������������ٶ�/���Զ��л�·����
% Ϊ�˱��������п��ٻ���java�౨�����������java���ڴ�,�ڣ�Ԥ��-����-java���ڴ�
% ����޷�д�룬�л�current folder������
% ÿ���滻���֤���Ϸ�ע�ʹ�һ��
% ��������ͨ����set pathע�Ͷ����Խ��
% ---------------------------

%% show msg
disp('FB is starting...')

%% encoding check
% ---------------------------
% PASS: UTF8 OR GBK
% WARNING: 'OTHERS'
DefaultCharacterSet = feature('DefaultCharacterSet');
locale = feature('locale');
encoding = locale.encoding;
if ~strcmp(DefaultCharacterSet,'GBK') | ~strcmp(encoding,'GBK')
    disp(['[DefaultCharacterSet]' DefaultCharacterSet '; ' '[encoding]' encoding])
    disp('Chaos character MAY occur if were NOT GBK, while main functions wonnot be affected!')
    disp('Please change the encoding IF possible')
end

%% set path
% ---------------------------
folderOfThis = fileparts(mfilename('fullpath')); % get the folder of current .m
addpath(genpath(folderOfThis)); % add path and subpath (temporary)
savepath % add path and subpath (permanent)
cd(folderOfThis) % change current folder
clear folderOfThis

%% set window size
% ---------------------------
% change the value in ~\settings\window.txt
% ����~\settings\window.txt�е�Ĭ��ֵ

%% open
FigureBest_v4


