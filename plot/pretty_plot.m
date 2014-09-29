%%% esc plots by rim center %%%
clear

radius = [5,11,23,50,108,232,500,1077,2321,5000,10000];
boxsize = [50,108,232,500,1077,2321,5000,10772,23208,50000,100000];
all = [2.3813,2.0962,1.7983,1.4926,1.2704,1.139,1.0826,1.0255,1.004,0.98495,0.9974];
rim = [2.3813,2.0948,1.5211,0.82726,0.41977,0.20355,0.09877,0.045506,0.021189,0.010349,0.0058487];
center = [0,0.001449,0.27722,0.6653,0.85066,0.93548,0.98388,0.97994,0.98283,0.9746,0.99155];

figure
hold on
s = 'sgolay';
%plot(radius/10,smooth(all,s),'color',[0.80 0.36 0.27])
%plot(radius/10,smooth(rim,s),'--','color',[0.33 0.41 0.47])
%plot(radius/10,smooth(center,s),'-.','color',[0.50 0.9 0.14])
plot(radius/10,(all),'color',[0.80 0.36 0.27])
plot(radius/10,(rim),'--','color',[0.33 0.41 0.47])
plot(radius/10,(center),'-.','color',[0.50 0.9 0.14])
box on
%plot(radius,u22,radius,u21,radius,u12)
%plot(radius,u22,'.',radius,u21,'.',radius,u12,'.')
hold off

set(gca, 'XScale','log','YScale','linear')
legend('All atoms', 'Rim atoms', 'Center atoms')
xlabel('Bubble radius [nm]')
ylabel('b x10^{25}')
xlim([.3 1e3])


%%% esc plots by EOS %%%

radius = [5,11,23,50,108,232,500,1077,2321,5000];
boxsize = [50,108,232,500,1077,2321,5000,10772,23208,50000];
u22 = [2.3813,2.0962,1.7983,1.4926,1.2704,1.139,1.0826,1.0255,1.004,0.98495];
u21 = [2.5348,2.3113,2.0134,1.6355,1.3582,1.2141,1.1104,1.0525,1.0552,1.0065];
u12 = [2.3396,2.0245,1.6438,1.2373,0.91545,0.73072,0.64824,0.62581,0.59144,0.58856];

figure
hold on
s = 'sgolay';
plot(radius/10,smooth(u22,s),'color',[0.80 0.36 0.27])
plot(radius/10,smooth(u12,s),'--','color',[0.33 0.41 0.47])
plot(radius/10,smooth(u21,s),'-.','color',[0.50 0.9 0.14])
box on
%plot(radius,u22,radius,u21,radius,u12)
%plot(radius,u22,'.',radius,u21,'.',radius,u12,'.')
hold off

set(gca, 'XScale','log','YScale','linear')
legend('Combined 2000 K', 'Combined 1000 K', 'van der Waals 2000 K')
xlabel('Bubble radius [nm]')
ylabel('b x10^{25}')
xlim([.3 1e3])




%%% esc plots by EMin
clear

radius = [5,11,23,50,108,232,500,1077,2321,5000];
boxsize = [50,108,232,500,1077,2321,5000,10772,23208,50000];
eV50 = [2.7787,2.6778,2.5044,2.2083,1.9249,1.7399,1.6528,1.5762,1.5353,1.5115];
eV150 = [2.6926,2.5184,2.2685,1.9258,1.6484,1.4824,1.402,1.3337,1.3001,1.2782];
eV300 = [2.3813,2.0962,1.7983,1.4926,1.2704,1.139,1.0826,1.0255,1.004,0.98495];
eV600 = [1.2233,1.1103,0.98586,0.8459,0.74066,0.6766,0.64505,0.61468,0.6074,0.59628];
eV1000 = [0.73614,0.68275,0.61825,0.54378,0.48771,0.45036,0.42984,0.41401,0.41488,0.40207];

figure
hold on
s = 'sgolay';
plot(radius/10,smooth(eV50,s),':','color','k')
plot(radius/10,smooth(eV150,s),'--','color',[0.1 0.5 0.1])
plot(radius/10,smooth(eV300,s),'color',[0.80 0.36 0.27])
plot(radius/10,smooth(eV600,s),'-.','color',[0.30 0.56 0.87])
%plot(radius/10,smooth(eV1000,s),':','color',[0.1 0.5 0.1])

% plot(radius/10,eV50,'.','color',[0.80 0.36 0.27])
% plot(radius/10,(eV150),'.','color',[0.33 0.41 0.47])
% plot(radius/10,(eV300),'.','color',[0.50 0.9 0.14])
% plot(radius/10,(eV600),'.','color',[0.80 0.36 0.27])
% plot(radius/10,(eV1000),'.','color',[0.33 0.41 0.47])


