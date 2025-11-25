t=-1:0.001:30;
u=(t>=0);
y1=(-5/3*exp(-8*t) + 5/3*exp(-2*t)).*u;

figure(1);
plot(t, y1);
xlabel('t');
ylabel('y(t)');
grid on;
xlim([-1 10]);
axis equal;

y2=(cos(t)+sin(t)+exp(-2*t)-2*exp(-8*t)).*u;

figure(2);
plot(t, y2);
xlabel('t');
ylabel('y(t)');
grid on;
axis equal;

b=[5 3 -2 7];
a=[-4 0 8 3];
[r, p, k]=residue(b, a);
y3=(sum(r.*exp(p.*t), 1)+k*dirac(t)).*u;

figure(3);
plot(t, y3);
xlabel('t');
ylabel('y(t)');
grid on;
