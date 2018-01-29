%% In-class Assignment 2 - Heat Transfer Analysis
% Lucas Weed
% ENG 101-03
% 01/29/2018
%
%% Part 1 - R/L Current (Inductive Circuit)
clc;
clear all;

% Variables
time = 0:.1:4; % Time in seconds, intervals of .1 second

R1 = 4;   % Resistance = 4 Ohms
R2 = 3;   % Resistance = 3 Ohms
R3 = 2;   % Resistance = 2 Ohms
R4 = 1;   % Resistance = 1 Ohms
R5 = 0.5; % Resistance = 0.5 Ohms

L = 2; % Inductance = 2 Henrys

% Calculations
i1 = 10-2*(exp(-(R1/L)*time)); % Amperes when R = 4
i2 = 10-2*(exp(-(R2/L)*time)); % Amperes when R = 3
i3 = 10-2*(exp(-(R3/L)*time)); % Amperes when R = 2
i4 = 10-2*(exp(-(R4/L)*time)); % Amperes when R = 1
i5 = 10-2*(exp(-(R5/L)*time)); % Amperes when R = 0.5

% Plotting
p = plot(time, i1, time, i2, 'y', time, i3,  'g', time, i4, 'b', time, i5, 'm');

% Make the graphs good looking colors
p(1).Color = '[.9, 0, 0]';  % Line one is red
p(2).Color = '[1, .5, 0]';  % Line one is orange
p(3).Color = '[1, .9, 0]';  % Line one is yellow
p(4).Color = '[0, .75, 0]'; % Line one is green
p(5).Color = '[0, 0, .75]'; % Line one is blue

% Give the graphs different looking markers
p(1).Marker = 'o'; % Line one has circles
p(2).Marker = '*'; % Line one has an asterisk
p(3).Marker = 's'; % Line one has squares
p(4).Marker = '+'; % Line one has a plus sign
p(5).Marker = '^'; % Line one has triangles

% Label things
title('Current running through R/L circuit'); % Graph title
xlabel('Time (t) in seconds'); % X-axis label
ylabel('i(t), Cuttent in Amperes'); % Y axis label
legend('4 Ohms', '3 Ohms', '2 Ohms', '1 Ohms', '0.5 Ohms', 'location', 'southeast'); % Legend in bottom right corner


%% Part 2 - COE Enrollment
clc;
clear all;

% Enrollment for each major in the COE
AE = 148; % Aerospace
CHE = 56; % Chemical
CE  = 29; % Civil
CPE = 73; % Computer
EE  = 30; % Electrical
ISE = 13; % Industrial Systems
ME = 143; % Mechanical
OPE =  4; % Optics
UND = 50; % Undecided

% Vectors for Pie chart
Total_Enrollemt = [AE, CHE, CE, CPE, EE, ISE, ME, OPE, UND]; % Vecor for data points
labels = {'Aerospace', 'Chemical', 'Civil', 'Computer', 'Electrical', 'Industrial Systems', 'Mechanical', 'Optical', 'Undecided'}; % Labels

% Plot
pie(Total_Enrollemt, labels);
title('Enrollment by major in the College of Engineering at UAH during 2015');