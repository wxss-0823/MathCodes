function unModuleFC = GuardInterval(codeFC, nSamplePerBit, fc)
nBits = length(codeFC);
nUnmoduleFc = nSamplePerBit*nBits;
unModuleFC = zeros(length(fc), nUnmoduleFc);
RB = 18e3;
deltaF1 = -6.75e3;
deltaF2 = 2.25e3;
f1 = fc + deltaF1;
f2 = fc + deltaF2;
% fs1 = f1/nSamplePerBit;
% fs2 = f2/nSamplePerBit;
% nSampleperBITS = 1250
deltaT = 1/RB/nSamplePerBit/2;
t1 = 0; t2 = 0;

for n=1:1:length(fc)
  for i=1:1:nBits
    if codeFC(i)
      for j = 1:1:nSamplePerBit
        unModuleFC(n, (i-1)*nSamplePerBit+j) = real(exp(1i*2*pi*f1(n)*(t1)));
        t1 = t1+deltaT;
      end
    else
      for k = 1:1:nSamplePerBit
        unModuleFC(n, (i-1)*nSamplePerBit+k) = real(exp(1i*2*pi*f2(n)*(t2)));
        t2 = t2+deltaT;
      end
    end
  end
end
end