
outputdir = '/Users/topher/Desktop/data/u/u_22/';
outputname = 'uc';
f = load(strcat(outputdir, outputname, '.mat'),'f');
f1 = f.f;
%e = load(strcat(outputdir, outputname, 'e.mat'),'e');
%e1 = e.e;

outputdir = '/Users/topher/Desktop/data/u/u_22_big/';
outputname = 'uc';
f = load(strcat(outputdir, outputname, '.mat'),'f');
f2 = f.f;
%e = load(strcat(outputdir, outputname, 'e.mat'),'e');
%e2 = e.e;

outputdir = '/Users/topher/Desktop/data/u/u_22_big2/';
outputname = 'uc';
f = load(strcat(outputdir, outputname, '.mat'),'f');
f3 = f.f;
%e = load(strcat(outputdir, outputname, 'e.mat'),'e');
%e3 = e.e;

outputdir = '/Users/topher/Desktop/data/u/u_22_big3/';
outputname = 'uc';
f = load(strcat(outputdir, outputname, '.mat'),'f');
f4 = f.f;
%e = load(strcat(outputdir, outputname, 'e.mat'),'e');
%e3 = e.e;

%%% Use this to combine files.
names = fieldnames(f1);
f = f1;
for i = 1:1:length(names)
    f.(char(names(i))) = [f.(char(names(i)))  f2.(char(names(i))) f3.(char(names(i))) f4.(char(names(i)))];
end

names = fieldnames(e1);
e = e1;
for i = 1:1:length(names)
    e.(char(names(i))) = [e.(char(names(i)))  e2.(char(names(i)))];
end

clear f1 f2 e1 e2;
clear f3 e3;

numbers = linspace(1,length(f.radius),length(f.radius));


%%% load single

outputdir = '/Users/topher/Desktop/data/t/t_22/';
outputname = 'uc';
f = load(strcat(outputdir, outputname, '.mat'),'f');
f = f.f;
e = load(strcat(outputdir, outputname, 'e.mat'),'e');
e = e.e;
