

list = [1,20,47,53];

%legacy list
list = [1,8,16,26]
    
figure('units','normalized','outerposition',[0 0 1 1])


%%%%%% --- Plot r02cen by radius --- %%%
% what = cell(1,length(e.r02cen));
% for i =1:1:length(e.r02cen)
%     what{i} = e.r02cen{i};
% end
% whichc = 'C_r = ';
% x_label = 'R_{birth} / R_{bubble}';

% % %%% --- Plot r02cen by volume --- %%%
what = cell(1,length(e.r02cen));
for i =1:1:length(e.r02cen)
    what{i} = e.r02cen{i}.^3;
end
whichc = 'C_V = ';
x_label = 'V_{birth} / V_{bubble}';


%%% CDF
for i = 1:1:4
    subplot(1,4,i)
    [counts, centers] = hist(what{list(i)}, 50);
    asdf = [];
    for j = 1:1:length(counts)
        asdf(end+1) = sum(counts(1:j)) / sum(counts);
    end
    bar(centers,asdf,1,'FaceColor','k');
    %set(gca,'xtick',[0 0.5 1],'tickdir','out')
    %set(gca,'ytick',[0 0.5 1])
    t1 = strcat('r = ',num2str(f.radius(list(i))/10),' nm');
    %t2 = strcat(whichc, sprintf(' %.3f',spline(asdf(1:end-3),centers(1:end-3),0.5)));
    %title({t1,t2})
    title(t1);
    %xlabel(x_label)
    %set(gca,'YTickLabel',[])
    %xlim([0 1])
    %ylim([0 0.1])
    %ylim([0 1])
    grid on
end