function type3Bits = RCPC(type2Bits, rate)
  % Mathematica Checked
  [rType2Bits, cType2Bits] = size(type2Bits);

  % 4 generator polynomials of mother code
  GD = [1, 1, 0, 0, 1; ...
        1, 0, 1, 1, 1; ...
        1, 1, 1, 0, 1; ...
        1, 1, 0, 1, 1];

  % RCPC code of rate 1/4
  % The 4 bits mother code output V(4(k-1)+i) is
  Vk = zeros(rType2Bits, 4*cType2Bits);
  for rIndex = 1:1:rType2Bits
    for k=1:1:cType2Bits
      for i=1:1:4
        for j=1:1:5
          if k-j < 0
            continue;
          else
            Vk(rIndex, 4*(k-1)+i) = xor(Vk(rIndex, 4*(k-1)+i), type2Bits(rIndex, k-j+1)*GD(i, j));
          end
        end
      end
    end
  end

  type3Bits = Puncturing(Vk, rate);
end