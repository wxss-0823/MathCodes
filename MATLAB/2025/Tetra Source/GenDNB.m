function burstBits = GenDNB(scrambledBits, preamble)
  [rScrambledBits, cScrambledBits] = size(scrambledBits);
  cBurstBits = 470;
  burstBits = zeros(rScrambledBits, cBurstBits);

  % Slice scrambled bits to 2 blocks
  block1 = scrambledBits(:, 1:cScrambledBits/2);
  block2 = scrambledBits(:, cScrambledBits/2+1:cScrambledBits);
  
  % The definition of preamble code P1, P2
  P1 = [0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1];
  P2 = [1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1];

  % The definition of normal traning sequence
  normSeq1 = [1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0];
  normSeq2 = [0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0 ,0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0];

  % The definition of tail bits
  tailBits = [0, 0];
  
  % Constant Phase 
  % P1PHASE = -1;
  % P2PHASE = 1/2;
  NORMSEQ1PAHSE = 1/4;
  NORMSEQ2PAHSE = -1/4;

  % Check preamble dimension
  CheckArrayD(preamble, 1, rScrambledBits, 'preamble');

  % Scrambled bits phase
  block1Phase = zeros(1, rScrambledBits);
  block1DiffPhase = DiffPhase(block1);
  for i=1:1:rScrambledBits
    for j=1:1:cScrambledBits/4
      block1Phase(i) = block1DiffPhase(i, j) + block1Phase(i);
    end
    block1Phase(i) = mod(block1Phase(i), 2);
  end


  % Generate direct mode normal burst
  phaseAdj = zeros(1, rScrambledBits);
  for i = 1:1:rScrambledBits
    if preamble(i) == 1
      phaseAdj(i) = mod(-(block1Phase(i) + NORMSEQ1PAHSE), 2);
      burstBits(i, :) = [P1, -1, -1, block1(i,:), normSeq1, block2(i,:), tailBits];
    elseif preamble(i) == 0
      phaseAdj(i) = mod(-(block1Phase(i) + NORMSEQ2PAHSE), 2);
      burstBits(i, :) = [P2, -1, -1, block1(i,:), normSeq2, block2(i,:), tailBits];
    end
  end

  % Calculate the phase adjustment
  phaseAdjBits = PhaseAdjust(phaseAdj);

  % The resultant of burst bits
  for i = 1:1:rScrambledBits
    burstBits(i, 13:14) = phaseAdjBits(1, 2*i-1:2*i);
  end
  CheckArrayD(burstBits, rScrambledBits, cBurstBits, 'direct mode normal burst');

end