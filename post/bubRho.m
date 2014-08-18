function [ arho ] = bubRho( calc, r, temp )
%bubRho Returns default rho, or calculated rho
if ~calc
    rho = 2.56; % g/cc
    arho = rho / 131.293 * 6.022e23 / 1e24;
else
    R = r / 1e10; % [m] conversion from Ang to m
    k = 1.38e-23; % [J/K]: boltzmann's constant
    B = 8.5e-29; % m^3/atom
    gamma = 1; % [N/m] surface tension
    sigma = 0; % hydrostatic tension

    arho = 1 / (B + 1 / ( ( 2*gamma/k/temp)/R + sigma / k / temp)); % atoms/m^3
    arho = arho / 1e30; % return atoms/Ang^3
end
end

