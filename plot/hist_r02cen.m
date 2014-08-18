
list = [1,5,7,20,27,42,48,53];

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

%%%% PDF
% for i = 1:1:8
%     subplot(2,4,i)
%     [counts, centers] = hist(what{list(i)}, 50);
%     bar(centers,counts/sum(counts),1,'FaceColor','k');
%     set(gca,'xtick',[0 0.5 1])
%     set(gca,'ytick',[0 0.05 .10])
%     t1 = strcat('r = ',num2str(f.radius(list(i))));
%     if f.radius(i) == 1
%         t2 = strcat('Mean = N/A');
%     else
%         t2 = strcat('Mean = ', sprintf('%.2f',spline(counts(2:end),centers(2:end),mean(counts))));
%     end
%     title({t1,t2})
%     %title(t1);
%     %xlabel(x_label)
%     %set(gca,'YTickLabel',[])
%     xlim([0 1])
%     ylim([0 0.1])
% end


%%%% CDF
% for i = 1:1:8
%     subplot(2,4,i)
%     [counts, centers] = hist(what{list(i)}, 50);
%     asdf = [];
%     for j = 1:1:length(counts)
%         asdf(end+1) = sum(counts(1:j)) / sum(counts);
%     end
%     bar(centers,asdf,1,'FaceColor','k');
%     set(gca,'xtick',[0 0.5 1],'tickdir','out')
%     set(gca,'ytick',[0 0.5 1])
%     t1 = strcat('r = ',num2str(f.radius(list(i))/10),' nm');
%     if f.radius(i) == 1
%         t2 = strcat('50% = N/A');
%     else
%         %t2 = 'asdf';
%         t2 = strcat('50% = ', sprintf(' %.3f',spline(asdf(1:end-3),centers(1:end-3),0.5)));
%     end
%     title({t1,t2})
%     %title(t1);
%     %xlabel(x_label)
%     %set(gca,'YTickLabel',[])
%     xlim([0 1])
%     %ylim([0 0.1])
%     ylim([0 1])
% end

list = [1,20,48,53];

%%% CDF
for i = 1:1:4
    subplot(1,4,i)
    [counts, centers] = hist(what{list(i)}, 50);
    asdf = [];
    for j = 1:1:length(counts)
        asdf(end+1) = sum(counts(1:j)) / sum(counts);
    end
    bar(centers,asdf,1,'FaceColor','k');
    set(gca,'xtick',[0 0.5 1],'tickdir','out')
    set(gca,'ytick',[0 0.5 1])
    t1 = strcat('r = ',num2str(f.radius(list(i))/10),' nm');
    t2 = strcat(whichc, sprintf(' %.3f',spline(asdf(1:end-3),centers(1:end-3),0.5)));
    title({t1,t2})
    %title(t1);
    xlabel(x_label)
    %set(gca,'YTickLabel',[])
    xlim([0 1])
    %ylim([0 0.1])
    ylim([0 1])
    grid on
end

% hold on
% list = [5,20,42];
% for i = 1:1:length(list)
%     %subplot(1,4,i)
%     [counts, centers] = hist(what{list(i)}, 50);
%     asdf = [];
%     for j = 1:1:length(counts)
%         asdf(end+1) = sum(counts(1:j)) / sum(counts);
%     end
%     if i == 1
%         aaa = 'k-';
%     elseif i == 2
%         aaa = 'b:';
%     else
%         aaa = 'm-.';
%     end
%     plot(centers,asdf,aaa)
% end
% set(gca,'xtick',[0 0.5 1],'tickdir','out')
% set(gca,'ytick',[0 0.5 1])
% t1 = strcat('r = ',num2str(f.radius(list(i))/10),' nm');
% if f.radius(i) == 1
%     t2 = strcat('r_c = N/A');
% else
%     %t2 = 'asdf';
%     t2 = strcat('C_V = ', sprintf(' %.3f',spline(asdf(1:end-3),centers(1:end-3),0.5)));
% end
% title({t1,t2})
% %title(t1);
% xlabel(x_label)
% %set(gca,'YTickLabel',[])
% xlim([0 1])
% %ylim([0 0.1])
% ylim([0 1])
% legend('5 nm', '50 nm', '500 nm','location','northwest')
% hold off
