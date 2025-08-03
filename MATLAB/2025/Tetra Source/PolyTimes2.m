function p = PolyTimes2(factor1, factor2, r)
  [rFactor1, rExP] = size(factor1);
  [rFactor2, cExP] = size(factor2);
  [rR, cR] = size(r);

  % Check array dimension
  if rFactor1 ~= rFactor2 || rR ~= rFactor1
    error('Error: Please check the dimentsion of input array of function PolyDiv.')
  end

  exP = zeros(rExP, cExP, rFactor2);

  for page=1:1:rFactor1
    exP(:, :, page) = factor1(page,:)' * factor2(page,:);
  end


  p = zeros(rFactor1, rExP+cExP-1);

  for page = 1:1:rFactor1
    for i = 2:1:rExP+cExP
      for j = 1:1:i-1
        if j <= rExP && i-j <= cExP
          p(page, i-1) = xor(exP(j, i-j, page), p(page, i-1));
        end
      end
    end
  end

  for page = 1:1:rFactor1
    p(page, rExP+cExP-cR:rExP+cExP-1) = xor(r(page, 1:cR), p(page, rExP+cExP-cR:rExP+cExP-1));
  end

end