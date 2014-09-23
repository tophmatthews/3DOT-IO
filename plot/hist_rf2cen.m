
list = [8,16,25];

%cen1 = -1000:1:-10;
cen = -10:1:20;
%cen3 = 10:1:1000;

%cen = [cen1, cen2, cen3];

figure
hold on

for i = 1:1:3
    [counts, centers] = hist(( f.rf2cen{list(i)} - 1 ) * f.radius(list(i)), cen);
    if i == 1
        asdf = 'co';
    elseif i == 2
        asdf = 'bd';
    else
        asdf = 'md';
    end
          
    plot(centers/10,counts/sum(counts)*100,asdf,'MarkerSize',5)
end

%set(gca,'xtick',[0 1000 2000],'xticklabel', [0 1 2],'tickdir','out')
%set(gca,'ytick',[0 0.5 1])
%set(gca, 'tickdir','in','YScale','log')
%set(gca,'xScale','log')

xlabel('nm from bubble')
ylabel('Percent of Total')
%set(gca,'YTickLabel',[])
legend('5 nm','50 nm', '500 nm')
xlim([-2 2])
%ylim([0 0.1])
box on
hold off