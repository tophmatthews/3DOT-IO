#!/bin/csh
#$ -N get_um.sh
#$ -cwd
#$ -o get_um.log
#$ -j y
hostname
date
matlab -nodisplay -nosplash -nodesktop -r "run post/get_um.m" ;
date
