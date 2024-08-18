clear;
% For Dynamic Model

R_cyl = 25e-2; % radius of robot (m)
R =  5e-2; % Radius of Wheel (m)
M = 20; % Mass of Robot (kg)
LC = 20; % Loading Capacity of Robot (kg)
d = 2.5e-2; % Distance between the wheels (m) 
J = (1/2)*(M * (R_cyl)^2); % Moment of Inertia
L = 25e-2; % Distance between wheels

% For Motors:
R_a = 4; % Armature Resistance
K_b = 0.3247; 
K_t = 0.3248;
L_a = 6.6e-3;
N = 1; % Gear Ratio

% % For Motors:
% R_a = 4; % Armature Resistance
% K_b = 0.0274; 
% K_t = 0.0274;
% L_a = 2.75e-6;
% N = 1; % Gear Ratio


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