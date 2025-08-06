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
    levelQuantify(i, j) = ceil(consMt(i, j) / quantifyAccuracy(i) + 2^(-dacRes-2));
  end
end
levelQuantify = levelQuantify - min(levelQuantify);
% Eliminate 0
zerosPos = find(levelQuantify == 0);
levelQuantify(zerosPos) = levelQuantify(zerosPos) + 1;

% Print power info
% CaldBfs(levelQuantify, dacRes);

levelQuantify = dec2bin(levelQuantify, dacRes);

end