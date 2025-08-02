function [type2bits, bm2] = BlockEncoder(type1bits, bm1)
  % Check slot bits length
  if nargin == 1
      bm1 = 510;
  end
  
  ntype1bits = length(type1bits);
  ntype2bits = ntype1bits + 16;
  
  % if ntype1bits ~= bm1
  %    error('error! The length of slot bits is not equal to required bm(%d).', bm1);
  % end

  % The type-1 bits are treated as the coefficients of the polynomial
  % MX*X^16
  MX = zeros(1, ntype2bits);
  for i=1:1:ntype1bits
    MX(ntype2bits - i) = type1bits(i);
  end

  % The polynomial only related to K1(ntype1bits)
  PK1 = zeros(1, ntype2bits);
  for i=1:1:16
    PK1(i + ntype1bits - 1) = 1;
  end

  % The generator polynomial GX of the code
  GX = zeros(1, 16);
  [GX(16), GX(12), GX(5), GX(1)] = deal(1);
  
  % The tail polynomial
  TX = ones(1, 16);

  % The resultant coefficient polynomial FX
  FX = zeros(1, 16);
  [~, FX] = polydiv(xor(MX, PK1), GX);

  % The type-2 bits sequences
  type2bits = FX;
  bm2 = ntype1bits;

end