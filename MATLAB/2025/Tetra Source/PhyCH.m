function multiframeBits = PhyCH(block1, block2, burstMode, phaseAdj)
  [rBlock1, cBlock1] = size(block1);
  [rBlock2, cBlock2] = size(block2);

  nFrame = 18;
  nSlot = 4;
  nblock = nSlot * nFrame;

  % The definiton of frequency correction
  freqCrt = [zeros(1, 8), ones(1, 64), zeros(1, 8)];

  % The definition of guard bits
  guardBits = [zeros(1, 6), ones(1, 26), zeros(1, 8)];

  % The definition of normal traning sequence
  normSeq1 = [1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0];
  normSeq2 = [0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0 ,0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0];

  % The definition of synchronization traning sequence
  syncSeq = [1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, ...
             1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0 ,1, 1, 1];

  % The definition of preamble code P1, P2 & P3
  P1 = [0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1];
  P2 = [1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1];
  P3 = [0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1];

  % Generate time slot
  switch burstMode
    case 'DLB'
      % Check data bits length
      % block1 is 504 bits ramping & PA linerization
      CheckArrayD(block1, nblock, 504, burstMode);



    case 'DNB'
      % Check data bits length
      % block1 & block2 are TCH/xx
      CheckArrayD(block1, nblock, 216, burstMode);
      CheckArrayD(block2, nblock, 216, burstMode);



    case 'DSB'
      % Check data bits length
      % block1 is SCH/S, block2 is SCH/H|STCH
      CheckArrayD(block1, nblock, 120, burstMode);
      CheckArrayD(block2, nblock, 216, burstMode);
      
      slotBits = GenDNB();

  end


  % Generate frame
  frameBits = xxx;

  % Generate multiframe
  multiframeBits = xxx;



end