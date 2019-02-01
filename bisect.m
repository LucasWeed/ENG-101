function[xr, fx, ea, it] = bisect(f, xL, xu, et)
% Function that finds roots using the bisect method
% Inputs:
% f = function being evaluated
% xL = lower x bound
% xu = upper x bound
% et = error tollerance
% Outputs
% xr = root estimate
% fx = function evaluated at x
% ea = magnitude of approx. rel. error

% Creatd by: Lucas Weed
% January 31, 2019

% Error for user entering <3 inputs
if nargin<3, error('At least 3 input arguments required'),end
% Checks if there is a sign change between the lower/upper
test = f(xL)*f(xu);
if test>0, error('No sign change f(xL) and f(xu)'), end


xr = xL; ea = 100;it=0;


for i = 1:50
    it=it+1;
    xrold = xr;
    xr = (xL + xu)/2;
    sgnchng = f(xL)*f(xr);
    
    if sgnchng<0
    xu = xr;
    ea = abs((xr-xrold)/xr)*100;
elseif sgnchng > 0
    xL = xr;
    ea = abs((xr-xrold)/xr)*100;
else
    ea = 0;
    end
if ea<et
    break
end
end
fx = f(xr);
end