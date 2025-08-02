function [encodedBits, nEncodedBits] = LogicalChannel(dataBits, mode)
  nDataBits = length(dataBits);
  switch mode
    case 'SCH/S'
      % Check data bits length
      if nDataBits ~= 60
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
      
    case 'SCH/H'
      % Check data bits length
      if nDataBits ~= 124
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    case 'STCH'
      % Check data bits length
      if nDataBits ~= 124
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    case 'SCH/F'
      % Check data bits length
      if nDataBits ~= 268
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    case 'TCH/7.2'
      % Check data bits length
      if nDataBits ~= 432
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    case 'TCH/4.8'
      % Check data bits length
      if nDataBits ~= 288
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    case 'TCH/2.4'
      % Check data bits length
      if nDataBits ~= 144
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', nDataBits, mode);
      end
    otherwise
      error('Erros: Please check the mode name (%s)', mode);
  end

end