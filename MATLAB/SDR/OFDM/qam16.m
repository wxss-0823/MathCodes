%16QAM调制子程序，子程序名称：qam16.m
%将二进制数目流转换为16QAM信号
function [complex_qam_data]=qam16(bitdata)
%输入参数：bitdata为二进制数码流
%输出参数：complex_qam_data为16QAM复信号
X1=reshape(bitdata,4,length(bitdata)/4)';    %将二进制数码流以4比特分段
d=1;
%转换4比特二进制码为十进制码1~16，生成mapping映射表中的索引
for i=1:length(bitdata)/4
    for j=1:4
        X1(i,j) = X1(i,j)*(2^(4-j));
    end
    source(i,1)=1+sum(X1(i,:));
end
%16QAM映射表，该表中存放的是16对，每队两个实数，表示星座位置
mapping=[-3*d 3*d;-d 3*d;d 3*d;3*d 3*d;-3*d d;-d d;d d;3*d d;-3*d -d;-d -d;d -d;3*d -d;-3*d -3*d;-d -3*d;d -3*d;3*d -3*d];
for i=1:length(bitdata)/4
    qam_data(i,:) = mapping(source(i),:);   %数据映射
end
complex_qam_data=complex(qam_data(:,1),qam_data(:,2));
%组合为复数形式，形成16QAM信号
