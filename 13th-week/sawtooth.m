% f(t) = 2t, 0 < t < 2
%      = 2 - sigma_n=1_inf{4/npisin(npit}

t=-10:0.001:10;
n=1:1:1900;
x=2-sum(4./(n*pi) * sin(pi.*n'*t), 1);
plot(t, x);
xlabel('t');
ylabel('x(t)');
title('Sawtooth Wave');
subtitle({'$x(t)=2t,\quad 0<t<2$', ...
         '$x(t+2)=x(t)$'}, 'Interpreter', 'latex', 'Fontsize', 10);
grid;
axis equal;