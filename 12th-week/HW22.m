% x(t)=a_0 / 2 + sigma(a_n cos(nt) + b_n sin(nt))
% x(t)=-1 where -pi < t < 0, 1 where 0 < t < pi

% only oddnumbered terms are significant.

for terms=1:1:20
    n=1:2:terms*2-1;
    b_n=4./(n*pi);
    t=-3*pi:0.001:3*pi;
    x_t=sum(b_n*sin(n'*t), 1);

    fig=figure(terms);
    plot(t, x_t);
    grid;
    xlim([-3*pi 3*pi]);
    xlabel('t');
    ylabel('x(t)');
    title('Square wave approximated by Fourier Series');
    subtitle(sprintf("up to %d term(s)", terms));

% save image (png)
    print(fig, sprintf("/Users/leeluna0476/Desktop/%d.png", terms), '-dpng', '-r300');
end