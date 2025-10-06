samples = zeros(5000, 5000);

for i=1:1:5000
    for j=1:1:5000
        samples(i, j) = randn();
    end
end

figure(1);
ensemble = samples(:, 50);
histogram(ensemble, 'BinWidth', 0.1, 'Normalization', 'pdf');
hold on;
x=-4:0.0001:4;
plot(x, 1/sqrt(2*pi) * exp(-x.^2 / 2), 'r', 'LineWidth', 2);
hold off;

figure(2);
histogram(samples(1, :), 'BinWidth', 0.1);

figure(3);
ensemble_mean=mean(samples(:, :));
histogram(ensemble_mean, 'BinWidth', 0.002);