function [type4Bits, bm4] = Interleaving(type3Bits, bm3, nBlock, intlvN)
  % intlvN represents a in block interleaving (K, a) or N in interleaving over N
  % blocks
  % Select the number of blocks of interleaving
  if ~isnumeric(nBlock)
    error('Error: The wrong data type of nblock');
  end

  % Check type-4 bits length & bits format
  [rType3Bits, cType3Bits] = size(type3Bits);

  if rType3Bits ~= nBlock
    error('Error: The type-3 bits array do not contain nblock(%d)', nBlock);

  end
  
  if cType3Bits ~= bm3
    error('Error: The type-3 bits length is not equal to bm3(%d)', bm3);
  end

  switch nBlock
    case 1
      modeFlag = 0;
    otherwise
      modeFlag = 1;
  end

  % The resultant of type-4 bits
  tmpType4Bits = zeros(1, cType3Bits);
  if ~modeFlag
    for i=1:1:cType3Bits
      tmpType4Bits(1+mod(intlvN*i, cType3Bits)) = type3Bits(i);
    end
  else
    % Interleaving nblocks type-3 blocks into (nblocks+intlvN-1) type-4
    % blocks
    if cType3Bits ~= 432
      error('Error: 432 type-3 bits each block is required in interleaving over N blocks.');
    end

    % Generate transitional type3bits
    noType3Bits = nBlock + intlvN - 1;
    oType3Bits = zeros(noType3Bits, cType3Bits);
    
    for m=1:1:noType3Bits
      for k=1:1:cType3Bits
        j = floor((k-1)/(432/intlvN));
        i = mod((k-1), 432/intlvN);
        oType3Bits(k) = type3Bits(m-j, j+1+(i*intlvN));
      end
    end
    
    % The resultant of type-4 bits
    tmpType4Bits = zeros(noType3Bits, cType3Bits);
    for m = 1:1:noType3Bits
      for k = 1:1:cType3Bits
        tmpType4Bits(m, 1+mod(103*k, 432)) = oType3Bits(m, k);
      end
    end
  end

  type4Bits = tmpType4Bits;
  bm4 = bm3;

end