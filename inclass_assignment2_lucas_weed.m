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
k = 0.35; %energy constant

time_to_cool = (log((temp_desired-temp_fridge)/(temp_current-temp_fridge))/-k); % Solve Newton's law of cooling for t.

%percent_flux = 20 % Percentage that fridge temperature can fluxtuate
%temp_fridge_flux = temp_fridge*(percent_flux)*(0.01) % Degrees in Fahrenheit that fridge can fluctuate to
%temp_fridge_max = temp_fridge + temp_fridge_flux % Max temperature the fridge can reach
%temp_fridge_min = temp_fridge - temp_fridge_flux % Minimum temperature the fridge can drop to

%temp_fridge_all = temp_fridge_min: 1: temp_fridge_max % Whole number temperatures inside the fridge range
%still buggy
%log((temp_desired - temp_fridge_all)*((temp_current - temp_fridge_all).^-1))*(-k.^-1)
fprintf('Dude it''s going to take %g hours to chill the drinks, the party is going to be over by then!', time_to_cool) % Prints results as a string
