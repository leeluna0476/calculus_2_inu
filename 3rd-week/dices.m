roll = randi([1 6], 1); % randi: uniformly distributed random integers

k=10^2;
M=10^2;
E_count = zeros(1, M);
B_count = zeros(1, M);
m=1;
for N = 1:k:k*M
    count1_4 = 0;
    count2_24 = 0;
    for i = 1:1:N
        for j = 1:1:4
            roll = randi([1 6], 1);
            if roll == 6
                count1_4 = count1_4 + 1;
                break;
            end
        end
        for j = 1:1:24
            roll1 = randi([1, 6], 1);
            roll2 = randi([1, 6], 1);
            if ((roll1 == 6) && (roll2 == 6))
                count2_24 = count2_24 + 1;
                break;
            end
        end
    end
    E_count(m) = count1_4;
    B_count(m) = count2_24;
    m = m + 1;
end

figure(1);clf;
plot(1:M,E_count);grid;hold on;
plot(1:M,B_count);
xlabel('Number of the event occured (*10^2))');
ylabel('Number of a six (or simultaneously) occured');

legend('Event E count', 'Event B count');
