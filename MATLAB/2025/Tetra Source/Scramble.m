function [type5bits, bm5] = Scramble(type4bits, bm4, colourcodeE)
  % Check type-4 bits length
  ntype4bits = length(type4bits);
  
  if ntype4bits ~= bm4
    error('Error: The length of type-4 bits is not equal to bm4(%d)', bm4);
  end

  % Connection polynomial
  cx = [1, 1, 1, 0, 1, 1, 0, 1, ...
        1, 0, 1, 1, 1, 0, 0, 0, ...
        1, 0, 0, 0, 0, 0, 1, 1, ...
        0, 0, 1, 0, 0, 0, 0, 0, 1];

  % Colour code
  % e = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ...
  %      1, 0, 1, 0, 1, 0, 1, 0, 1, 0, ];

  % Scrambling sequence
  npk = zeros(1, 32);
  [npk(32), npk(31)] = deal(1);
  for k = 1:1:30
    npk(k) = colourcodeE(k);
  end

  pk = zeros(1, ntype4bits);
  for k = 1:1:ntype4bits
    for j = 1:1:32
      if k-j > 0
        pk(k) = cx(j)*pk(k-j) + pk(k);
      else
        pk(k) = cx(j)*npk(j-k+1) + pk(k);
      end
    end
  end

  % The resultant of type-5 bits
  tmptype5bits = zeros(1, ntype4bits);
  for k = 1:1:ntype4bits
    tmptype5bits(k) = type4bits(k) + pk(k);
  end
  
  type5bits = tmptype5bits;
  bm5 = ntype4bits;
end