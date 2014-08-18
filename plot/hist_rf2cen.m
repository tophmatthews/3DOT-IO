
% list = [1,5,7,20,27,42,48,53];
% figure('units','normalized','outerposition',[0 0 1 1])
% 
% cen = -10:10:2010;
% for i = 1:1:8
%     subplot(2,4,i)
%     [counts, centers] = hist(( (f.rf2cen{i} - 1) * f.radius(i) ), cen);
%     %bar(centers,log10(counts)/log10(max(counts(2:end))),1,'FaceColor','k');
%     %plot(centers,(counts)/(max(counts(2:end))),'.')
%     %bar(centers,log10(counts)/log10(sum(counts)),1,'FaceColor','k')
%     bar(centers,counts,1,'FaceColor','k')
%     %plot(centers,counts/sum(counts),'.')
%     set(gca,'xtick',[0 1000 2000])
%     %set(gca,'ytick',[0 0.5 1])
%     set(gca, 'tickdir','out','YScale','log')
%     t1 = strcat('r = ',num2str(f.radius(list(i))),char(197));
%     title({t1})
%     %xlabel('')
%     %set(gca,'YTickLabel',[])
%     xlim([0 2000])
%     %ylim([0 1.1])
% end



% list = [1,20,48,53];
% cen = -10:10:2100;
% for i = 1:1:4
%     subplot(1,4,i)
%     [counts, centers] = hist(( (f.rf2cen{i} - 1) * f.radius(i) ), cen);
%     %bar(centers,log10(counts)/log10(max(counts(2:end))),1,'FaceColor','k');
%     %plot(centers,(counts)/(max(counts(2:end))),'.')
%     %bar(centers,log10(counts)/log10(sum(counts)),1,'FaceColor','k')
%     %bar(centers,counts/sum(counts),1,'FaceColor','k','basevalue',1/sum(counts))
%     plot(centers,counts/sum(counts)*100,'k.','MarkerSize',5)
%     set(gca,'xtick',[0 1000 2000],'xticklabel', [0 1 2],'tickdir','out')
%     %set(gca,'ytick',[0 0.5 1])
%     set(gca, 'tickdir','out','YScale','log')
%     t1 = strcat('r = ',num2str(f.radius(list(i))/10),' nm');
%     t2 = ' ';
%     title({t2 t1})
%     xlabel('{\mu}m from bubble')
%     %set(gca,'YTickLabel',[])
%     xlim([0 2000])
%     ylim([1e-4 1])
% end

list = [5,20,42];
cen = -10:10:1000;
hold on
for i = 1:1:3
    [counts, centers] = hist(( (f.rf2cen{i} - 1)*f.radius(i) ), cen);
    if i == 1
        asdf = 'ko';
    elseif i == 2
        asdf = 'bd';
    else
        asdf = 'md';
    end
          
    plot(centers/10,counts/sum(counts)*100,asdf,'MarkerSize',3)
end
%set(gca,'xtick',[0 1000 2000],'xticklabel', [0 1 2],'tickdir','out')
%set(gca,'ytick',[0 0.5 1])
set(gca, 'tickdir','in','YScale','log')
set(gca,'xScale','log')

xlabel('nm from bubble')
ylabel('Percent of Total')
%set(gca,'YTickLabel',[])
legend('5 nm','50 nm', '500 nm')
xlim([0 50])
ylim([1e-4 10])
box on
hold off