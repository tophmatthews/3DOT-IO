%clear
%tic
%%% --- Settings --- %%%
%outputdir = '/Volumes/backup/uc/output/';
%outputname = 'uc';


%%% this will gen runs for all files in output folder
list = dir(outputdir);
combos = zeros(0,2);

for i=1:1:length(list)
    if strfind(list(i).name, 'fsn')
        temp = regexp(list(i).name, '\.', 'split');
        temp = temp{end-1};
        temp = regexp(temp, '\-', 'split');
        temp = [str2num(temp{1}),str2num(temp{2})];
        combos(end+1,:) = temp;
    end
end

combos = unique(combos,'rows');

%Error is fraction, not percent

f = struct('radius',[], ... % [nm]
           'box',[],... % [nm]
           'fissions', [], ...
           'escSum', [], 'escAvg', [], 'escEr', [], ...
           'hitSum', [], 'hitAvg', [], 'hitEr', [], ...
           'backInAvg', [], 'passAvg', [], 'punchAvg', [], 'pathAvg', [], ...
           'r02cen', [], 'rf2cen', [], ...
           'hitE', [], 'outE', [], ...
           'fuelHits', [], 'fgHits', [], 'parent', []);
filelist = {};
format shortG
for r = 1:1:size(combos,1)
    [out, files] = get_filedata(combos(r,1), combos(r,2), outputdir);
    if isempty(out)
    else
        f.radius(end+1)   = out.radius;
        f.box(end+1)      = out.box;
        f.fissions(end+1) = out.fissions;
        f.escSum(end+1)   = out.escSum;
        f.escAvg(end+1)   = out.escAvg;
        f.escEr(end+1)    = out.escEr;
        f.hitSum(end+1)   = out.hitSum;
        f.hitAvg(end+1)   = out.hitAvg;
        f.hitEr(end+1)    = out.hitEr;
        f.passAvg(end+1)  = out.passAvg;
        f.punchAvg(end+1) = out.punchAvg;
        f.pathAvg(end+1)  = out.pathAvg;
        f.backInAvg(end+1)= out.backInAvg;
       
        f.r02cen{end+1}   = out.r02cen ./ out.radius;
        f.rf2cen{end+1}   = out.rf2cen ./ out.radius;
        f.hitE{end+1}     = out.hitE;
        f.outE{end+1}     = out.outE;

        f.fuelHits{end+1} = out.fuelHits;
        f.fgHits{end+1}   = out.fgHits;
        f.parent{end+1}   = out.parent;
        
        filelist{end+1} = files;
        disp([num2str(out.radius) '-' num2str(out.box) ' done: ' num2str(r) ' of ' num2str(length(combos)) ' escSum: ' num2str(out.escSum) ' +- ' num2str(out.escEr*100) '% fsns ' num2str(out.fissions)])
    end
end

%cleanup
clear out file;

% Calculations
f.esc2hit = f.escAvg ./ f.hitAvg;
f.boxvol = f.box .^ 3; % A^3
f.bubvol = (pi * 4 / 3) .* f.radius.^3; % A^3
f.fuelvol = f.boxvol - f.bubvol;
f.porosity = f.bubvol ./ f.boxvol;
f.conc = 1 ./ f.boxvol; % A^-3

f.arho = [];
for i =1:1:length(f.radius)
    f.arho(end+1) = bubRho(2, f.radius(i), 2000);           % atoms/A^3
end

f.atoms = f.bubvol .* f.arho;
f.target = (pi * f.radius(:).^2)';          % A^2
f.target_frac = (f.target(:) ./ f.box(:).^2)';

% Family tree stuff

f.yes = f.escSum .* f.boxvol ./ f.atoms ./ f.fissions ./ 1e30 ./ f.pathAvg;

% r02cen = f.r02cen;
% rf2cen = f.rf2cen;
% hitE = f.hitE;
% outE = f.outE;
% fuelHits = f.fuelHits;
% fgHits = f.fgHits;
% parent = f.parent;
% 
% fields = {'r02cen','rf2cen','hitE','outE','fuelHits','fgHits','parent'};
% f = rmfield(f,fields);
% 
% save(strcat(outputdir, outputname, '.mat'), 'f','r02cen','rf2cen',...
%     'hitE','outE','fuelHits','fgHits','parent');

save(strcat(outputdir, outputname, '.mat'), 'f','-v7.3');

%toc