function [trafficData, nTrafficData] = GenTCH(dataBits, rate)
  % Definition of colour code
  e = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
       1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
       1, 0, 1, 0, 1, 0, 1, 0, 1, 0  ];

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
      [rDataBits, cDataBits] = size(dataBits);

      % Check the number of blocks
      if rDataBits ~= 1 & rDataBits ~= 4 & rDataBits ~= 8
        error('Error: The wrong number(%d) of blocks of data bits.', rDataBits);
      end


      tailBits = zeros(rDataBits, 4);
      type2bits = [dataBits, tailBits];
      type3bits = zeros(rDataBits, 432);
      for i = 1:1:rDataBits
        type3bits(i,:) = 
      trafficData = Scramble(Interleaving);
    case 2.4

  end
end