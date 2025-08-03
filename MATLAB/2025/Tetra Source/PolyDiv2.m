function [x, r] = PolyDiv2(divident, divisor)
  [rDivident, cDivident] = size(divident);
  [~, cDivisor] = size(divisor);

  x = zeros(rDivident, cDivident-cDivisor+1);
  r = zeros(rDivident, cDivisor-1);

  tmpDivident = divident;

  for d = 1:1:rDivident
    for i = 1:1:cDivident-cDivisor+1
      if tmpDivident(d, i) == 1
        x(d, i) = 1;
        for j = 1:1:cDivisor-1
          tmpDivident(d, i + j) = xor(tmpDivident(d, i+j), divisor(1, j+1));
          r(d, j) = tmpDivident(d, i + j);
        end
      else
        x(d, i) = 0;
        for j = 1:1:cDivisor-1
          r(d, j) = tmpDivident(d, i + j);
        end
      end
    end
  end
end