
fd = 20;
df = 2^-13;
f = -fd+df:df:fd-df;
pi = 3.1415926;

Sf = 1./(pi*fd.*sqrt(1-(f/fd).^2));



subplot(2,1,1)
plot(f, abs(Sf))
subplot(2,1,2)
plot(f, -atan(imag(Sf)./real(Sf)))

/*i = imag(Sf);
r = real(Sf);
Sti = ifftn(i);
Str = ifftn(r);
St = Str + 1j .* Sti;*/
St = ifftn(Sf);

figure(2)
subplot(2,1,1)
plot(imag(St))
subplot(2,1,2)
plot(real(St))

figure(3)
subplot(2,1,1)
plot(abs(abs(St)))
subplot(2,1,2)
plot(atan(imag(St)./real(St)))

