%y(t)=(2cost+3sint)u(t)

t=0:0.001:30;
y1=2*cos(t)+3*sin(t);

figure(1);
plot(t, y1);
xlabel('t');
ylabel('y(t)');
grid;
%axis equal;

%y(t)=(3/4 + 8/3 exp(-t) - 17/12 exp(-4t))u(t)
y2=3/4+8/3*exp(-t)-17/12*exp(-4*t);


figure(2);
plot(t, y2);
xlabel('t');
ylabel('y(t)');
grid;
%axis equal;

%y(t)=1/3 exp(-t) + 2/3 exp(-4t) - exp(-3t)
y3=1/3*exp(-t)+2/3*exp(-4*t)-exp(-3*t);

figure(3);
plot(t, y3);
xlabel('t');
ylabel('y(t)');
grid;
%axis equal;