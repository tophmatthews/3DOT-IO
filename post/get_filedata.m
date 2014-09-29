function [ out, files ] = get_filedata( radius, boxsize, outputdir )
%getData

params = strcat(num2str(radius),'-',num2str(boxsize),'.');

%[infolist, ionlist, esclist, fsnlist, runs, files] = files2list(outputdir, params);
[fsnlist, esclist, ~, files] = files2list(outputdir, params);

if isempty(fsnlist)% || isempty(esclist)
    if isempty(fsnlist)
        disp([num2str(radius) '-' num2str(boxsize) ' has no fission data']);
    else
        disp([num2str(radius) '-' num2str(boxsize) ' has no escape data']);
    end
    out = [];
    files = 0;
    return
end

% Checks to make sure the file is complete
for i = 1:1:length(esclist)
    if length(esclist{i}) ~= length(esclist{1})
        disp(['Esc Line screwed up: i=', num2str(i),' ion# before=' num2str(esclist{i-1}{1}), ' ', num2str(i/length(esclist)), '% through'])
        esclist{i} = esclist{i-1};
        disp('   esclist Corrected')
    end
end

for i = 1:1:length(fsnlist)
    if length(fsnlist{i}) ~= length(fsnlist{1})
        disp(['Fsn Line screwed up: i=', num2str(i), ' ', num2str(i/length(fsnlist)), '% through'])
        fsnlist{i} = fsnlist{i-1};
        disp('   fsnlist corrected')
    end
end

%data save
out = {};
out.radius   = radius;
out.box      = boxsize;
out.fissions = length(fsnlist{1});

[ ~, pass1Avg, ~ ] = get_listStats(fsnlist{4});
[ ~, pass2Avg, ~ ] = get_listStats(fsnlist{9});
out.passAvg = (pass1Avg + pass2Avg) ./ 2;

[ ~, punch1Avg, ~ ] = get_listStats(fsnlist{5});
[ ~, punch2Avg, ~ ] = get_listStats(fsnlist{10});
out.punchAvg = (punch1Avg + punch2Avg) ./ 2;

[ ~, path1Avg, ~ ] = get_listStats(fsnlist{6});
[ ~, path2Avg, ~ ] = get_listStats(fsnlist{11});
out.pathAvg = (path1Avg + path2Avg) ./ 2;

[ out.hitSum, out.hitAvg, out.hitEr ] = get_listStats(fsnlist{13});
[ out.escSum, out.escAvg, out.escEr ] = get_listStats(fsnlist{14});
[ ~, out.backInAvg, ~ ] = get_listStats(fsnlist{15});

out.gen = esclist{2};
out.r02cen = esclist{5};
out.rf2cen = esclist{6};
out.hitE = esclist{8};
out.outE = esclist{9};
out.fuelHits = esclist{10};
out.fgHits = esclist{11};
out.parent = esclist{12};

end

