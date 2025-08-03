function burstBits = GenDSB(syncBits, halfSlotBits)
  [rSyncBits, cSyncBits] = size(syncBits);
  [rHalfSlotBits, ~] = size(halfSlotBits);

  % Check input data dimension
  CheckArrayD(syncBits, rHalfSlotBits, 120, 'sychronizaiton bits');
  CheckArrayD(halfSlotBits, rSyncBits, 216, 'half slot bits');

  cBurstBits = 470;
  rBurstBits = rSyncBits;
  burstBits = zeros(rBurstBits, cBurstBits);

  % The definiton of frequency correction
  freqCrt = [zeros(1, 8), ones(1, 64), zeros(1, 8)];

  % The definition of preamble code P3
  P3 = [0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1];

  % The definition of synchronization traning sequence
  syncSeq = [1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, ...
             1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0 ,1, 1, 1];

  % The definition of tail bits
  tailBits = [0, 0];

  % Constant Phase
  % P3PHASE = 0;
  % FREQCRTPHASE = 0;
  SYNCSEQPHASE = 0.25;

  % Synchronization bits phase
  syncBitsPhase = zeros(1, rBurstBits);
  syncBitsDiffPhase = DiffPhase(syncBits);
  for i=1:1:rBurstBits
    for j=1:1:cSyncBits/2
      syncBitsPhase(i) = syncBitsDiffPhase(i, j) + syncBitsPhase(i);
    end
    syncBitsPhase(i) = mod(syncBitsPhase(i), 2);
  end

  % Generate direct mode synchronization burst
  phaseAdj = zeros(1, rBurstBits);
  for i = 1:1:rBurstBits
      phaseAdj(i) = mod(-(syncBitsPhase(i) + SYNCSEQPHASE), 2);
      burstBits(i, :) = [P3, -1, -1, freqCrt, syncBits(i,:), syncSeq, halfSlotBits(i,:), tailBits];
  end
 

  % Calculate the phase adjustment
  phaseAdjBits = PhaseAdjust(phaseAdj);

  % The resultant of burst bits
  for i = 1:1:rBurstBits
    burstBits(i, 13:14) = phaseAdjBits(1, 2*i-1:2*i);
  end
  CheckArrayD(burstBits, rBurstBits, cBurstBits, 'direct mode synchronizaiton burst');

end