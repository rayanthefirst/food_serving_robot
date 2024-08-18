torque_left_wheel_time = out.torque_left_wheel.time;
torque_left_wheel_values = out.torque_left_wheel.signals.values;

torque_right_wheel_time = out.torque_right_wheel.time;
torque_right_wheel_values = out.torque_right_wheel.signals.values;

rms_torque_left = sqrt(sum(torque_left_wheel_values.^2, "all")/torque_left_wheel_time(end));
rms_torque_right = sqrt(sum(torque_right_wheel_values.^2, "all")/torque_right_wheel_time(end));

max_torque_left = max(torque_left_wheel_values);
max_torque_right = max(torque_right_wheel_values);

max_jerk = max(out.Jerk);
max_acceleration = max(out.acceleration);
steady_speed = max(out.Steady_state_vel);

data = out.simout;

x_values = data(:,1);
y_values = data(:,2);

plot(x_values, y_values, "o-");
title("XY Plot of Robot Path in Global Frame");
xlabel('X (m)');
ylabel('Y (m)');