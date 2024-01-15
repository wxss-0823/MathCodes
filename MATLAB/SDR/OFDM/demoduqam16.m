%16QAM信号的解调子程序，子程序名称：demoduqam16.m
%转换16QAM信号为二进制信号
function [demodu_bit_symble] = demoduqam16(Rx_serial_complex_symbols)
%输入参数：Rx_serial_complex_symbols为接收端接收到的复16QAM信号
%输出参数：demodu_bit_symble为二进制数码流
complex_symbols = reshape(Rx_serial_complex_symbols,1,length(Rx_serial_complex_symbols));
d=1;
mapping=[-3*d 3*d;-d 3*d;d 3*d;3*d 3*d;-3*d d;-d d;d d;3*d d;-3*d -d;-d -d;d -d;3*d -d;-3*d -3*d;-d -3*d;d -3*d;3*d -3*d];
complex_mapping=complex(mapping(:,1),mapping(:,2));
%将数据映射表转换为16QAM信号，即3组合为复数
for i=1:length(Rx_serial_complex_symbols)
    for j=1:16
        metrics(j) = abs(complex_symbols(1,i) - complex_mapping(j,1));
    end
    [min_metric , decode_symble(i)] = min(metrics);
    %将接收数据与标准16QAM信号比，找到差最小的，将其对应恢复成标准的16QAM信号
end
b = bitget(decode_symble(1)-1,4:-1:1);
for i = 2:length(Rx_serial_complex_symbols)
bits =  bitget(decode_symble(i)-1,4:-1:1);
b = [b,bits];
end
demodu_bit_symble = b;
