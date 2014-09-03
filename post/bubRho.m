function [ arho ] = bubRho( calc, r, temp )
%bubRho Returns default rho, or calculated rho
if (calc == 0)
    rho = 2.56; % g/cc
    arho = rho / 131.293 * 6.022e23 / 1e24;
elseif (calc == 1)
    R = r / 1e10; % [m] conversion from Ang to m
    k = 1.38e-23; % [J/K]: boltzmann's constant
    B = 8.5e-29; % m^3/atom
    gamma = 1; % [N/m] surface tension
    sigma = 0; % hydrostatic tension

    arho = 1 / (B + 1 / ( ( 2*gamma/k/temp)/R + sigma / k / temp)); % atoms/m^3
    arho = arho / 1e30; % return atoms/Ang^3
else
    if (r > 1000)
        R = r / 1e10; % [m] conversion from Ang to m
        k = 1.38e-23; % [J/K]: boltzmann's constant
        B = 8.5e-29; % m^3/atom
        gamma = 1; % [N/m] surface tension
        sigma = 0; % hydrostatic tension

        arho = 1 / (B + 1 / ( ( 2*gamma/k/temp)/R + sigma / k / temp)); % atoms/m^3
        arho = arho / 1e30; % return atoms/Ang^3
    else  
        aden_1000 = [1.29E+27,1.43E+26,1.45E+25,1.45E+24,1.60E+27,3.19E+27,4.79E+27,6.39E+27,7.98E+27,9.57E+27,1.12E+28,1.28E+28,1.44E+28,1.60E+28,1.76E+28,1.92E+28,2.08E+28,2.23E+28,2.39E+28,2.55E+28,2.71E+28,2.87E+28,3.03E+28,3.19E+28];
        aden_2000 = [6.83E+26,7.20E+25,7.24E+24,7.25E+23,1.60E+27,3.19E+27,4.79E+27,6.39E+27,7.98E+27,9.57E+27,1.12E+28,1.28E+28,1.44E+28,1.60E+28,1.76E+28,1.92E+28,2.08E+28,2.23E+28,2.39E+28,2.55E+28,2.71E+28,2.87E+28,3.03E+28,3.19E+28];
        rad_1000 = [1000,10000,100000,1000000,869.5652174,401.6064257,240.3846154,155.8846454,103.8961039,69.78367062,46.93733865,31.63555837,21.42015637,14.6092038,10.0517666,6.979828296,4.888660751,3.447859741,2.442121715,1.730507991,1.220077597,0.849062211,0.57613311,0.373703948];
        rad_2000 = [1000,10000,100000,1000000,412.371134,184.501845,108.401084,70.39774727,47.95013186,33.44481605,23.62669817,16.82227269,12.04311435,8.663634395,6.261544723,4.546177801,3.314770618,2.425212509,1.778141309,1.303865963,0.953506999,0.692633496,0.49692404,0.349187615];
    
        if (temp == 1000)
            aden = aden_1000;
            rad = rad_1000;
        else
            aden = aden_2000;
            rad = rad_2000;
        end
        arho = spline(rad,aden,r);
        arho = arho / 1e30; % return atoms/Ang^3
    end
    
end
end

