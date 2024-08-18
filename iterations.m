% Define the arrays for damping constants (C) and spring constants (K)
K_array = linspace(100, 2000, 20);  % Spring constant values
C_array = linspace(1, 10, 20);      % Damping constant values

% Preallocate array for storing maximum y values
y_max = zeros(length(K_array), length(C_array));

% Set the threshold for maximum displacement
threshold = 0.5; % in cm, convert to meters (0.005 m)
threshold_m = threshold / 100;

% Loop through each value of K and C
for i = 1:length(K_array)
    for j = 1:length(C_array)
        % Set the current values of K and C in the workspace
        K = K_array(i);
        C = C_array(j);
        assignin('base', 'K', K);
        assignin('base', 'C', C);

        % Run the Simulink model
        out = sim('SYDE_351_Project_Suspension.slx');  % Replace 'your_simulink_model' with your actual model name
        
        % Access the 'logsout' dataset
        logsout = out.logsout;
        
        % Extract the signal named 'Mass_Pos'
        massPosSignal = logsout.get('Mass_Pos');
        
        % Access the timeseries object in the Values property
        timeseriesData = massPosSignal.Values;
        
        % Extract the time and data from the timeseries object
        data = squeeze(timeseriesData.Data); % Signal data
        
        % Get the maximum displacement for the current iteration
        y_max_current = max(data);
        
        % Store the maximum displacement in the array
        y_max(i, j) = y_max_current;
        
        % Display the result for debugging
        fprintf('K = %f, C = %f, Max Displacement = %f\n', K, C, y_max_current);
    end
end

% Create a 3D plot of the results
[K_mesh, C_mesh] = meshgrid(K_array, C_array);
figure;
surf(K_mesh, C_mesh, y_max', 'EdgeColor', 'none');
title('Maximum Displacement for Various K and C Values');
xlabel('Spring Constant K');
ylabel('Damping Constant C');
zlabel('Maximum Displacement (m)');
colorbar;
grid on;

% Print the values of K and C that had a maximum displacement less than the specified value
fprintf('Values of K and C with maximum displacement less than %.4f cm:\n', threshold);
for i = 1:length(K_array)
    for j = 1:length(C_array)
        if y_max(i, j) < threshold_m
            fprintf('K = %f, C = %f, Max Displacement = %f\n', K_array(i), C_array(j), y_max(i, j));
        end
    end
end