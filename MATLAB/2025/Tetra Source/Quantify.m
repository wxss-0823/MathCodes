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

% Let every quantified num be positive
for i=1:1:rConsMt
  levelQuantify(i,:) = levelQuantify(i,:) - min(levelQuantify(i,:));
end

% Eliminate 0
[rZero, cZero] = find(levelQuantify == 0);
if ~(isempty(rZero))
  for i=1:1:length(rZero)
    levelQuantify(rZero(i), cZero(i)) = levelQuantify(rZero(i), cZero(i)) + 1;
  end
end

% Print power info
% CaldBfs(levelQuantify, dacRes);

levelQuantify = dec2hex(levelQuantify, dacRes/4);

end