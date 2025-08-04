function dPhase = DiffPhase(bitStream)
  [rBitStream, cBitStream] = size(bitStream);
  dPhase = zeros(rBitStream, cBitStream/2);
  
  % Map 2 bits to one symbol phase  
  for i=1:1:rBitStream
    for j=1:2:cBitStream-1
      switch bitStream(i, j)*2 + bitStream(i, j+1)
        % [1, 1]
        case 3
          dPhase(i, (j+1)/2) = -3/4;
        % [0, 1]
        case 1
          dPhase(i, (j+1)/2) = 3/4;
        % [0, 0]
        case 0
          dPhase(i, (j+1)/2) = 1/4;
        % [1, 0]
        case 2
          dPhase(i, (j+1)/2) = -1/4;
      end
    end
  end
  
end