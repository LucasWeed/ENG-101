%% In-class Assignment 2 - Heat Transfer Analysis
% Lucas Weed
% ENG 101-03
% 01/29/2018
%
%% Part 1 - Calculating Cooling time
clc;
clear all;

% Define variables
temp_current = input('In Fahrenheit, what temperature is the beer right now? '); %Input for the current temperature for the beer, Ti
temp_fridge = input('In Fahrenheit, what temperature is your fridge? ');         %Input for the temperature of the fridge, Tr
temp_desired = input('In Fahrenheit, what temperature do you want your beer? '); %Input for the desired temperature, Tc
k = 0.35; % Energy constant

% Calculate ideal time it takes to cool the drink
% dt is delta temp
dt_desired = temp_desired - temp_fridge;        % Temp difference between final temp and fridge
dt_current = temp_current - temp_fridge;        % Temp difference between current temp and fridge
time_to_cool = (log(dt_desired/dt_current))/-k; % Newton's cooling equation solved for t

% Determine the temp range of a fridge with a given percentage fluctuation
percent_flux = 20;                                      % Percentage that fridge temperature can fluctuate
temp_fridge_flux = temp_fridge*(percent_flux)*(0.01);   % Degrees in Fahrenheit that fridge can fluctuate
temp_fridge_max = temp_fridge + temp_fridge_flux;       % Max temperature the fridge can reach
temp_fridge_min = temp_fridge - temp_fridge_flux;       % Minimum temperature the fridge can drop to
temp_fridge_range = [temp_fridge_min, temp_fridge_max]; % Array for the temp range of the fridge

% Calculate the minimum, ideal, and maximum time it takes to cool the drink
% dt is delta temp
dt_desired_flux = temp_desired - temp_fridge_range;                 % Temp difference between desired temp and fridge with flux
dt_current_flux = temp_current - temp_fridge_range;                 % Temp difference between current temp and fridge with flux
time_to_cool_range = (log(dt_desired_flux./ dt_current_flux))/-k;   % Newton's cooling equation, eval. with flux

% Create variables for the min, median, and max time it takes to cool
time_min = min(time_to_cool_range); % Minimum time to cool
time_median = time_to_cool;         % Median time to cool
time_max = max(time_to_cool_range); % Max time to cool

% Informing my friend how much he has messed up
fprintf('Idealy it would take %2.1f minutes to cool the drinks to %2.0f degrees F, if the fridge stayed at %2.0f degrees F.\n', time_median, temp_desired, temp_fridge);
fprintf('But of course the fridge can fluctuate between %2.1f and %2.1f degrees F,\n', temp_fridge_min, temp_fridge_max);

% Where things get crazy.  It's possible for the fridge to get warmer than
% the desired temp, and I don't want to give a negative number.

if (temp_fridge_max >= temp_desired) %If the fridge is warmer than what you want
    % Evaluate Newton's equation when the temperature of the fridge is
    % just below the desired temperature.
    dt_desired_min = .1; % For simplicity's sake, the fridge is .1 of a degree below the desired temp
    dt_current_min = temp_current - (temp_desired - 0.1); % Difference between current and fridge temp, if the fridge was .1 degrees below desired temp
    time_to_cool_problem = (log(dt_desired_min/dt_current_min))/-k; % Calculate Newton's equation
    
    % Informing my friend how much he has messed up
    degrees_error = temp_fridge_max - temp_desired; % How many degrees above desired temp the fridge could reach
    fprintf('and %2.1f is %g degrees too warm, so we might not get them all the way down.\n', temp_fridge_max, degrees_error)
    fprintf('It could take between %2.1f and %2.1f minutes to cooldown to %2.1f degrees F, and that''s only if the fridge stays below %2.1f degrees F!\n', time_min, time_to_cool_problem, temp_desired, temp_desired);
else
    % Informing my friend how much he has messed up
    fprintf('It could take between %2.1f and %2.1f minutes to cool down to %f F.\n', time_min, time_max, temp_desired);
end
disp('I''m not letting you bring drinks to a party again!');