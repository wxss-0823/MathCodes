function type2Bits = BlockEncoder(type1Bits)
  % Mathematica Checked
  [rType1Bits, cType1Bits] = size(type1Bits);
  cType2Bits = cType1Bits + 16;
  
  % The type-1 bits are treated as the coefficients of the polynomial
  % MX*X^16
  % Descending sorting
  MX = zeros(rType1Bits, cType2Bits);
  for i = 1:1:rType1Bits
    for j=1:1:cType1Bits
      MX(i, j) = type1Bits(i, j);
    end
  end

  % The polynomial only related to K1(ntype1bits)
  % Descending sorting
  PK1 = zeros(1, cType2Bits);
  for i=1:1:16
    PK1(i) = 1;
  end

  % The generator polynomial GX of the code
  GX = zeros(1, 17);
  [GX(1), GX(5), GX(12), GX(17)] = deal(1);
  
  % The tail polynomial
  TX = ones(1, 16);

  % The resultant coefficient polynomial FX
  xorFX = zeros(rType1Bits, cType2Bits);
  for i = 1:1:rType1Bits
    xorFX(i, :) = xor(MX(i,:), PK1);
  end

  [~, modFX] = PolyDiv2(xorFX, GX);
  FX = zeros(rType1Bits, 16);

  for i = 1:1:rType1Bits
    FX(i, :) = xor(modFX(i,:), TX);
  end

  % The type-2 bits sequences
  type2Bits = zeros(rType1Bits, cType2Bits);
  for i = 1:1:rType1Bits
    type2Bits(i,:) = [type1Bits(i,:), FX(i,:)];
  end
end