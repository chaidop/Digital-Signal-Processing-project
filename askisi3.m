function [] = askisi3()
A = 5000;
%%%%%%% p %%%%%%%%%%%%%
for k = 0:A-1;
    c = (0.9999)^k;
    p = sum(c(k)*dirac(80*k));
    plot(p);
end
plot(p);
hold on;
w = rectwin(A);
plot(p.*A);
%%%%%%%%%%%%%%% g %%%%%%%%%%%%

for n = 0:1:24
    g = 0.5*(1 - cos(pi*(n + 1)/25));
    plot(linspace(0,24,length(g)),g);
end
for n = 25:1:33
    g = cos(0.5*pi*(n - 24)/10);
    plot(linspace(25,33,length(g)),g);
end
f2 = figure
subplot(2,1,1);
plot(g);
title('ggggggggggggg');
G = fft(g,32);
subplot(2,1,2);
plot(G);
r = roots(G);
f3 = figure
plot(r);
title('roots');

