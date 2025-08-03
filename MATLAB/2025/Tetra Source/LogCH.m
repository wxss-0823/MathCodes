function scrambledBits = LogCH(dataBits, mode, colourCodeE, intlvN)
  [~, cDataBits] = size(dataBits);
  switch mode
    case 'SCH/S'
      % Check data bits length
      if cDataBits ~= 60
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenSCH(dataBits, 11);
      fprintf('Generate signalling data %s successfully!\n', mode);
    case {'SCH/H','STCH'}
      % Check data bits length
      if cDataBits ~= 124
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenSCH(dataBits, 101);
      fprintf('Generate signalling data %s successfully!\n', mode);
    case 'SCH/F'
      % Check data bits length
      if cDataBits ~= 268
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenSCH(dataBits, 103);
      fprintf('Generate signalling data %s successfully!\n', mode);
    case 'TCH/7.2'
      % Check data bits length
      if cDataBits ~= 432
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenTCH(dataBits, colourCodeE);
      fprintf('Generate traffic data %s successfully!\n', mode);
    case 'TCH/4.8'
      % Check data bits length
      if cDataBits ~= 288
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenTCH(dataBits, colourCodeE, intlvN);
      fprintf('Generate traffic data %s successfully!\n', mode);
    case 'TCH/2.4'
      % Check data bits length
      if cDataBits ~= 144
        error('Error: Please check the data bits length(%d) which shall match the mode(%s).', cDataBits, mode);
      end
      scrambledBits = GenTCH(dataBits, colourCodeE, intlvN);
      fprintf('Generate traffic data %s successfully!\n', mode);
    otherwise
      error('Erros: Please check the mode name (%s)', mode);
  end

end