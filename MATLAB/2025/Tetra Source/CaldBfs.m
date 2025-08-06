function Pavg = CaldBfs(wordStream, dacRes)
  [rWords, ~] = size(wordStream);
  Pn = zeros(1, rWords);
  fullScala = 2^dacRes;

  % for i=1:1:rBits
  %   P(1, i) = sum(bitsStream.^2)/cBits;
  % end

  for i=1:1:rWords
    Pn(i) = 10*log((wordStream(i,:))/fullScala);
  end

  Pavg = sum(Pn)/rWords;
end