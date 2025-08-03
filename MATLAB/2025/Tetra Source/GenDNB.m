function burstBits = GenDNB(scrambledBits, preamble)
  % Slice scrambled bits to 2 blocks
  block1 = scrambledBits(:, 1:216);
  block2 = scrambledBits(:, 217:432);
  
  % The definition of preamble code P1, P2
  P1 = [0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1];
  P2 = [1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1];

  % The definition of normal traning sequence
  normSeq1 = [1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0];
  normSeq2 = [0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0 ,0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0];

  % The definition of tail bits
  tailBits = [0, 0];

  % Calculate the phase adjustment


  % Generate direct mode normal burst


  





end