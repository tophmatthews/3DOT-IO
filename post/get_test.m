%/Applications/MATLAB_R2012b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run ~/Dropbox/OSU/phd/3DTrim/matlab/get_uc"; exit;

clear
tic

outputdir = '/Volumes/datadrive/test/output/';
outputname = 'test';

get_multiple

toc
