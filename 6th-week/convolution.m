function y=convol(n, x, h)
    y = 0;
    for m=0:1:(length(h) - 1)
        if n > m && n <= m + 4
            y = y + x(n - m) * h(m + 1);
        else
            y = y + 0;
        end
    end
end

x=[1 2 3 4];
h=[0 1 2];
n=length(x) + length(h) - 1;
y=zeros(1, n);
for i=1:1:n
    y(i)=convol(i, x, h);
end
y