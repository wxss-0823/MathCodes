function [] = CaldBfs(wordStream, dacRes)
[rWord, cWord] = size(wordStream);

% Caculate the full scala of DAC
fullScala = 2^dacRes;

% Convert to dBfs
PIndB = zeros(1, rWord);
for i=1:1:rWord
  for j=1:1:cWord
    PIndB(i, j) = 10*log10(wordStream(i, j)/fullScala);
  end
end

% Calculate the average power
Pavg = zeros(1, rWord);
for i=1:1:rWord
  Pavg(i) = sum(PIndB(i,:))/cWord;
  fprintf("The %d slot's average power is %.2fdBfs.\n", i, Pavg(i));
end

% The ratio of peak power and average power
PAR = zeros(1, rWord);
for i=1:1:rWord
  PAR(i) = max(PIndB(i,:))-Pavg(i);
  fprintf("The PAR %d is %.2fdB.\n", i, PAR(i));
end

end