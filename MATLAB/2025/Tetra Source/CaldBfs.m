function P = CaldBfs(bitsStream)
  [rBits, cBits] = size(bitsStream);
  P = zeros(1, rBits);
  floorScala = min(bitsStream);
  fullScala = max(bitsStream);

  bitsStream = bitsStream - floorScala;

  % for i=1:1:rBits
  %   P(1, i) = sum(bitsStream.^2)/cBits;
  % end

  for i=1:1:rBits
    P(1, i) = sum(10*log(bitsStream/fullScala))/cBits;
  end

end