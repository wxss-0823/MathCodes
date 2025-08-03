function [slotBits, frameBits, multiframeBits] = PhyCH(burstBits)
  [rBurstBits, cBurstBits] = size(burstBits);

  nFrame = 18;
  nSlot = 4;
  nblock = nSlot * nFrame;

  % The definition of guard bits
  guardBits = [zeros(1, 6), ones(1, 26), zeros(1, 8)];

  % Generate 510 bits time slot
  rSlotBits = rBurstBits;
  slotBits = zeros(rSlotBits, cBurstBits + 40);
  for i=1:1:rSlotBits
    slotBits(i,:) = [guardBits(1, 1:34), burstBits(i,:), guardBits(1, 35:40)];
  end
  CheckArrayD(slotBits, nblock, 510, 'slot bits');

  % Generate frames containing 4 time slots
  cFrameBits = nSlot * 510;
  rFrameBits = rSlotBits/nSlot;
  frameBits = zeros(rFrameBits, cFrameBits);
  for i=1:1:rFrameBits
    frameBits(i, :) = [slotBits((i-1)*4+1,:), slotBits((i-1)*4+2,:), slotBits((i-1)*4+3,:), slotBits((i-1)*4+4,:)];
  end
  CheckArrayD(frameBits, rFrameBits, cFrameBits, 'frame bits');

  % Generate one multiframe containing 18 frames
  cMultiframeBits = nblock * 510;
  for i=1:1:nblock/4
    multiframeBits(1, (i-1)*cFrameBits+1:i*cFrameBits) = frameBits(i,:);
  end
  CheckArrayD(multiframeBits, 1, cMultiframeBits, 'one multiframe bits');

end