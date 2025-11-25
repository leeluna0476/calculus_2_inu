t=-10:0.001:10;
n=1:2:100;
x=pi/2-sum(4./(pi*n.*n) * cos(n'*t), 1);
figure;
plot(t, x);
xlabel('t');
ylabel('x(t)');
title('Triangular Wave');
subtitle({'$x(t)=|t|, \quad -\pi < t < \pi$, \quad ', ... 
    '$x(t+2\pi)=x(t)$', ...
    '$x(t)=\frac{\pi}{2} + \frac{2}{\pi}\sum\limits_{n=1}^{\infty}\frac{1}{n^2}(cos(n\pi)-1)cos(nt) $'}, ...
    'Interpreter', 'Latex', 'Fontsize', 10);
grid;
axis equal;
set(gcf, 'Units', 'pixels');
set(gcf, 'OuterPosition', [100 100 1000 1000]);