function [] = askisi2(l1, l2)
A1 = 1;
A2 = 0.5;
w1 = pi*mod((10/7.5)*(max(l1,l2)/(l1+l2)),1);
w2 = mod(w1 + (pi/4), pi);

%%%%%%%%%RECTANGULAR L = 16%%%%%%%%%%%%%%%%
L = 16;
%64;
%512;
f1 = figure('Name','x[n] windowed for L=16','NumberTitle','off');
n = 0:1:2*L-1
x = A1*cos(w1*n) + A2*cos(w2*n)
subplot(2,1,1);
stem(x);
ylabel('x[n]');
N = L;
%2^14;
subplot(2,1,2);
W  = rectwin(L);
wvtool(W);
term = 0:L-1;
xterm = A1*cos(w1*term) + A2*cos(w2*term)
xx = xterm.*(W');
stem(xx)
ylabel('x windowed');
Xdft = fft(x, N);
f2 = figure('Name','DFT for L=16','NumberTitle','off');
%stem(abs(Xdft));
subplot(1,2,1);
plot((0:length(Xdft)-1),abs(Xdft),'g');
title('|Xdft[k]| for N=L');
xlabel('k');
%legend('N = L')

%%%%N = 2^14%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2^14;
Xdft = fft(x, N);
figure(f2);
subplot(1,2,2);
%legend('N = 2^14')
plot((0:length(Xdft)-1),abs(Xdft));

title('|Xdft[k]| for N=2^(14)');
xlabel('k');
%%%%%%%%%%%%%%%%%%RECTANGULAR L=64%%%%%%%%%%%%
L = 64;
%512;
f1 = figure('Name','x[n] windowed for L=64','NumberTitle','off');
n = 0:1:2*L-1
x = A1*cos(w1*n) + A2*cos(w2*n)
subplot(2,1,1);
stem(x);
ylabel('x[n]');

N = L;
%2^14;
hold on;
subplot(2,1,2);
W  = rectwin(L);
wvtool(W);
term = 0:L-1;
xterm = A1*cos(w1*term) + A2*cos(w2*term)
xx = xterm.*(W');
stem(xx)
ylabel('x windowed');

Xdft = fft(x, N);
f2 = figure('Name','DFT for L=64','NumberTitle','off');
%stem(abs(Xdft));
subplot(1,2,1);
plot((0:length(Xdft)-1),abs(Xdft),'g');
title('|Xdft[k]| for N=L');
xlabel('k');
%legend('N = L')
%%%%N = 2^14%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2^14;
Xdft = fft(x, N);
figure(f2);
subplot(1,2,2);
%legend('N = 2^14')
plot((0:length(Xdft)-1),abs(Xdft));
title('|Xdft[k]| for N=2^(14)');
xlabel('k');
%%%%%%%%%%%%%%%%RECTANGULAR L = 512%%%%%%%%%
L = 512;
f1 = figure('Name','x[n] windowed for L=512','NumberTitle','off');
n = 0:1:2*L-1
x = A1*cos(w1*n) + A2*cos(w2*n)
subplot(2,1,1);
stem(x);
ylabel('x[n]');
N = L;
%2^14;
hold on;
subplot(2,1,2);
W  = rectwin(L);
wvtool(W);
term = 0:L-1;
xterm = A1*cos(w1*term) + A2*cos(w2*term)
xx = xterm.*(W');
stem(xx)
ylabel('x windowed');
Xdft = fft(x, N);
f2 = figure('Name','DFT for L=512','NumberTitle','off');
%stem(abs(Xdft));
subplot(1,2,1);
plot((0:length(Xdft)-1),abs(Xdft),'g');

title('|Xdft[k]| for N=L');
xlabel('k');
%legend('N = L')
%%%%N = 2^14%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2^14;
Xdft = fft(x, N);
figure(f2);
subplot(1,2,2);
%legend('N = 2^14')
plot((0:length(Xdft)-1),abs(Xdft));
title('|Xdft[k]| for N=2^(14)');
xlabel('k');

%%%%%%%%%%      L=64 fftshifted%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%RECTANGULAR L=64%%%%%%%%%%%%
L = 64;
%512;
f1 = figure('Name','x[n] windowed for L=64','NumberTitle','off');
n = 0:1:2*L-1
wshifted = (w1 + w2)/2
x = A1*cos(wshifted*n) + A2*cos(wshifted*n)
subplot(2,1,1);
stem(x);
ylabel('x[n]');

N = L;
%2^14;
hold on;
subplot(2,1,2);
W  = rectwin(L);
wvtool(W);
term = 0:L-1;
xterm = A1*cos(wshifted*term) + A2*cos(wshifted*term)
xx = xterm.*(W');
stem(xx)
ylabel('x windowed');

Xdft = fftshift(x);
f2 = figure('Name','DFT for L=64','NumberTitle','off');
%stem(abs(Xdft));
plot((-length(Xdft)/2):(length(Xdft)/2)-1,abs(Xdft),'g');
title('|Xdft[k]| for N=L');
xlabel('k');
%legend('N = L')
%%%%N = 2^14%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%HAMMING L=64%%%%%%%%%%%%
L = 64;
f1 = figure('Name','x[n] hamming windowed for L=64','NumberTitle','off');
n = 0:1:2*L-1
wshifted = (w1+w2)/2
x = A1*cos(wshifted*n) + A2*cos(wshifted*n)
subplot(2,1,1);
stem(x);
ylabel('x[n]');

N = L;
%2^14;
hold on;
subplot(2,1,2);
W  = hamming(L);
wvtool(W);
term = 0:L-1;
xterm = A1*cos(wshifted*term) + A2*cos(wshifted*term)
xx = xterm.*(W');
stem(xx)
ylabel('x hamming windowed');

Xdft = fftshift(x);
f2 = figure('Name','DFT for L=64','NumberTitle','off');
%stem(abs(Xdft));
plot((-length(Xdft)/2):(length(Xdft)/2)-1,abs(Xdft),'g');
title('|Xdft[k]| for N=L HAMMING');
xlabel('k');
%legend('N = L')
%%%%N = 2^14%%%%%%%%%%%%%%%%%%%%%%%%%%%%
