function type3Bits = Puncturing(Vk, rate)
  % Mathmatica Checked
  [rVk, cVk] = size(Vk);

  % Initialize parameters
  P = zeros(1, 6);
  bm3Index = 1:1:1/(rate*4) * cVk;
  % Select the rate of puncturing scheme of RCPC code
  switch rate
    case 2/3
      P(1:3) = [1, 2, 5];
      tIndex = 3;
      iIndex = bm3Index;
    case 292/432
      P(1:3) = [1, 2, 5];
      tIndex = 3;
      iIndex = bm3Index + floor((bm3Index - 1)/65);
    case 148/432
      P(1:6) = [1, 2, 3, 5, 6, 7];
      tIndex = 6;
      iIndex = bm3Index + floor((bm3Index - 1)/35);
    otherwise
      error('Error: The wrong rate is inptut.')
  end
  
  % Puncturing of the mother code
  [~,bm3] = size(bm3Index);
  tmpIndex = floor((iIndex-1)/tIndex);
  type3Bits = zeros(rVk, bm3);
  for i = 1:1:rVk
    for j=1:1:bm3
      type3Bits(i, j) = Vk(i, 8*tmpIndex(j) + P(iIndex(j)-tIndex*tmpIndex(j)));
    end
  end
end