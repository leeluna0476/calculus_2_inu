N=1000;
x = randn(1, N);
y = randn(1, N);
t = -(N-1):(N-1);
rxy = xcorr(x, y);
ryx = xcorr(y, x);

figure; clf;
subplot(211);
plot(t, rxy);
%hold on;
subplot(212);
plot(t, ryx, 'r');