%/Applications/MATLAB_R2012b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run ~/Dropbox/OSU/phd/3DOT/matlab/post/get_uc"; exit;

clear
tic

outputdir = '../../';
outputname = 'uc';

get_multiple

toc
