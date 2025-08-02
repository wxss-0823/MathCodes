function [Vk, Vkn] = RCPC(type2bits, bm2)
  % Check type-2 bits length

  ntype2bits = length(type2bits);

  if ntype2bits ~= bm2
    error('Error: The length of type-2 bits is not equal to bm2(%d)', bm2);
  end


  % 4 generator polynomials of mother code
  GD = [1, 1, 0, 0, 1; ...
        1, 0, 1, 1, 1; ...
        1, 1, 1, 0, 1; ...
        1, 1, 0, 1, 1];

  % The 4 bits mother code output V(4(k-1)+i) is
  tmpVk = zeros(1, 4*ntype2bits);

  for k=1:1:ntype2bits
    for i=1:1:4
      for j=1:1:5
        if k-j <= 0
          continue;
        else
          tmpVk(4*(k-1)+i) = tmpVk(4*(k-1)+i) + type2bits(k-j)*GD(i, j);
        end
      end
    end
  end

% RCPC code of rate 1/4
Vk = tmpVk;
Vkn = length(tmpVk);
end