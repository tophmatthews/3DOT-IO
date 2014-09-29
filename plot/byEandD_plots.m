r = 13; % radius of 50 inicide

efflist = []; elatlist = [];

% by E
Elist = linspace(1.0,8,30);
for i = Elist
    ff = 0;
    lat = 0;
    for j = 1:1:length(f.outE{r})
        if ( f.outE{r}(j) >= 10^i)% && (1 - f.r02cen{r}(j)) *f.radius(r) < 10
            if ( f.fuelHits{r}(j) == 0 )
            %if ( (f.fgHits{r}(j) + f.fuelHits{r}(j)) == 0 )
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

% dfflist = []; dlatlist = [];
% dlist = 1
% dlist = linspace(0,3,30);
% for i = dlist
%     ff = 0;
%     lat = 0;
%     for j = 1:1:length(f.outE{r})
%         if ( (f.rf2cen{r}(j) - 1)*f.radius(r) >= 10^i)
%             if ( (f.fgHits{r}(j) + f.fuelHits{r}(j)) == 0 )
%                 ff = ff + 1;
%             else
%                 lat = lat + 1;
%             end
%         end
%     end
%     dfflist(end+1) = ff;
%     dlatlist(end+1) = lat;
% end

lit_logen = [2.015, 2.299, 2.482, 2.701, 2.844, 3.005, 3.3, 3.483, 3.708, 4.002];
lit_logn = [-4.53,-4.682,-4.79,-4.945,-5.045,-5.148,-5.399,-5.572,-5.768,-6.05];

lit_logenp = [2.017,2.298,2.473,2.697,2.848,3.003,3.303,3.49,4.002];
lit_lognp = [-3.6,-3.911,-4.108,-4.365,-4.559,-4.77,-5.156,-5.422,-6.371];

figure
%subplot(1,2,1)
x = 10.^Elist;
yff = efflist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ 1e30;
ylat = elatlist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ 1e30;
ytot = yff + ylat;
hold on
plot(x,yff,'-','color',[0.33 0.41 0.47])
plot(x,ylat,'--','color',[0.80 0.36 0.27])
plot(x,ytot,':','color','k')

plot(10.^lit_logen, 10.^(lit_logn-19),'-')
plot(10.^lit_logenp, 10.^(lit_lognp-19),'--')
set(gca,'YScale','log','xscale','log')
hold off
xlabel('E_{min} [eV]')
ylabel('b''')
legend('FF','Fuel','Total','location','southwest')
%ylim([1 1000000])
box on

% subplot(1,2,2)
% x = 10.^dlist;
% yff = dfflist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
% ylat = dlatlist .* f.boxvol(r) ./ f.atoms(r) ./ f.fissions(r) ./ f.pathAvg(r) ./ 1e30 .* avgtravel;
% ytot = yff + ylat;
% hold on
% plot(x/10,yff,'-','color',[0.33 0.41 0.47])
% plot(x/10,ylat,'--','color',[0.80 0.36 0.27])
% plot(x/10,ytot,':','color','k')
% set(gca,'YScale','log','xscale','log')
% hold off
% xlabel(strcat('r_{min} [nm]'))
% ylabel('b''')
% legend('FF','Fuel','Total','location','southwest')
% box on
