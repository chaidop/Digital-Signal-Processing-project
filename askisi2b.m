function [] = askisi2b()
fs = 22e3 %sampling frequency 16-22 Hz
fhamming1 = 10e-3; %mhkos 10msec
fhamming2 = 100e-3; %mhkos 100msec
%%%%oso mikrotero to mhkos, toso pio kathara sth xronikh diastash
shift = 5e-3;
ov = shift*fs;
t = 0:1/fs:1-1/fs;
voice = audiorecorder(fs,8,1);
disp('Start talking you have 3 seconds');
record(voice);
pause(3);
stop(voice)
player = audioplayer(voice);
play(player);
pause(3);
mySpeech = getaudiodata(voice);
subplot(2,1,1);
plot(mySpeech);
title('Voice');
ylabel('Magnitude');
xlabel('time');
L = fs * fhamming2;
window = hamming(L);
%audiowrite('Sample.wav',voice,fs);
%[Y,Fs] = audioread('Sample.wav');
Y = fft(mySpeech);
%f2 = figure;
%subplot(2,1,1)
%plot(Y);
overlap = L - ov;
subplot(2,1,2);
spectrogram(Y,window,overlap,L,'yaxis');
%plot(S);
%%%%%%%%%%%%%%%%FILTERING%%%%%%%%%%%%%%%%%
wp = 0.10*pi;
ws = 0.30*pi;
Rp = 1;
As = 40;
Dw = ws - wp;
m = (8*pi)/Dw;
wn = Dw/2;
ham = hamming(m+1);
Bfir = fir1(m,wn,'low',ham);%mporei o prosdiorismos ham na paraleiftei(einai default)
f4 = figure;
disp('Start talking you have 3 seconds');
voice = audiorecorder(fs,8,1);
record(voice);
pause(3);
stop(voice)
SpeechFiltered = filter(Bfir,1,voice);
m = getaudiodata(SpeechFiltered);
%player = audioplayer(SpeechFiltered);
play(m);
pause(3);

Y = fft(SpeechFiltered)
subplot(2,1,1);
plot(SpeechFiltered);
ylabel('Magnitude');
xlabel('time');
subplot(2,1,2);
play(u)
spectrogram(Y,window,overlap,size(Y),'yaxis');

hold on;
