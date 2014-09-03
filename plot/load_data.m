reg_travel = 73300.0;
leg_travel = 1245000.0;

outputdir = '/Users/topher/Desktop/data/p/p_more22/';
outputname = 'uc';
avgtravel = reg_travel;
s = load(strcat(outputdir, outputname, '.mat'),'f');
s1 = s.f;
%load(strcat(outputdir, outputname, 'e.mat'),'e');
%numbers = linspace(1,length(f.radius),length(f.radius));

outputdir = '/Users/topher/Desktop/data/p/p_22/';
outputname = 'uc';
avgtravel = reg_travel;
s = load(strcat(outputdir, outputname, '.mat'),'f');
s2 = s.f;

%%% Use this to combine files.
names = fieldnames(s1);
f = s1;
for i = 1:1:length(names)
    f.(char(names(i))) = [f.(char(names(i)))  s2.(char(names(i)))];
end

clear s1 s2 s;