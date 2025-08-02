function [type3bits, bm3] = Puncture(Vk, Vkn, rate)
  % Check type-3 bits length 
  nVk = length(Vk);

  if nVk ~= Vkn
    error('Error: The type-3 bits length is not equal to Vkn(%d)', Vkn);
  end

  % Initialize parameters
  P = zeros(1, 6);
  bm3index = 1:1:1/(rate*4) * nVk;
  % Select the rate of puncturing scheme of RCPC code
  switch rate
    case 2/3
      P(1:3) = [1, 2, 5];
      tindex = 3;
      iindex = bm3index;
      modeFlag = 1;
    case 292/432
      P(1:3) = [1, 2, 5];
      tindex = 3;
      iindex = bm3index + floor((bm3index - 1)/65);
      modeFlag = 2;
    case 148/432
      P(1:6) = [1, 2, 3, 5, 6, 7];
      tindex = 6;
      iindex = bm3index + floor((bm3index - 1)/35);
      modeFlag = 3;
    otherwise
      error('Error: The wrong rate is inptut.')
  end

  % Check type-3 bits length
  if modeFlag == 2 & length(bm3index) ~= 432
    waring('Warning: Please check the Vk length(%d) or the rate(%d) of puncturing', nVk, rate);
  elseif modeFlag == 3 & length(bm3index) ~= 432
    waring('Warning: Please check the Vk length(%d) or the rate(%d) of puncturing', nVk, rate);
  end

  % Puncturing of the mother code
  [~,tmpbm3] = size(bm3index);
  tmpindex = floor((iindex-1)/tindex);
  tmptype3bits = zeros(1, tmpbm3);
  
  for i=1:1:tmpbm3
    tmptype3bits(i) = V(8*tmpindex) + P(iindex(i)-tindex*tmpindex);
  end

  type3bits = tmptype3bits;
  bm3 = tmpbm3;

end