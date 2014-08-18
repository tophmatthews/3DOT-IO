%/Applications/MATLAB_R2012b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run ~/Dropbox/OSU/phd/3DTrim/matlab/get_un"; exit;

clear
tic

outputdir = '/Volumes/datadrive/f/un/output/';
outputname = 'un';

get_multiple

toc