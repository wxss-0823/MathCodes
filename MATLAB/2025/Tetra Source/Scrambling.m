function type5bits = Scrambling(type4Bits, colourCodeE)
  [rType4Bits, ctype4Bits] = size(type4Bits);
  
  % Connection polynomial
  cx = [1, 1, 1, 0, 1, 1, 0, 1, ...
        1, 0, 1, 1, 1, 0, 0, 0, ...
        1, 0, 0, 0, 0, 0, 1, 1, ...
        0, 0, 1, 0, 0, 0, 0, 0, 1];

  % Scrambling sequence
  npk = zeros(1, 32);
  [npk(32), npk(31)] = deal(1);
  for k = 1:1:30
    npk(k) = colourCodeE(k);
  end
  pk = zeros(1, ctype4Bits);
  for k = 1:1:ctype4Bits
    for j = 1:1:32
      if k-j > 0
        pk(k) = xor(cx(j)*pk(k-j), pk(k));
      else
        pk(k) = xor(cx(j)*npk(j-k+1), pk(k));
      end
    end
  end

  % The resultant of type-5 bits
  tmpType5Bits = zeros(1, ctype4Bits);
  for i = 1:1:rType4Bits
    for k = 1:1:ctype4Bits
      tmpType5Bits(i, k) = xor(type4Bits(i, k), pk(k));
    end
  end
  type5bits = tmpType5Bits;
  
end