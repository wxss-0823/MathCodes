function type4Bits = Interleaving(type3Bits, intlvN)
  % Mathematica Checked
  % intlvN represents a in block interleaving (K, a) or N in interleaving over N
  % blocks
  [rType3Bits, cType3Bits] = size(type3Bits);

  % The resultant of type-4 bits
  type4Bits = zeros(1, cType3Bits);
  if rType3Bits == 1
    for i=1:1:cType3Bits
      type4Bits(1+mod(intlvN*i, cType3Bits)) = type3Bits(i);
    end
  else
    % Interleaving nblocks type-3 blocks into (nblocks+intlvN-1) type-4
    % blocks
    % Generate transitional type-3 bits
    nqType3Bits = rType3Bits + intlvN - 1;
    qType3Bits = zeros(nqType3Bits, cType3Bits);
    for m=1:1:nqType3Bits
      for k=1:1:cType3Bits 
        j = floor((k-1)/(432/intlvN));
        i = mod((k-1), 432/intlvN);
        if m-j >= 1 && m-j <= rType3Bits
          qType3Bits(m, k) = type3Bits(m-j, j+1+(i*intlvN));
        else
          qType3Bits(m, k) = 0;
        end

      end
    end
    
    % The resultant of type-4 bits
    type4Bits = zeros(nqType3Bits, cType3Bits);
    for m = 1:1:nqType3Bits
      for k = 1:1:cType3Bits
        type4Bits(m, 1+mod(103*k, 432)) = qType3Bits(m, k);
      end
    end
  end
end