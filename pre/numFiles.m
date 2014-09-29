function [ num ] = numFiles( radius, precision )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = [10,1e4];
if precision == 0.01
    y = [7,1884];
elseif precision == 0.001
    y = [68, 18825];
else
    disp('invalid precision')
    return
end

m = (y(2) - y(1)) / (x(2) - x(1));

num = y(1) + (radius - x(1)) * m;

num = ceil(num);
end

