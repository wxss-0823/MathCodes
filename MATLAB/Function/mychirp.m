function [ xx, tt ] = mychirp( f1, f2, dur, fsamp )
%mychirp ∫œ≥…chirp–≈∫≈
dt = 1/fsamp; 
tt = 0 : dt : dur; 
u=(f2-f1)/(2*dur);
xx = cos(2*pi*u*tt.*tt+2*pi*f1*tt);
soundsc(xx,fsamp);
specgram(xx,1024,fsamp);
end

