r = 5; % radius of 50 inicide

efflist = []; elatlist = [];

% by E
Elist = linspace(1.2,6,10);
for i = Elist
    ff = 0;
    lat = 0;
    for j = 1:1:length(f.outE{r})
        if ( f.outE{r}(j) >= 10^i)% && (1 - f.r02cen{r}(j)) *f.radius(r) < 10)
            if ( (f.fgHits{r}(j) + f.fuelHits{r}(j)) == 0 )
                ff = ff + 1;
            else
                lat = lat + 1;
            end
        end
    end
    efflist(end+1) = ff;
    elatlist(end+1) = lat;
end

% by d

dfflist = []; dlatlist = [];
dlist = linspace(0,3,30);
for i = dlist
    ff = 0;
    lat = 0;
    for j = 1:1:length(f.outE{r})
        if ( (f.rf2cen{r}(j) - 1)*f.radius(r) >= 10^i)
            if ( (f.fgHits{r}(j) + f.fuelHits{r}(j)) == 0 )
                ff = ff + 1;
            else
                lat = lat + 1;
            end
        end
    end
    dfflist(end+1) = ff;
    dlatlist(end+1) = lat;
end

figure
subplot(1,2,1)
x = 10.^Elist;
yff = efflist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
ylat = elatlist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
ytot = yff + ylat;
hold on
plot(x,yff,'-','color',[0.33 0.41 0.47])
plot(x,ylat,'--','color',[0.80 0.36 0.27])
plot(x,ytot,':','color','k')
set(gca,'YScale','log','xscale','log')
hold off
xlabel('E_{min} [eV]')
ylabel('b''')
legend('FF','Fuel','Total','location','southwest')
%ylim([1 1000000])
box on

subplot(1,2,2)
x = 10.^dlist;
yff = dfflist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
ylat = dlatlist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
ytot = yff + ylat;
hold on
plot(x/10,yff,'-','color',[0.33 0.41 0.47])
plot(x/10,ylat,'--','color',[0.80 0.36 0.27])
plot(x/10,ytot,':','color','k')
set(gca,'YScale','log','xscale','log')
hold off
xlabel(strcat('r_{min} [nm]'))
ylabel('b''')
legend('FF','Fuel','Total','location','southwest')
box on
