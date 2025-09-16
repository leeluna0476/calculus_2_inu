
% monte carlo simulation


k=100;
M=1000;
A_results = zeros(1, M);
B_results = zeros(1, M);
m=1;
for N = 1:k:M*k
    countA=0;
    countB=0;
    for i = 1:1:N
        rollA = randi([1 6], 1);
        if rollA ~= 6
            countA = countA + 1;
        end
        rollB1 = randi([1 6], 1);
        rollB2 = randi([1 6], 1);
        if ~((rollB1 == 6) && (rollB2 == 6))
            countB = countB + 1;
        end
    end
    A_results(m) = countA / N;
    B_results(m) = countB / N;
    m = m + 1;
end

figure(1);clf;
plot(1:M, A_results, 'm');grid;hold on;
plot(1:M,B_results, 'b');
plot([1 M],[5/6 5/6], 'k', 'LineWidth', 1.5);
plot([1 M],[35/36 35/36], 'r', 'LineWidth', 1.5);
xlabel('Number of rolling dice(s) (*10^2)');
ylabel('Estimated Probability');

legend('Estimated P(A)', 'Estimated P(B)', 'P(A)', 'P(B)');
