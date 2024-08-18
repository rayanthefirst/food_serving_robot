function [t_profile, v_profile] = Velocity_Profile(u, max_velocity, acceleration_time, deceleration_time)

% Compute distances and times for each phase
acceleration_distance = 0.5 * max_velocity * acceleration_time;
deceleration_distance = 0.5 * max_velocity * deceleration_time;
constant_velocity_distance = u - acceleration_distance - deceleration_distance;
constant_velocity_time = constant_velocity_distance / max_velocity;

% Time vectors for each phase
t_acceleration = linspace(0, acceleration_time, 2000);
t_constant_velocity = linspace(0, constant_velocity_time, 2000);
t_deceleration = linspace(0, deceleration_time, 2000);

% Velocity profile
v_acceleration = max_velocity * t_acceleration / acceleration_time;
v_constant_velocity = max_velocity * ones(size(t_constant_velocity));
v_deceleration = max_velocity - max_velocity * t_deceleration / deceleration_time;

deceleration_time = acceleration_time + constant_velocity_time + t_deceleration;

% Concatenate time and velocity vectors
t_profile = [t_acceleration, acceleration_time + t_constant_velocity, ...
             deceleration_time];
v_profile = [v_acceleration, v_constant_velocity, v_deceleration];