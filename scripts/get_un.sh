#!/bin/csh
#$ -N get_un.sh
#$ -cwd
#$ -o get_un.log
#$ -j y
hostname
date
matlab -nodisplay -nosplash -nodesktop -r "run post/get_un.m" ;
date
