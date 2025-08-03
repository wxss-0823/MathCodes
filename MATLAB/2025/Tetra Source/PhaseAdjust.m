function phaseAdjBits = PhaseAdjust(phaseAdj)
  d = length(phaseAdj);
  % Calculate the phase adjustment
  for i=1:1:d
    switch phaseAdj(i)
      % The phase adjustment bits has already been reversed
      % {5/4 + 3/4([0,1])} mod 2 = 0
      case 5/4
        % phaseAdjBits(1, 2*i-1:2*i) = [0, 1];
        phaseAdjBits(1, 2*i-1:2*i) = [1, 1];
      % {3/4 - 3/4([1,1])} mod 2 = 0
      case 3/4
        % phaseAdjBits(1, 2*i-1:2*i) = [1, 1];
        phaseAdjBits(1, 2*i-1:2*i) = [0, 1];
      % {1/4 - 1/4([0,1])} mod 2 = 0
      case 1/4
        % phaseAdjBits(1, 2*i-1:2*i) = [1, 0];
        phaseAdjBits(1, 2*i-1:2*i) = [0, 0];
      % {7/4 + 1/4([0,0])} mod 2 = 0
      case 7/4
        % phaseAdjBits(1, 2*i-1:2*i) = [0, 0];
        phaseAdjBits(1, 2*i-1:2*i) = [1, 0];
      otherwise
        error('Error:  Please check the length of scrambledBits(%d)', cScrambledBits);
    end
  end
end