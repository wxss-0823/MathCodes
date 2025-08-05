function [Mt, dacQuantifyBits, fn] = Modulator(burstBits, f0, dacRate, dacRes)
  % The input is a useful part of 470 bits of burst
  RB = 18e3;
  bw = 10e6;
  carrierInterval = 25e3;
  [rBurstBits, cBurstBits] = size(burstBits);
  nDACSample = dacRate/RB/dacRes;
  nSymbols = cBurstBits/2;

  % Generate the 235 differential phase
  SkDiffPhase = DiffPhase(burstBits);

  % Generate the absolute phase per Sk
  % SN0 = 1;
  SkPhase = zeros(rBurstBits, nSymbols);
  SN0PHASE = 0;
  for i=1:1:rBurstBits
    for j=1:1:nSymbols
      if j == 1
        SkPhase(i, j) = mod(SkDiffPhase(i, j) + SN0PHASE, 2);
      else
        SkPhase(i, j) = mod(SkDiffPhase(i, j) + SkPhase(i, j-1), 2);
      end
    end
  end

  % Generate the symbol Sk
  Sk = exp(1i*SkPhase*pi);

  % Generate the digital modulated symbols
  % A physical chanel is defined as one radio frequency carrierDM-MS and
  % two timeslot per frame
  nCarrier = bw/carrierInterval;
  fc = zeros(1, nCarrier);
  for i = 1:1:2
    fc(i) = f0 + (ceil(i/2)-1) * carrierInterval;
  end
  fn = max(fc);

  % Generate root-raised cosine filter
  nSys = nSymbols*2;
  nSample = nDACSample;
  rollFactor = 0.35;
  rctFilt = comm.RaisedCosineTransmitFilter( ...
    "FilterSpanInSymbols", nSys, ...
    "OutputSamplesPerSymbol",nSample, ...
    "RolloffFactor", rollFactor, ...
    "Shape", "Square root");
  b = coeffs(rctFilt);
  % rctFilt.Gain = 1/max(b.Numerator);
  rctFilt.Gain = 1/50;
  

  % Baseband molding filtering
  symbolOffset = nSys*nSample/2 + 1;
  tmpSt = zeros(nSymbols*nSample*2, rBurstBits);
  for i = 1:1:rBurstBits
    tmpSt(:,i) = rctFilt([(Sk(i,:))';zeros(nSys/2, 1)]);
  end

  % Correct for propagation delay by removing filter transients
  st = tmpSt(symbolOffset:end,:);
  st = st';

  % Generate the carrier frequency samples
  ts = 1/dacRate;
  fct = zeros(rBurstBits, nSymbols*nSample);
  for i=1:1:rBurstBits
    for j=1:1:nSymbols*nSample
      fct(i,j) = exp(1i*(2*pi*fc(i)*j*ts));
    end
  end

  % Generate modulated digital signal
  Mt = real(fct .* st);



   quantifyAccuracy = 2^dacRes;

  







end