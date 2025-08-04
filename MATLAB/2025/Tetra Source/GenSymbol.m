function dacQuantifyBits = GenSymbol(burstBits, f0, bw, dacRate, dacRes)
  % The input is a useful part of burst
  [rBurstBits, cBurstBits] = size(burstBits);

  % Generate the differential phase
  symbolDiffPhase = DiffPhase(burstBits);

  % Generate the absolute phase
  % SN0 = 1;
  Sk = zeros(rBurstBits, cBurstBits);
  SN0PHASE = 0;
  for i=1:1:rBurstBits
    for j=1:1:cBurstBits
      if j-1 <=0
        Sk(i, j) = mod(symbolDiffPhase(i, j) + SN0PHASE);
      else
        Sk(i, j) = mod(symbolDiffPhase(i, j) + symbolDiffPhase(i, j-1), 2);
      end
    end
  end

  % Generate the digital modulated symbols
  % A physical chanel is defined as one radio frequency carrierDM-MS and
  % two timeslot per frame
  carrierInterval = 25e3;
  RB = 36e3;
  nCarrier = bw/carrierInterval;
  fc = zeros(1, carrierInterval);
  for i = 1:1:nCarrier
    fc(i) = f0 + (i-1) * carrierInterval;
  end

  nDigitalSymbolBits = dacRate/RB;
  quantifyAccuracy = 2^dacRes;
  t = 1:1/RB:dacRate;
  analogSymbol = zeros(cBurstBits*nDigitalSymbolBits, rBurstBits);
  digitalSymbol = zeros(cBurstBits*nDigitalSymbolBits, rBurstBits);

  for i = 1:1:rBurstBits
    for j = 1:1:cBurstBits
    analogSymbol(i,:) = [analogSymbol(i,:), cos(2*pi*fc(ceil(i/2))*t + Sk(i,j)*pi)];
    end
    digitalSymbol(i,:) = floor(analogSymbol(i,:) * quantifyAccuracy);
  end


end