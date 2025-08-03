function [] = CheckArrayD(array, row, col, type)
  [rArray, cArray] = size(array);
  if isnumeric(type)
    if rArray ~= row || cArray ~= ceil(col)
      error('Error: Failed to generate tyep-%d bits.', type);
    else
      fprintf('Generate type-%d bits successfully!\n', type);
    end
  elseif ischar(type)
    if rArray ~= row || cArray ~= ceil(col)
      error('Error: Please check the dimension of %s data[%d, %d].', type, row, col);
    else
      fprintf('Generate %s successfully!\n', type);
    end
  else
    error('Error: Please check the type(%s) of intput data.', class(type));
  end

end