function signallingData = GenSCH(dataBits, intlvA)
  % Parameter Initialize
  [rDataBits, cDataBits] = size(dataBits);
  bitRate = 2/3;
  colourCodeE = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ];
  tailBits = zeros(rDataBits, 4);

  % Check the factor A 
  if intlvA ~= 11 && intlvA ~= 101 && intlvA ~= 103
    error('Error: The wrong factor(%d) of block interleaving .', intlvA);
  end

  % Check the correspondence
  switch intlvA
    case 11
      if cDataBits ~= 60
        error('Error: Please check the correspondence of data bit and intleaving factor A.');
      end
    case 101
      if cDataBits ~= 124
        error('Error: Please check the correspondence of data bit and intleaving factor A.');
      end
    case 103
      if cDataBits ~= 268
        error('Error: Please check the correspondence of data bit and intleaving factor A.');
      end
  end

  % Type-2 bits
  type2Bits = [BlockEncoder(dataBits), tailBits];
  nType2Bits = cDataBits+20;
  % Check matrix dimension
  CheckArrayD(type2Bits, rDataBits, nType2Bits, 2);

  % Type-3 bits
  type3Bits = RCPC(type2Bits, bitRate);
  nType3Bits = nType2Bits / bitRate;
  % Check matrix dimension
  CheckArrayD(type3Bits, rDataBits, nType3Bits, 3);

  % Type-4 bits
  type4Bits = zeros(rDataBits, nType3Bits);
  for i=1:1:rDataBits
    type4Bits(i,:) = Interleaving(type3Bits(i,:), intlvA);
  end
  nType4Bits = nType3Bits;
  % Check matrix dimension
  CheckArrayD(type4Bits, rDataBits, nType4Bits, 4);

  % Type-5 bits
  type5Bits = Scrambling(type4Bits, colourCodeE);
  nType5Bits = nType4Bits;
  % Check matrix dimension
  CheckArrayD(type5Bits, rDataBits, nType5Bits, 5);

  signallingData = type5Bits;


end