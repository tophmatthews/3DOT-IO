% recasts everything into emin

emin = 300;
dmin = 50;

e = struct('radius',[], ... % [nm]
           'box',[],... % [nm]
           'fissions', [], ...
           'escSum', [], 'escAvg', [], 'escEr', [], ...
           'hitSum', [], 'hitAvg', [], 'hitEr', [], ...
           'backInAvg', [], 'passAvg', [], 'punchAvg', [], 'pathAvg', [], ...
           'r02cen', [], 'rf2cen', [], ...
           'hitE', [], 'outE', [], ...
           'fuelHits', [], 'fgHits', [], 'parent', []);
       
for i = 1:1:length(f.radius)
    rf2centemp = [];
    r02centemp = [];
    hitEtemp = [];
    fuelHitstemp = [];
    fgHitstemp = [];
    parenttemp = [];
    for j = 1:1:length(f.outE{i})
        if f.outE{i}(j) > emin
            rf2centemp(end+1) = f.rf2cen{i}(j);
            r02centemp(end+1) = f.r02cen{i}(j);
            hitEtemp(end+1) = f.hitE{i}(j);
            fuelHitstemp(end+1) = f.fuelHits{i}(j);
            fgHitstemp(end+1) = f.fgHits{i}(j);
            parenttemp(end+1) = f.parent{i}(j);
        end
    end
    e.rf2cen{end+1} = rf2centemp;
    e.r02cen{end+1} = r02centemp;
    e.hitE{end+1} = hitEtemp;
    e.fuelHits{end+1} = fuelHitstemp;
    e.fgHits{end+1} = fgHitstemp;
    e.parent{end+1} = parenttemp;
end


save(strcat(outputdir, outputname, 'e.mat'), 'e','-v7.3');