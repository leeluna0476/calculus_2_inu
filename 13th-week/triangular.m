t=-10:0.001:10;
n=1:2:100;
x=pi/2-sum(4./(pi*n.*n) * cos(n'*t), 1);
plot(t, x);
xlabel('t');
ylabel('x(t)');
title('Triangular Wave');
subtitle({'$x(t)=|t|, \quad -\pi < t < \pi$', ... 
    '$x(t+2\pi)=x(t)$'}, 'Interpreter', 'Latex');
grid;
axis equal;