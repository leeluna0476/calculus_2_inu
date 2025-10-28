phi=-4*pi:0.001:4*pi;
i=(1:20)';
numerators=phi .^ (2*i - 1);
denominators=factorial(2*i - 1);
signs=(-1).^(i + 1);
estimated_sine=sum(signs .* numerators ./ denominators, 1);

subplot(2, 1, 1);
plot(phi, estimated_sine, 'b');
axis equal;
grid on;
xlabel('\phi');
ylabel('sin(\phi)');
title('Estimated sine');

subplot(2, 1, 2);
plot(phi, sin(phi), 'r');
axis equal;
grid on;
xlabel('\phi');
ylabel('sin(\phi)');
title('Matlab sine');