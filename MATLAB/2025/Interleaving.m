function [type4bits, bm4] = Interleaving(type3bits, bm3, nblock, intlvN)
  % intlvN represents a in block interleaving (K, a) or N in interleaving over N
  % blocks
  % Select the number of blocks of interleaving
  if ~isnumeric(nblock)
    error('Error: The wrong data type of nblock');
  end

  % Check type-4 bits length & bits format
  [rowtype3bits, ntype3bits] = size(type3bits);

  if rowtype3bits ~= nblock
    error('Error: The type-3 bits array do not contain nblock(%d)', nblock);

  end
  
  if ntype3bits ~= bm3
    error('Error: The type-3 bits length is not equal to bm3(%d)', bm3);
  end

  switch nblock
    case 1
      modeFlag = 0;
    otherwise
      modeFlag = 1;
  end

  % The resultant of type-4 bits
  tmptype4bits = zeros(1, ntype3bits);
  if ~modeFlag
    for i=1:1:ntype3bits
      tmptype4bits(1+mod(intlvN*i, ntype3bits)) = type3bits(i);
    end
  else
    % Interleaving nblocks type-3 blocks into (nblocks+intlvN-1) type-4
    % blocks
    if ntype3bits ~= 432
      error('Error: 432 type-3 bits each block is required in interleaving over N blocks.');
    end

    % Generate transitional type3bits
    notype3bits = nblocks + intlvN - 1;
    otype3bits = zeros(notype3bits, ntype3bits);
    
    for m=1:1:notype3bits
      for k=1:1:ntype3bits
        j = floor((k-1)/(432/intlvN));
        i = mod((k-1), 432/intlvN);
        otype3bits(k) = type3bits(m-j, j+1+(i*intlvN));
      end
    end
    
    % The resultant of type-4 bits
    tmptype4bits = zeros(notype3bits, ntype3bits);
    for m = 1:1:notype3bits
      for k = 1:1:ntype3bits
        tmptype4bits(m, 1+mod(103*k, 432)) = otype3bits(m, k);
      end
    end
  end

  type4bits = tmptype4bits;
  bm4 = bm3;

end