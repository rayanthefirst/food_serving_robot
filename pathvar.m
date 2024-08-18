close all;

[t_profile1, v_profile1] = Velocity_Profile(15, 3, 1.5, 1.5);
[t_profile2, v_profile2] = Velocity_Profile(10, 3, 1.5, 1.5);
[t_profile3, v_profile3] = Velocity_Profile(8, 3, 1.5, 1.5);

t_profile2 = t_profile2 + 10.525;
t_profile3 = t_profile3 + 19.3833;

simin_right_wheel_15 = timeseries(v_profile1, t_profile1);
simin_left_wheel_15 = timeseries(v_profile1, t_profile1);

simin_right_wheel_10 = timeseries(v_profile2, t_profile2);
simin_left_wheel_10 = timeseries(v_profile2, t_profile2);

simin_right_wheel_8 = timeseries(v_profile3, t_profile3);
simin_left_wheel_8 = timeseries(v_profile3, t_profile3);