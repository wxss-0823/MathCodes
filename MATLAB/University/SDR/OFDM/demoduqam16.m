%16QAM�źŵĽ���ӳ����ӳ������ƣ�demoduqam16.m
%ת��16QAM�ź�Ϊ�������ź�
function [demodu_bit_symble] = demoduqam16(Rx_serial_complex_symbols)
%���������Rx_serial_complex_symbolsΪ���ն˽��յ��ĸ�16QAM�ź�
%���������demodu_bit_symbleΪ������������
complex_symbols = reshape(Rx_serial_complex_symbols,1,length(Rx_serial_complex_symbols));
d=1;
mapping=[-3*d 3*d;-d 3*d;d 3*d;3*d 3*d;-3*d d;-d d;d d;3*d d;-3*d -d;-d -d;d -d;3*d -d;-3*d -3*d;-d -3*d;d -3*d;3*d -3*d];
complex_mapping=complex(mapping(:,1),mapping(:,2));
%������ӳ���ת��Ϊ16QAM�źţ���3���Ϊ����
for i=1:length(Rx_serial_complex_symbols)
    for j=1:16
        metrics(j) = abs(complex_symbols(1,i) - complex_mapping(j,1));
    end
    [min_metric , decode_symble(i)] = min(metrics);
    %�������������׼16QAM�źűȣ��ҵ�����С�ģ������Ӧ�ָ��ɱ�׼��16QAM�ź�
end
b = bitget(decode_symble(1)-1,4:-1:1);
for i = 2:length(Rx_serial_complex_symbols)
bits =  bitget(decode_symble(i)-1,4:-1:1);
b = [b,bits];
end
demodu_bit_symble = b;
