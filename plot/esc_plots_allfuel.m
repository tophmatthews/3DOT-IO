Emin = 300;


ucf.esc = [];
for i = 1:1:length(ucf.outE)
    ucf.esc(end+1) = sum(ucf.outE{i} > Emin);
end

unf.esc = [];
for i = 1:1:length(unf.outE)
    unf.esc(end+1) = sum(unf.outE{i} > Emin);
end

umf.esc = [];
for i = 1:1:length(umf.outE)
    umf.esc(end+1) = sum(umf.outE{i} > Emin);
end



figure
ucx = ucf.radius ./ 10;
ucy = ucf.esc .* ucf.boxvol ./ ucf.atoms ./ ucf.fissions ./ 1e30  .* uc_avgtravel ./ ucf.pathAvg;
ucz = ucf.box;

umx = umf.radius ./ 10;
umy = umf.esc .* umf.boxvol ./ umf.atoms ./ umf.fissions ./ 1e30  .* um_avgtravel ./ umf.pathAvg;
umz = umf.box;

unx = unf.radius ./ 10;
uny = unf.esc .* unf.boxvol ./ unf.atoms ./ unf.fissions ./ 1e30  .* un_avgtravel ./ unf.pathAvg;
unz = unf.box;

hold on
huc = plot(ucx,ucy,'k*');
hun = plot(unx,uny,'s','color',[0.80 0.36 0.27]);
hum = plot(umx,umy,'o','color',[0.33 0.41 0.47]);
set(gca, 'XScale','log','YScale','linear','xtick',[1e1, 1e2, 1e3, 1e4, 1e5])
ylabel('b\prime')
xlabel('radius [nm]');

%set(h1,'Marker','*','Markersize',3)
%set(h2,'Marker','o','Markersize',5)

hold off
legend('Carbide', 'Nitride', 'Metal')
%ylim([5e-26 4e-25])
xlim([7e-1 2e4])