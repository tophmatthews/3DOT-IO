function [ listSum, listAvg, listEr ] = get_listStats( list )
%getStats 

listSum = sum(list);
listAvg = mean(list);
listEr = sqrt(listSum) / listSum;
end

