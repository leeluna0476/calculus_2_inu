N = 1000;
x = randn(1, N);
t = -(N-1):(N-1);
r = xcorr(x);
figure;
clf;
plot(t, r);