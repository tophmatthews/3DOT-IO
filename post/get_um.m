%/Applications/MATLAB_R2012b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run ~/Dropbox/OSU/phd/3DTrim/matlab/get_um"; exit;

clear
tic

outputdir = '/Volumes/datadrive/f/um/output/';
outputname = 'um';

get_multiple

toc