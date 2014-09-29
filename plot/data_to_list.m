function [ y ] = data_to_list( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

y = '[';

for i=1:1:length(x)
    %y = y+x(i);
    y = strcat(y,num2str(x(i)),',');
end
y = strcat(y(1:end-1),']');
    

end

