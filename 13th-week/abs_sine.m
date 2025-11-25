t=-10:0.001:10;
n=2:2:100;
x=2/pi + 2/pi *sum((1./(1+n) + 1./(1-n))*cos(n'*t), 1);

plot(t, x);
hold on;
xlabel('t');
ylabel('x(t)');
title({'$x(t)=|sin(t)|$'}, 'Interpreter', 'Latex', 'Fontsize', 20);
grid on;
axis equal;