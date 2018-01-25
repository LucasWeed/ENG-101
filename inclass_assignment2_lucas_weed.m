%% In-class Assignment 2 - Heat Transfer Analysis
% Lucas Weed
% ENG 101-03
% 01/29/2018
%
%% Part 1 - Calculating Cooling time
clc;
clear all;
temp_current = input('In Fahrenheit, what temperature is the beer right now? '); %Input for the current temperature for the beer Ti
temp_fridge = input('In Fahrenheit, what temperature is your fridge? ');    %Input for the temperature of the fridge Tr
temp_desired = input('In Fahrenheit, what temperature do you want your beer? '); %Input for the desired temperature Tc
k = 0.35; % Energy constant

dt_desired = temp_desired - temp_fridge; % Temp difference between final temp and fridge
dt_current = temp_current - temp_fridge; % Temp difference between current temp and fridge
time_to_cool = (log(dt_desired/dt_current))/-k; % Newton's cooling equation solved for t

percent_flux = 20 % Percentage that fridge temperature can fluxtuate
temp_fridge_flux = temp_fridge*(percent_flux)*(0.01); % Degrees in Fahrenheit that fridge can fluctuate
temp_fridge_max = temp_fridge + temp_fridge_flux; % Max temperature the fridge can reach
temp_fridge_min = temp_fridge - temp_fridge_flux; % Minimum temperature the fridge can drop to

temp_fridge_range = [temp_fridge_min, temp_fridge, temp_fridge_max] % Array for the temp range of the fridge

dt_desired_flux = temp_desired - temp_fridge_range; % Temp difference between desired temp and fridge with flux
dt_current_flux = temp_current - temp_fridge_range; % Temp difference between current temp and fridge with flux
time_to_cool_range = (log(dt_desired_flux./ dt_current_flux))/-k % Newton's cooling equation solved for t, eval. with flux

fprintf('Dude it''s going to take %2.1f hours to chill the drinks, the party is going to be over by then!', time_to_cool);
