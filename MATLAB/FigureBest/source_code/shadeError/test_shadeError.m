% %ʾ������
% ---------------------
% x - ������
% y - ��ֵ����
% x������ == y������
x = 0:0.2:5;
y_mean = sin(x);
y = repmat(y_mean,20,1) + repmat(randn(20,1),1,length(x)).^0.5;
y = y.^1.4;
% %ʾ�����
% ---------------------
figure
shadeError(x,y,{@mean,@std},'lineprops','--r','transparent',1,'patchSaturation',0.2)
hold on

