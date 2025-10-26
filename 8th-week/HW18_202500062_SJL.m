addpath('./v2p6/v2p6');
addpath('./v2p6/v2p6/tdmsSubfunctions')

data_struct=TDMS_getStruct('data/group1_c.tdms');
data_x=data_struct.Log.x.data;
data_y=data_struct.Log.y.data;

period=1/25600;
time=period:period:10;
range_a=find(time==3.5);
range_b=find(time==5.5);

clean_data_x=data_x(range_a:range_b);
clean_data_y=data_y(range_a:range_b);
time_ab=time(range_a:range_b);

figure(1);
plot(time_ab, clean_data_x, 'b');
hold on;
plot(time_ab, clean_data_y, 'r');
xlim([time(range_a), time(range_b)]);
xlabel('Time (s)');
ylabel('Mic signal');
title('Mic signal visualization');
legend('data\_x', 'data\_y');
grid on;
hold off;

[r_xy, tau]=xcorr(clean_data_y, clean_data_x);
tau=tau*period;
[max_val, max_idx] = max(r_xy);

delta=tau(max_idx);
sonic_speed=340;
distance=delta*sonic_speed;

fprintf('The time delay between two mics: %.4f s\n', delta);
fprintf('The distance between two mics: %.4f m\n', distance);

figure(2);
plot(tau, r_xy, 'b');
hold on;
grid on;
xlabel('τ');
ylabel('R_{xy}');
title('Cross-correlation of two mic signals');
hold off;

