function [block1, block2] = BlockSlicer(scrambledBits)

  % Slice scrambled bits to 2 blocks
  block1 = scrambledBits(:, 1:216);
  block2 = scrambledBits(:, 217:432);
end