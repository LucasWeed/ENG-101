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

time_to_cool = (log((temp_desired-temp_fridge)/(temp_current-temp_fridge))/-k) % Solve Newton's law of cooling for t.