

outputdir = '/Volumes/datadrive/all_leg/';
outputname = 'uc';
avgtravel = 1460000.0;
load(strcat(outputdir, outputname, '.mat'),'f');
load(strcat(outputdir, outputname, 'e.mat'),'e');
numbers = linspace(1,length(f.radius),length(f.radius));

outputdir = '/Volumes/datadrive/all_reg/';
outputname = 'uc';
avgtravel = 80700.0;
load(strcat(outputdir, outputname, '.mat'),'f');
%load(strcat(outputdir, outputname, 'e.mat'),'e');
numbers = linspace(1,length(f.radius),length(f.radius));

outputdir = '/Volumes/datadrive/newj/';
outputname = 'uc';
avgtravel = 91486.4;
load(strcat(outputdir, outputname, '.mat'),'f');
%load(strcat(outputdir, outputname, 'e.mat'),'e');
numbers = linspace(1,length(f.radius),length(f.radius));

outputdir = '/Volumes/datadrive/j/';
outputname = 'un';
un_avgtravel = 86861.6;
load(strcat(outputdir, outputname, '.mat'),'f');
load(strcat(outputdir, outputname, 'e.mat'),'e');
un_numbers = linspace(1,length(f.radius),length(f.radius));
une = e;
unf = f;
clear e f;

outputdir = '/Volumes/datadrive/j/';
outputname = 'uc';
uc_avgtravel = 91714.8;
load(strcat(outputdir, outputname, '.mat'),'f');
load(strcat(outputdir, outputname, 'e.mat'),'e');
uc_numbers = linspace(1,length(f.radius),length(f.radius));
uce = e;
ucf = f;
clear e f;

outputdir = '/Volumes/datadrive/j/';
outputname = 'um';
um_avgtravel = 78082.4;
load(strcat(outputdir, outputname, '.mat'),'f');
load(strcat(outputdir, outputname, 'e.mat'),'e');
um_numbers = linspace(1,length(f.radius),length(f.radius));
ume = e;
umf = f;
clear e f;