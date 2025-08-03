function trafficData = GenTCH(dataBits, colourCodeE, intlvN)
  % Definition of colour code
  % e = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0  ];
  % Interleaving factor N
  % N = 1

  % Check the dimension & content of colour code
  if length(colourCodeE) ~= 30
    error('Error: The length of colour code shall be 30.\n')
  else
    for i=1:1:30
      if colourCodeE(i) > 1
        error('Error: The content of colour code shall be modulo 2.')
      end
    end
  end

  [rDataBits, cDataBits] = size(dataBits);
  nType5Bits = 432;

  if cDataBits ~= nType5Bits
    tailBits = zeros(rDataBits, 4);
    bitRate = (cDataBits+4)/432;
    intlvBlockN = rDataBits + intlvN - 1;
  end

  % Select traffic rate
  switch cDataBits
    case 432
      trafficData = Scrambling(dataBits, colourCodeE);
      % Check matrix dimension
      CheckArrayD(trafficData, rDataBits, nType5Bits, 5);
    case {288, 144}
      % Check the number of N over blocks
      if intlvN ~= 1 && intlvN ~= 4 && intlvN ~= 8
        error('Error: The wrong number(%d) of blocks of data bits.', rDataBits);
      end

      % Type-2 bits
      type2Bits = [dataBits, tailBits];
      nType2Bits = cDataBits+4;
      % Check matrix dimension
      CheckArrayD(type2Bits, rDataBits, nType2Bits, 2);

      % Type-3 bits
      type3Bits = RCPC(type2Bits, bitRate);
      nType3Bits = nType2Bits/bitRate;
      % Check matrix dimension
      CheckArrayD(type3Bits, rDataBits, nType3Bits, 3);

      % Type-4 bits
      type4Bits = Interleaving(type3Bits, intlvN);
      nType4Bits = nType3Bits;
      % Check matrix dimension
      CheckArrayD(type4Bits, intlvBlockN, nType4Bits, 4);
      
      % Type-5 bits
      type5Bits = Scrambling(type4Bits, colourCodeE);
      nType5Bits = nType4Bits;
      % Check matrix dimension
      CheckArrayD(type5Bits, intlvBlockN, nType5Bits, 5);
      
      trafficData = type5Bits;

    otherwise
      error('Error: Please check the rate(%.1d)', cDataBits);
  end

end