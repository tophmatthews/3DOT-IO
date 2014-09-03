
Emin = 300;
dmin = 50;

f.esc = [];
for i = 1:1:length(f.outE)
    f.esc(end+1) = sum(f.outE{i} > Emin);
end

f.fudge = 10 + f.radius .* 0;

f.esc = [];
for i = 1:1:length(f.outE)
    asdf = 0;
    for j = 1:1:length(f.outE{i})
        if (f.outE{i}(j) > Emin && (1 - f.r02cen{i}(j)) * f.radius(i) < f.fudge(i) )
            asdf = asdf + 1;
        end
    end
    f.esc(end+1) = asdf;
end

% f.dist = {};
% for i = 1:1:length(f.rf2cen)
%     temp = ( (f.rf2cen{i} - 1)*f.radius(i) );
%     f.dist{end+1} = temp;
% end
% 
% f.asdf = [];
% for i = 1:1:length(f.dist)
%     temp = 0;
%     it = 0;
%     for j = 1:1:length(f.dist{i})
%         if f.dist{i}(j) > 1
%             temp = temp + f.dist{i}(j) * f.outE{i}(
% temp = sum(f.dist{i} .* f.outE{i});
%     temp = temp / length(f.dist{i});
%     f.asdf(end+1) = temp;
% end
        
        

erlist = make_erlist( .01, f.escEr );

boxlist = [];
% for i=1:1:length(f.box)
%     if length(find(f.box(i) == f.box)) >= 3
%         boxlist(end+1) = i;
%     end
% end

figure
x = f.radius./10.0;

b = f.esc .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30;
bprime = b .* avgtravel ./ f.pathAvg;
z = f.box;
e = (f.escEr + 0.00001) .* 20000;
%gscatter(log10(x),log10(bprime),f.box)
h2 = gscatter((x(boxlist)),(b(boxlist)),z(boxlist));
h2 = gscatter((x),(b),z);
hold on
h1 = gscatter((x),(bprime),z);
set(h1,'Marker','*','Markersize',10)
set(h2,'Marker','o','Markersize',10)
set(gca, 'XScale','log','YScale','linear','xtick',[1e1, 1e2, 1e3, 1e4, 1e5])
graph_title = horzcat('b. Emin: ', num2str(Emin), '  dmin: ', num2str(dmin));
%title(graph_title)
ylabel('Re-solution parameter')
%ylabel('log \epsilon\prime [# esc/# in bubble] / [fsn/m^3 s]')
%ylabel('log \epsilon [# esc/# in bubble] / [fsn/m^3 s]')
xlabel('radius [nm]');
hold off
legend off
%ylim([4e-26 3e-25])
%xlim([7e-1 2e4])
box on



% 
% 
% f.esc = [];
% for i = 1:1:length(f.rf2cen)
%     f.esc(end+1) = sum(f.rf2cen{i} > 2);
%     %f.esc(end+1) = sum((f.rf2cen{i} - 1) * f.radius(i) > dmin);
% end
% 
% erlist = make_erlist( .01, f.escEr );
% 
% boxlist = [];
% for i=1:1:length(f.box)
%     if length(find(f.box(i) == f.box)) >= 2
%         boxlist(end+1) = i;
%     end
% end
% 
% figure
% x = f.radius./10;
% b = f.esc .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30 ;
% bprime = b .* avgtravel ./ f.pathAvg;
% z = f.box;
% e = (f.escEr + 0.00001) .* 20000;
% %gscatter(log10(x),log10(bprime),f.box)
% hold on
% h1 = gscatter((x),(bprime),z);
% set(h1,'Marker','*','Markersize',3)
% set(gca, 'XScale','log','YScale','log','xtick',[1e1, 1e2, 1e3, 1e4, 1e5])
% graph_title = horzcat('b. Emin: ', num2str(Emin), '  dmin: ', num2str(dmin));
% %title(graph_title)
% ylabel('b\prime')
% %ylabel('log \epsilon\prime [# esc/# in bubble] / [fsn/m^3 s]')
% %ylabel('log \epsilon [# esc/# in bubble] / [fsn/m^3 s]')
% xlabel('radius [nm]');
% hold off
% legend off
% %ylim([5e-26 4e-25])
% xlim([7e-1 2e4])


