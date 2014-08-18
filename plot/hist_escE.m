
%list = [7,9,15,27,42,52,70,75,85];
list = [1,5,7,16,18,29,33,34];

figure('units','normalized','outerposition',[0 0 1 1])

% for i = 1:1:9
%     subplot(3,3,i)
%     hist(log10(f.outE{list(i)}), 30)        
%     t = strcat('combo# = ', num2str(list(i)),'  r = ',num2str(f.radius(list(i))), '  box = ', num2str(f.box(list(i)))); 
%     title(t)
% end


for i = 1:1:8
    subplot(2,4,i)
    [counts, centers] = hist(f.outE{list(i)}, 5000);
    ppp = bar(centers/1e6,log10(counts)/log10(max(counts)),1,'FaceColor','k');
    t1 = strcat('r = ',num2str(f.radius(list(i))));
    if f.radius(i) == 10
        t2 = strcat('Half-max volume ratio = N/A');
    else
        %t2 = strcat('Half-max volume ratio = ', sprintf('%.2f',spline(counts,centers,mean(counts))));
    end
    title(t1)
    xlabel(x_label)
    xlim([0 1])
    %ylim([0 0.1])
end