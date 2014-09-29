avgtravel = 82698.69;

Emin = 300;
dmin = 50;

f.esc = [];
for i = 1:1:length(f.outE)
    f.esc(end+1) = sum(f.outE{i} > Emin);
end

% only do half
% for i = 1:1:length(f.outE)
%     asdf = 0;
%     for j = 1:1:length(f.outE{i})/4
%         if (f.outE{i}(j) > Emin)
%             asdf = asdf + 1;
%         end
%     end
%     f.esc(end+1) = asdf;
% end

% f.fudge = 0 + 0.1*f.radius;
% 
% f.escRim = [];
% f.escCenter = [];
% for i = 1:1:length(f.outE)
%     asdf = 0;
%     for j = 1:1:length(f.outE{i})
%         if (f.outE{i}(j) > Emin && (1 - f.r02cen{i}(j)) * f.radius(i) < f.fudge(i) )
%             asdf = asdf + 1;
%         end
%     end
%     f.escRim(end+1) = asdf;
%     f.escCenter(end+1) = f.esc(i) - asdf;
% end



erlist = make_erlist( .005, f.escEr );

% boxlist = [];
% for i=1:1:length(f.box)
%     if f.box(i) == f.radius(i) * 10;
%         boxlist(end+1) = i;
%     end
% end

boxlist = [4,8,9,13,17,18,22,26,27,31,35,36,37];
%boxlist = linspace(1,length(f.radius),length(f.radius));

figure
x = f.radius./10.0;
logx = log10(x);

realesc = f.esc - (f.backInAvg .* f.fissions);

b = f.esc .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30;% .* f.fudge;
%brim = f.escRim .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30;% .* f.fudge;
%bcenter = f.escCenter .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30;% .* f.fudge;

%bprime = b .* avgtravel ./ f.pathAvg ;
%bprime2 = b.*avgtravel./(f.box.*f.passAvg);
%bprime3 = b .* avgtravel ./ calcPath;
%bprimerim = brim .* avgtravel ./ f.pathAvg;
%bprimecenter = bcenter .* avgtf.rravel ./ f.pathAvg;

z = f.box;
er = (f.escEr + 0.00001) .* 20000;
hold on
h1 = gscatter(x(boxlist),f.esc(boxlist),z(boxlist));
%h2 = gscatter(x(boxlist),f.escRim(boxlist),z(boxlist));
%h3 = gscatter(x(boxlist),f.escCenter(boxlist),z(boxlist));
set(h1,'Marker','.','Markersize',10)
%set(h2,'Marker','*','Markersize',10)
%set(h3,'Marker','o','Markersize',10)
set(gca, 'XScale','log','YScale','linear','xtick',[1e1, 1e2, 1e3, 1e4, 1e5])
graph_title = horzcat('b. Emin: ', num2str(Emin), '  dmin: ', num2str(dmin));
%title(graph_title)
ylabel('Re-solution parameter')
%ylabel('log \epsilon\prime [# esc/# in bubble] / [fsn/m^3 s]')
%ylabel('log \epsilon [# esc/# in bubble] / [fsn/m^3 s]')
xlabel('radius [nm]');
legend off
%ylim([4e-26 3e-25])
%xlim([7e-1 2e4])
box on

hold off



%figure
%loglog(x,bprime,'bo',x,bprimerim,'k*',x,bprimecenter,'cd')
%legend('all','rim','center')
%graph_title = horzcat('b. Emin: ', num2str(Emin), '  dmin: ', num2str(dmin));
%title(graph_title)



