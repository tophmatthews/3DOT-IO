
function [ list ] = fsn_file2list( filename )
%file2list Reads file line by line and outputs cell
    %filename = 'f.uc20.1585-4755.fsn'
    fid = fopen(filename,'r');
    %fsn#, z1, e1, pass1, punch1, path1, z2, e2, pass2, punch2, path2, #ions, hitnum, escnum backinnum
    list = textscan(fid,'%d %d8 %f32 %d %d %f32 %d8 %f32 %d %d %f32 %d64 %d %d %d');
    fclose(fid);
    
end