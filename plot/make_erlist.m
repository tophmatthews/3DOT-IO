function [ erlist ] = make_erlist( maxEr, escEr )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

erlist = [];
for i = 1:1:length(escEr)
    if escEr(i) <= maxEr
        erlist(end+1) = i;
    end
end

end

