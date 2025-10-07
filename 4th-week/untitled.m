R = 3; % 반지름
[x, y, z] = sphere(50);
x = R * x; y = R * y; z = R * z;

figure;
surf(x, y, z, 'FaceColor', 'yellow'); hold on;
axis equal;
title(['반지름 R = ' num2str(R) ' 인 구 (단색)']);

phi = linspace(pi/4, pi/2, 40);
theta = linspace(pi/4, pi/2, 40);
[theta, phi] = meshgrid(theta, phi);

x_red = R * sin(phi) .* cos(theta);
y_red = R * sin(phi) .* sin(theta);
z_red = R * cos(phi);

% 빨간색으로 칠하기
surf(x_red, y_red, z_red, 'FaceColor', 'red');

xlabel('X');
ylabel('Y');
zlabel('Z');
