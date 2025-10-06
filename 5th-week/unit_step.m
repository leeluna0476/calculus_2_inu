function y = u_step(x)
    y = x >= 0;
end


x=-10:0.00001:50;
y=0.24*u_step(x - 10) + 0.32*u_step(x - 20) + 0.44*u_step (x - 30) - 0.24*u_step(x - 40) - 0.32*u_step(x - 40) - 0.44*u_step(x - 40);
plot(x, y);

current_ylim = ylim;
y_range = current_ylim(2) - current_ylim(1);
y_margin = y_range * 0.10;
new_ylim = [current_ylim(1) - y_margin, current_ylim(2) + y_margin];
ylim(new_ylim);