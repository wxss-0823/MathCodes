function modulatedSymbols = GenSymbol(burstBits, dacRate, dacRes)
  % The input is a useful part of burst
  [rBurstBits, cBurstBits] = size(burstBits);

  % Generate the differential phase
  symbolDiffPhase = DiffPhase(burstBits);

  % Generate the absolute phase
  % SN0 = 1;
  symbolAbsPhase = zeros(rBurstBits, cBurstBits);
  SN0PHASE = 0;
  for i=1:1:rBurstBits
    for j=1:1:cBurstBits
      if j-1 <=0
        symbolAbsPhase(i, j) = mod(symbolDiffPhase(i, j) + SN0PHASE);
      else
        symbolAbsPhase(i, j) = mod(symbolDiffPhase(i, j) + symbolDiffPhase(i, j-1), 2);
      end
    end
  end

  % Generate the digital modulated symbols

end