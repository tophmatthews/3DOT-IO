boxlist = [4,8,9,13,17,18,22,26,27,31,35];
erlist = make_erlist( 10.01, f.escEr );

L = length(f.radius);

fuel = zeros(1,L);
met = zeros(1,L);
nonmet = zeros(1,L);
ff = zeros(1,L);
gas = zeros(1,L);
for i = 1:1:L
    %fuel in lineage
    tot = length(e.fuelHits{i});
    fuel(i) = sum( e.fuelHits{i} > 0 ) / tot;
    ffgas(i) = 1 - fuel(i);
    
    %parent contribution
    met(i) = sum( e.parent{i} > 90 ) / tot;
    nonmet(i) = sum( e.parent{i} < 10 ) / tot;
    ff(i) = sum(( e.fgHits{i} + e.fuelHits{i})==0 ) / tot;
    gas(i) = 1 - met(i) - nonmet(i) - ff(i);
end

x = f.radius/10;

figure
hold on
plot(x(boxlist),fuel(boxlist),'k')
%plot(x,ffgas,'bd')
plot(x(boxlist),gas(boxlist),'o','color',[0.33 0.41 0.47],'markersize',5)
plot(x(boxlist),met(boxlist),'g+','markersize',5)
plot(x(boxlist),nonmet(boxlist),'mx','markersize',5)
plot(x(boxlist),ff(boxlist),'*','color',[0.80 0.36 0.27],'markersize',5)
set(gca, 'xscale','log')
ylim([0 1])
%xlim([0.8 5.2])

xlabel(strcat('Radius [nm]'));
ylabel('Fraction of total escaped')
hleg = legend('Fuel decendent','FG parent','Uranium parent','Carbon parent','FF parent');
set(hleg, 'location', 'eastoutside');
hold off
box on