clear
outputdir = '/Users/topher/Dropbox/OSU/phd/3DOT/cluster/';
basename = 'u_31';
fueltype = 'uc';
exe = 'mytrim_bub';
legacy = '0';

% {11,21,31} = VDW, {12,22,32} = RONCHI
% {11,12} = 1000K, {21,22} = 1500K, {31,32} = 2000K
bub_EOS = '31'; 

runs = zeros(0,3);

logr = linspace(log10(5),log10(5e4),13);
logr = linspace(log10(5),log10(5e3),10);

for i = logr
    runs(end+1,:) = [round(10^i), round((10^i)*10), ceil(numFiles(10^i,0.01))];
end

% for i = [5,50,500,5000]           % set boxsize
%     runs(end+1,:) = [i, round(i*4), round(numFiles(i,0.01)/5)];
%     runs(end+1,:) = [i, round(i*6), round(numFiles(i,0.01)/5)];
%     runs(end+1,:) = [i, round(i*8), round(numFiles(i,0.01)/5)];
%     runs(end+1,:) = [i, round(i*12), numFiles(i,0.01)];
%     runs(end+1,:) = [i, round(i*15), numFiles(i,0.01)];
%     runs(end+1,:) = [i, round(i*20), numFiles(i,0.01)];
% end

fissions = 1000;

% do this to clear old submit file
submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'w');

fprintf(fid, strcat('mkdir ./output', 10,'mkdir ./output/temp', 10));
for r = 1:1:size(runs,1)
    mkClusterlist( outputdir, runs(r,1), runs(r,2), fissions, runs(r,3), exe, basename, fueltype, legacy, bub_EOS );
end

