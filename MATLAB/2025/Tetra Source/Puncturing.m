function [type3Bits, bm3] = Puncturing(Vk, Vkn, rate)
  % Check type-3 bits length 
  nVk = length(Vk);

  if nVk ~= Vkn
    error('Error: The type-3 bits length is not equal to Vkn(%d)', Vkn);
  end

  % Initialize parameters
  P = zeros(1, 6);
  bm3Index = 1:1:1/(rate*4) * nVk;
  % Select the rate of puncturing scheme of RCPC code
  switch rate
    case 2/3
      P(1:3) = [1, 2, 5];
      tIndex = 3;
      iIndex = bm3Index;
      modeFlag = 1;
    case 292/432
      P(1:3) = [1, 2, 5];
      tIndex = 3;
      iIndex = bm3Index + floor((bm3Index - 1)/65);
      modeFlag = 2;
    case 148/432
      P(1:6) = [1, 2, 3, 5, 6, 7];
      tIndex = 6;
      iIndex = bm3Index + floor((bm3Index - 1)/35);
      modeFlag = 3;
    otherwise
      error('Error: The wrong rate is inptut.')
  end

  % Check type-3 bits length
  if modeFlag == 2 & length(bm3Index) ~= 432
    waring('Warning: Please check the Vk length(%d) or the rate(%d) of puncturing', nVk, rate);
  elseif modeFlag == 3 & length(bm3Index) ~= 432
    waring('Warning: Please check the Vk length(%d) or the rate(%d) of puncturing', nVk, rate);
  end

  % Puncturing of the mother code
  [~,tmpBm3] = size(bm3Index);
  tmpIndex = floor((iIndex-1)/tIndex);
  tmpType3Bits = zeros(1, tmpBm3);
  
  for i=1:1:tmpBm3
    tmpType3Bits(i) = V(8*tmpIndex) + P(iIndex(i)-tIndex*tmpIndex);
  end

  type3Bits = tmpType3Bits;
  bm3 = tmpBm3;

end