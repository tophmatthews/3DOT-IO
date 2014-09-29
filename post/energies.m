clear

filename = '/Users/topher/Dropbox/OSU/phd/3DOT/3DOT-master/output/temp/test.25-200.hit';

data = csvread(filename);
small = data;
%small(:,[1,2]) = [];
small(small==0) = [];

[num, centers] = hist(small,10);
num = num ./ sum(num);

plot(centers,num);

% ff = data(1:2, 3:end);
% data([1,2],:) = [];
% 
% fg = zeros(0,size(data,2));
% efg = zeros(0,size(data,2));
% 
% 
% for i = 1:1:length(data)
%     if data(i, 1) == 1
%         if data(i, 2) == 1
%             efg(end+1) = data(i,3:end);
%         else
%             fg(end+1) = data(i,3:end);
%         end
%         data(i,:) = [];
%     end
% end
            