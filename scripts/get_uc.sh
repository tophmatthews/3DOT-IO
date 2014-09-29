#!/bin/csh
#$ -N get_uc.sh
#$ -cwd
#$ -o get_uc.log
#$ -j y
hostname
date
matlab -nodisplay -nosplash -nodesktop -r "run ../post/get_uc.m" ;
date
