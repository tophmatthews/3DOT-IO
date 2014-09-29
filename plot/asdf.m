
Emin = 50;
dmin = 50;


% for i=5%1:1:length(f.rf2cen)
%     temp = [];
%     for j=1:1:length(f.rf2cen{i})
%         if (f.rf2cen{i}(j) - 1) * f.radius(i) > dmin
%             temp(end+1) = f.outE{i}(j);
%         end
%     end
% end

for i=5%1:1:length(f.rf2cen)
    temp = [];
    for j=1:1:length(f.rf2cen{i})
        if f.outE{i}(j) >= Emin
            temp(end+1) = (f.rf2cen{i}(j) - 1) *f.radius(i);
        end
    end
end

hist(log10(temp),20)
ylim([1 100])
xlim([1 100])