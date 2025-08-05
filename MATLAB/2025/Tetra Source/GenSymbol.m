function [dacQuantifyBits, fn] = GenSymbol(burstBits, f0, bw, dacRate, dacRes)
  % The input is a useful part of 470 bits of burst
  RB = 36e3;
  carrierInterval = 25e3;
  [rBurstBits, cBurstBits] = size(burstBits);
  nDACSample = dacRate/RB;
  quantifyAccuracy = 2^dacRes;
  nSymbols = cBurstBits/2;

  % Generate the 235 differential phase
  SkDiffPhase = DiffPhase(burstBits);

  % Generate the absolute phase per Sk
  % SN0 = 1;
  SkPhase = zeros(rBurstBits, cBurstBits);
  SN0PHASE = 0;
  for i=1:1:rBurstBits
    for j=1:1:cBurstBits
      if j-1 <=0
        SkPhase(i, j) = mod(SkDiffPhase(i, j) + SN0PHASE, 2) * pi;
      else
        SkPhase(i, j) = mod(SkDiffPhase(i, j) + SkDiffPhase(i, j-1), 2) * pi;
      end
    end
  end

  % Generate the symbol Sk
  Sk = exp(1i*SkPhase);

  % Generate the digital modulated symbols
  % A physical chanel is defined as one radio frequency carrierDM-MS and
  % two timeslot per frame
  nCarrier = bw/carrierInterval;
  fc = zeros(1, nCarrier);
  for i = 1:1:nCarrier
    fc(i) = f0 + (i-1) * carrierInterval;
  end

  % Generate root-raised cosine filter
  nSys = cBurstBits/2;
  normlize = 1;
  nSample = nDACSample;
  rollFactor = 0.35;
  rctFilt = comm.RaisedCosineTransmitFilter( ...
    "FilterSpanInSymbols", nSys, ...
    "Gain", normlize, ...
    "OutputSamplesPerSymbol",nSample, ...
    "RolloffFactor", rollFactor, ...
    "Shape", "Square root");

  % Baseband molding filtering
  symbolOffset = nSys*nSample/2 + 1;
  st = zeros(rBurstBits, nSymbols*nSample);
  for i = 1:1:rBurstBits
    st(i,:) = rctFilt((Sk(i,:))');
  end

  % Correct for propagation delay by removing filter transients
  st = [st(symbolOffset:end,:);st(1:symbolOffset-1,:)];
  st = st';

  % Generate the carrier frequency samples
  t = 1:1/dacRate:nSymbols*nSample/dacRate;
  fct = zeros(rBurstBits, nSymbols*nSample);
  for i=1:1:rBurstBits
    fct(i,:) = exp(1i*(2*pi*fc(ceil(i/2))*t));
  end

  % Generate modulated digital signal
  Mt = real(fct .* st);


  







end