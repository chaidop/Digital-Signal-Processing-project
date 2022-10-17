function [] = askisi1()
wp = 0.10*pi;
ws = 0.30*pi;
Rp = 1;
As = 40;
Dw = ws - wp;
m = (8*pi)/Dw;%to mikos tou parathirou
wn = Dw/2;%cutt-off frequency
ham = hamming(m+1);
%wvtool(ham);
Bfir = fir1(m,wn,'low',ham);%Dhmiourgia fir filtrou me hamming kai epistrofi tvn sintelestwn B
f1 = figure('Name','FIR Filter');
subplot(2,2,1);
impz(Bfir,1);
grid on;
ylabel('h[n]');
xlabel('n');
title('Kroustikh Apokrish');
Gdfir = grpdelay(Bfir,1,m);
subplot(2,2,4);
plot(Gdfir);
title('Group delay of FIR filter');
subplot(2,2,2);
[Hfir, Wfir]=freqz(Bfir,m);
plot(Wfir,20*log10(abs(Hfir)));
grid on;
ylabel('Magnitude |H(ejw)|in dB');
xlabel('frequency');
title('Frequency Response of FIR filter');
subplot(2,2,3);
stepz(Bfir);
grid on;
title('Step Responce of FIR filter');
print(f1, '-dpdf', 'impulseHamming.pdf');
%%%% Xrhsh toy fvtool gia elegxo apotelesmatwn
fvtool(Bfir);
%%%%%%%%% Sxediasmos Butterworth %%%%%%%%%%
[Nb, wnbutt] = buttord(.1, .3, Rp, As);
[B, A] = butter(Nb, wnbutt, 'low');%coefficients
[Z, P, ~] = butter(Nb, wnbutt, 'low');%zeros and poles
f2 = figure('Name','IIR Filter');
subplot(2,2,1)
impz(B,A);%Kroustikh apokrish tou filtrou
ylabel('h[n]');
xlabel('n');
title('Kroustikh Apokrish');
grid on;
subplot(2,2,3);
stepz( B, A);%Bhmatikh apokrish
title('Step Response of IIR filter');
[Hb, Wb]=freqz(B,A);
grid on;
subplot(2,2,2);
plot(Wb,20*log10(abs(Hb)));
grid on;
ylabel('Magnitude |H(z)| in dB');
xlabel('frequency');
title('Frequency Response of IIR filter');
subplot(2,2,4);
grpdelay(B,A);%Group Delay
title('Group delay of IIR filter');
print(f2, '-dpdf', 'butter.pdf');
f3 = figure('Name','Zeros and Poles');
zplane(Z,P);%sxediasmos zeros kai poles
grid on;
title('Poles and Zeros of Butterworth filter');
print(f3, '-dpdf', 'butterPolesZeros.pdf');
fvtool(B,A);