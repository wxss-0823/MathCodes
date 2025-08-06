function levelQuantify = Quantify(consMt, dacRes)
[rConsMt, cConsMt] = size(consMt);

% Quantify
quantifyAccuracy = zeros(1, rConsMt);
for i=1:1:rConsMt
  quantifyAccuracy(i) = (max(consMt(i,:))-min(consMt(i,:)))/(2^dacRes-1);
end
levelQuantify = zeros(rConsMt, cConsMt);
for i=1:1:rConsMt
  for j=1:1:cConsMt
    levelQuantify(i, j) = ceil(consMt(i, j) / quantifyAccuracy(i));
  end
end
levelQuantify = levelQuantify - min(levelQuantify);
levelQuantify = dec2bin(levelQuantify, dacRes);

end