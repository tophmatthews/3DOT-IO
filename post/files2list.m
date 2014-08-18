function [ fsnlist, esclist, runs, files ] = files2list( outputdir, params )
%files2list Reads list of files with same params and outputs lists

listing = dir(outputdir);
fsnfiles = {}; escfiles = {};

newparams = strcat('.', params);

for i=1:1:size(listing,1)
    if strfind(listing(i).name, newparams)
        if strfind(listing(i).name, 'esc')
            escfiles{end+1} = listing(i).name;
        end
        if strfind(listing(i).name, 'fsn')
            fsnfiles{end+1} = listing(i).name;
        end
    end
end

files = fsnfiles;
runs = length(fsnfiles);

fsnlist = fsn_file2list(strcat(outputdir, fsnfiles{1}));
if length(fsnfiles) >= 2
    for i = 2:1:length(fsnfiles)
        templist = fsn_file2list(strcat(outputdir, fsnfiles{i}));
        for j=1:1:size(fsnlist,2)
            fsnlist{j} = [fsnlist{j};templist{j}];
        end
    end
end


if isempty(escfiles)
    esclist = {};
else
    esclist = esc_file2list(strcat(outputdir, escfiles{1}));
    if length(escfiles) >= 2
        for i = 2:1:length(escfiles)
            templist = esc_file2list(strcat(outputdir, escfiles{i}));
            for j=1:1:length(templist)
                esclist{j} = [esclist{j};templist{j}];
            end
        end
    end
end

end