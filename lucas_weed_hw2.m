%% Lucas Weed Homework 2



%% Question 1 Sine function
clc;
clear all;

% Function for approximating sin
sinf = @(k,x) (-1).^k.*((x.^(2.*k+1))./factorial(2.*k+1));
x=pi/3;         % x value we are evaluating
sum = 0;        % Current sum
error = 0;      % True error
true = sin(x);  % True value of sin(x)
marpe = 0;      % Magnitude of the Approximate Percent Relative Error

% Start of the output table
fprintf('# of terms     Estimate       True Error          MARPE\n')
fprintf('----------    ----------     ------------        -------\n')

% For loop that sums values of sinf
for i = 0:1:6
    val = sinf(i,x);                    % Current value of the func.
    sum = sum+val;                      % Sum of the values
    error = true-sum;                   % Current true error
    marpe = 100*abs((sum-sum-val)/sum); % Current MARPE
    % Print data for table
    fprintf('    %.0f        %.10f   %.10f    %.10f\n',i,sum,error,marpe)
end
%% Question 2 - Toy rocket
clc;
clear all;

y0 = 1.5;       % Initial height
x = 105;        % Horizontal distance traveled
g = 3.771;      % Accelleration due to gravity on mars
v0 = 25;        % Initial velocity
target = 2      % Height of target

% Function for the trajectory of a toy rocket
y = @(theta) y0 + tand(theta).*x-(g/2).*(x./(v0.*cosd(theta))).^2 - target;

figure(1)
fplot(y,[10,80])

% CHANGE TITLE
title('Sample text')
xlabel('\theta [degrees]')
ylabel('Height [meters]')

fprintf('Based on the graph, 2 solutions exist')
fprintf(' at around 20 and 70 degrees\n')

x1f = fzero(y,20)
x2f = fzero(y,70)

x1b = bisect(y,15,25,0.0001)
x2b = bisect(y,65,75,0.0001)

figure(2)
fplot(y,[10,80])
hold on
plot(x1f,y(x1f),'or',x2f,y(x2f),'og',x1b,y(x1b),'*r',x2b,y(x2b),'*g')
legend('y(x)','1st sol. fzero','2nd sol. fzero','1st sol. bisect','2nd sol. bisect', 'Location','southwest')
figure(3)
plot(0:1:100,y(x1f))

figure(3)
t1 = @(dist) y0 + tand(x1f).*dist-(g/2).*(dist./(v0.*cosd(x1f))).^2-target
t2 = @(dist) y0 + tand(x2f).*dist-(g/2).*(dist./(v0.*cosd(x2f))).^2-target
fplot(t1,[0,105],'r')
hold on
fplot(t2,[0,105],'b')
title('Trajectory of toy missile')
xlabel('Horizontal Distance [meters]')
ylabel('Height above target [meters]')
legend('t1','t2', 'Location','northeast')
hold off
%% Question 3 - Root finding with bisection
clc;
clear all;

% Function will will be evaluating
f = @(x) 0.0025.*exp(3.*x).*cos(x)+0.1;
%Plot the function
figure(4)
fplot(f,[0,5]);
% Find the first zero using user written bisect function
[xr1, fx1, ea1,it1]=bisect(f,0,4,0.0001);
fprintf('Using 0 and 4 as the bounds\n\n')
fprintf('    Root           Iterations\n')
fprintf('   ------          ----------\n')
fprintf('%.10f           %1.0f\n\n',xr1,it1)
% Find the 2nd zero using user written bisect function
[xr2, fx2, ea2,it2]=bisect(f,4,5,0.0001);
fprintf('Using 4 and 5 as the bounds\n\n')
fprintf('    Root           Iterations\n')
fprintf('   ------          ----------\n')
fprintf('%.10f           %1.0f\n',xr2,it2)
% Plot the function and solutions
figure(5)
fplot(f,[0,5])
hold on
plot(xr1,f(xr1),'*r')
plot(xr2,f(xr2),'*g')
title('Plot of 0.0025*exp(3*x)*cos(x)+0.1')
xlabel('x')
ylabel('y(x)')