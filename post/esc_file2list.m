
function [ list ] = esc_file2list( filename )
%file2list Reads file line by line and outputs cell
    %filename = 'f.uc20.1585-4755.esc';
    fid = fopen(filename,'r');
    %id, gen, pass, punch, r02cen, rf2cen, travel, hitE, outE, fuelhit, fghit, parentid
    %list = textscan(fid,'%d64 %d8 %d8 %d8 %d %d %d %d %d %d8 %d8 %d8');
    list = textscan(fid,'%d64 %d8 %d8 %d8 %f32 %f32 %f32 %f32 %f32 %d8 %d8 %d8');
    fclose(fid);
end