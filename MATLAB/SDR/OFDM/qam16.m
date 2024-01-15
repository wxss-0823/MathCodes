%16QAM�����ӳ����ӳ������ƣ�qam16.m
%����������Ŀ��ת��Ϊ16QAM�ź�
function [complex_qam_data]=qam16(bitdata)
%���������bitdataΪ������������
%���������complex_qam_dataΪ16QAM���ź�
X1=reshape(bitdata,4,length(bitdata)/4)';    %����������������4���طֶ�
d=1;
%ת��4���ض�������Ϊʮ������1~16������mappingӳ����е�����
for i=1:length(bitdata)/4
    for j=1:4
        X1(i,j) = X1(i,j)*(2^(4-j));
    end
    source(i,1)=1+sum(X1(i,:));
end
%16QAMӳ����ñ��д�ŵ���16�ԣ�ÿ������ʵ������ʾ����λ��
mapping=[-3*d 3*d;-d 3*d;d 3*d;3*d 3*d;-3*d d;-d d;d d;3*d d;-3*d -d;-d -d;d -d;3*d -d;-3*d -3*d;-d -3*d;d -3*d;3*d -3*d];
for i=1:length(bitdata)/4
    qam_data(i,:) = mapping(source(i),:);   %����ӳ��
end
complex_qam_data=complex(qam_data(:,1),qam_data(:,2));
%���Ϊ������ʽ���γ�16QAM�ź�
