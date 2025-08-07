function unModuleFC = GuardInterval(codeFC, nSamplePerBit, f0)
nBits = length(codeFC);
nUnmoduleFc = nSamplePerBit*nBits;
unModuleFC = zeros(1, nUnmoduleFc);
RB = 18e3;
deltaF1 = -6.75e3;
deltaF2 = 2.25e3;
f1 = f0 + deltaF1;
f2 = f0 + deltaF2;
% fs1 = f1/nSamplePerBit;
% fs2 = f2/nSamplePerBit;
% nSampleperBITS = 1250
deltaT = 1/RB/nSamplePerBit/2;
t1 = 0; t2 = 0;
a3 = 2^0;

for i=1:1:nBits
  if codeFC(i)
    for j = 1:1:nSamplePerBit
      unModuleFC((i-1)*nSamplePerBit+j) = a3*real(exp(1i*2*pi*f1*(t1)));
      t1 = t1+deltaT;
    end
  else
    for k = 1:1:nSamplePerBit
      unModuleFC((i-1)*nSamplePerBit+k) = a3*real(exp(1i*2*pi*f2*(t2)));
      t2 = t2+deltaT;
    end
  end
end

end