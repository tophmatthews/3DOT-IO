function [ ] = mkClusterlist( outputdir, radius, boxsize, fissions, files, exe, basename, fueltype, legacy )
%mkClusterlist

filelist = {};
for i=1:1:files
    namenum = strcat(basename,'.',fueltype, num2str(i, '%.2d'));
    name = strcat(namenum,'.',num2str(radius),'-',num2str(boxsize));
    filename = strcat(name, '.sh');
    pre = strcat('#!/bin/csh', 10, ...
             '#$ -N', 32, filename, 10, ...
             '#$ -cwd', 10, ...
             '#$ -o', 32, name, '.log', 10, ...
             '#$ -j y', 10, ...
             'hostname',10,...
             'date', 10,...
             '/nfs/cluster-share/share/matthchr/3DOT/');
    
    post = strcat(10, 'mv output/temp/', name, '.* output/', 10, 'date');
    
    filelist{end+1} = filename;
    
    fid = fopen(strcat(outputdir, filename),'w');
    stuff = strcat(pre, exe, 32, namenum, 32, num2str(radius), 32,...
                   num2str(boxsize), 32, num2str(fissions), 32,...
                   num2str(fueltype), 32, num2str(legacy), 32, post);
               
    fprintf(fid,'%s\n', stuff);
    fclose(fid);
end

submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'a');
for i=1:1:files
    fprintf(fid,'%s', strcat('qsub', 32, filelist{i}), 10);
end
fclose(fid);

end

