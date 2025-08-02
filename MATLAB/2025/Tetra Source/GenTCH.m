function [trafficData, nTrafficData] = GenTCH(dataBits, rate, intlvN, colourCodeE)
  % Definition of colour code
  % e = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0  ];
  % Interleaving factor N
  % N = 1

  % Select traffic rate
  switch rate
    case 7.2
      trafficData = Scramble(dataBits, 432, e);
      nTrafficData = length(trafficData);

      if nTrafficData ~= 432
        error('Error: Encode fail with a wrong traffic data length(%d)', nTrafficData);
      end

      fprintf('Generate traffic data TCH/7.2 successfully!')
    case 4.8
      [rDataBits, ~] = size(dataBits);

      % Check the number of N over blocks
      if intlvN ~= 1 && intlvN ~= 4 && intlvN ~= 8
        error('Error: The wrong number(%d) of blocks of data bits.', rDataBits);
      end

      % Type-2 bits
      tailBits = zeros(rDataBits, 4);
      type2Bits = [dataBits, tailBits];
      [rType2Bits, cType2Bits] = size(type2Bits);
      % Check matrix dimension
      if cType2Bits == 292 && rType2Bits == rDataBits
        fprintf('Generate type-2 bits successfully!')
      end

      % Type-3 bits
      type3Bits = zeros(rDataBits, 432);
      for i = 1:1:rDataBits
        [RCPCBits, nRCPCBits] = RCPC(type2Bits(i, :), cType2Bits);
        [type3Bits(i, :), ] = Puncture(RCPCBits, nRCPCBits, 292/432);
      end
      [rType3Bits, cType3Bits] = size(type3Bits);
      % Check matrix dimension
      if cType3Bits == 432 && rType3Bits == rDataBits
        fprintf('Generate type-3 bits successfully!')
      end

      % Type-4 bits
      intlvBlockN = rDataBits + intlvN - 1;
      type4Bits = zeros(intlvBlockN, 432);
      for i = 1:1:rDataBits
        type4Bits(i, :) = Interleaving(type3Bits, cType3Bits, rDataBits, intlvN);
      end
      [rType4Bits, cType4Bits] = size(type4Bits);
      % Check matrix dimension
      if cType4Bits == 432 && rType4Bits == intlvBlockN
        fprintf('Generate type-4 bits successfully!')
      end
      
      % Type-5 bits
      type5Bits = zeros(intlvBlockN, 432);
      

    



      trafficData = Scramble(Interleaving);
    case 2.4

  end
end