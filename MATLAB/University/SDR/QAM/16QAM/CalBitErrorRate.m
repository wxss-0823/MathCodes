function error_ratio= CalBitErrorRate(input_data,decode_data)

% ����������
% ��ȡ���ݳ���
data_len = length(input_data);
% ��ʼ��������
count = 0;

for k = 1:data_len
    % ����������
    if input_data(k)~=decode_data(k)
        % ��������1
        count = count +1;
    end
end

error_ratio = count/data_len;

    