function burstBits = GenDLB(paLinBits)
  cBurstBits = 504;
  rBurstBits = 72;

  % Check PA linearization bits
  CheckArrayD(paLinBits, rBurstBits, cBurstBits, 'PA linearization bits');

  burstBits = paLinBits;
end