set(gca, 'XScale','log','YScale','linear')
legend('E_{min} = 50 eV','E_{min} = 150 eV','E_{min} = 300 eV','E_{min} = 600 eV','E_{min} = 1000 eV')
xlabel('Bubble radius [nm]')
ylabel('b x10^{25}')
xlim([.3 1e3])
%annotation('textbox',[0.85 0.28 0.1 0.1],'String','50 eV','linestyle','none');
%annotation('textbox',[0.85 0.24 0.1 0.1],'String','150 eV','linestyle','none');

box on
hold off


%%% parental plots %%%

radius = [5,11,23,50,108,232,500,1077,2321,5000,10000];
boxsize = [50,108,232,500,1077,2321,5000,10772,23208,50000,100000];
ff = [0.070034,0.073936,0.079949,0.087477,0.093692,0.096134,0.095175,0.099087,0.10027,0.10177,0.10218];
met = [0.83257,0.78772,0.73484,0.67728,0.63418,0.60507,0.59418,0.58287,0.57728,0.56851,0.56874];
gas = [0.067321,0.1093,0.15653,0.2076,0.24539,0.27125,0.28505,0.29244,0.29666,0.3036,0.30455];
nonmet = [0.030071,0.029042,0.02868,0.027641,0.026746,0.02755,0.025594,0.025605,0.025783,0.026115,0.024536];
fuel = [0.92418,0.9155,0.90387,0.88763,0.87244,0.86306,0.86159,0.85473,0.85208,0.84711,0.84798];

figure
hold on
s = 'sgolay';
plot(radius/10,smooth(met,s),':','color','k')
plot(radius/10,smooth(gas,s),'-.','color',[0.1 0.5 0.1])
plot(radius/10,smooth(ff,s),'color',[0.80 0.36 0.27])
plot(radius/10,smooth(nonmet,s),'--','color',[0.30 0.56 0.87])

set(gca, 'XScale','log','YScale','linear')
legend('Fuel cascade','Non-fuel cascade','location','east')
xlabel('Bubble radius [nm]')
ylabel('Fraction of implanted ions')
ylim([0 1.0])
xlim([.3 2e3])

box on
hold off

%%% fuel decendent plots %%%

radius = [5,11,23,50,108,232,500,1077,2321,5000,10000];
fuel = [0.92418,0.9155,0.90387,0.88763,0.87244,0.86306,0.86159,0.85473,0.85208,0.84711,0.84798];

figure
hold on
s = 'sgolay';
plot(radius/10,smooth(fuel,s),'color',[0.80 0.36 0.27])
plot(radius/10,smooth(1-fuel,s),'--','color',[0.30 0.56 0.87])

set(gca, 'XScale','log','YScale','linear')
legend('Uranium parent','Fission gas parent','Fission fragment parent','Carbon parent')
xlabel('Bubble radius [nm]')
ylabel('Fraction of implanted ions')
ylim([0 1.1])
xlim([.3 2e3])

box on
hold off

%%% esc vs emin %%%

eng = [10,17.4333,30.392,52.9832,92.3671,161.0262,280.7216,489.3901,853.1679,1487.3521,2592.9438,4520.3537,7880.4628,13738.238,23950.2662,41753.1894,72789.5384,126896.1003,221221.6291,385662.0421,672335.7536,1172102.2975,2043359.7179,3562247.8903,6210169.4189,10826367.3387,18873918.2214,32903445.6231,57361525.1045,100000000];
ylat = [2.1302e-25,2.0964e-25,2.0491e-25,1.9783e-25,1.8693e-25,1.6979e-25,1.3855e-25,8.7062e-26,5.2698e-26,3.1206e-26,1.7941e-26,9.921e-27,5.3647e-27,2.864e-27,1.5065e-27,7.6959e-28,3.5928e-28,1.4494e-28,6.5323e-29,2.2455e-29,1.0207e-29,2.0414e-30,0,0,0,0,0,0,0,0];
yff = [2.3222e-26,2.2945e-26,2.2602e-26,2.2067e-26,2.1197e-26,1.9875e-26,1.7262e-26,1.3091e-26,9.6883e-27,7.1611e-27,5.1912e-27,3.7459e-27,2.5701e-27,1.7617e-27,1.1085e-27,7.2672e-28,4.8176e-28,3.2049e-28,1.5923e-28,1.0003e-28,5.9199e-29,1.8372e-29,8.1654e-30,2.0414e-30,0,0,0,0,0,0];

figure
hold on
s = 'sgolay';
plot(eng,smooth(ylat.*1e25,s),'color',[0.80 0.36 0.27])
plot(eng,smooth(yff.*1e25,s),'--','color',[0.30 0.56 0.87])
plot(eng,smooth(ylat.*1e25+yff.*1e25,s),':','color','k')

set(gca, 'XScale','log','YScale','log')
legend('Fuel cascade','Fission Fragment','Total','location','southwest')
xlabel('Bubble radius [nm]')
ylabel('b x10^{25}')
ylim([1e-5 1e1])
xlim([8 2e6])

box on
hold off
