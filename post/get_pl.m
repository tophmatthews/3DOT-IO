%/Applications/MATLAB_R2012b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run ~/Dropbox/OSU/phd/3DTrim/matlab/get_um"; exit;

clear
tic

outputdir = '/Volumes/datadrive/pl/output/';
outputname = 'pl';

get_multiple

toc