clear

r = linspace(-1,6,100);

ronchi_low = [];
ronchi_high = [];
VDW_ = [];
for i = 1:1:length(r)
    ronchi_low(i) = bubRho(2,10^r(i),1000); % input is ang
    ronchi_mid(i) = bubRho(2,10^r(i),1500);
    ronchi_high(i) = bubRho(2,10^r(i),2000);
    VDW(i) = bubRho(1,10^r(i),1500);
end

%figure
hold on
plot(10.^(r-1),ronchi_high*1000,'-.','color',[0.80 0.36 0.27])
plot(10.^(r-1),ronchi_mid*1000,'k')
plot(10.^(r-1),ronchi_low*1000,'--','color',[0.33 0.41 0.47])
plot(10.^(r-1),VDW*1000,':','color',[0.50 0.7 0.44])
legend('Combined 2000 K','Combined 1500 K', 'Combined 1000 K', 'van der Waals 2000 K','location','southwest')
set(gca, 'XScale','log','YScale','log')
xlabel('Bubble radius [nm]')
ylabel('Atomic density [atom/nm^3]')
box on
xlim([0.1, 1000])
