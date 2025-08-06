function [] = CaldBfs(wordStream, dacRes)
[rWord, cWord] = size(wordStream);
fullScala = 2^dacRes;

PIndB = zeros(1, rWord);
for i=1:1:rWord
  for j=1:1:cWord
    PIndB(i, j) = 10*log(wordStream(i, j)/fullScala);
  end
end

Pavg = zeros(1, rWord);
for i=1:1:rWord
  Pavg(i) = sum(PIndB(i,:))/cWord;
  fprintf("The %d slot's average power is %.2fdBfs.\n", i, Pavg(i));
end

% The ratio of peak power and average power
PAR = max(PIndB)-Pavg;
fprintf("The max PAR is %.2fdB.\n", PAR);

end