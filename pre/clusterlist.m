clear
outputdir = '/Users/topher/Dropbox/OSU/phd/3DOT/cluster/';
basename = 'tbig_22';
fueltype = 'uc';
exe = 'mytrim_bub';
legacy = '0';

% 11 or 21 = VDW, 12 or 22 = RONCHI, 11 or 12 = 1000K, 21 or 22 = 2000K
bub_EOS = '22'; 

runs = zeros(0,3);

logr = linspace(log10(10),log10(5e5),20);

% for i = logr
%     runs(end+1,:) = [round(10^i), round((10^i)*2 + 200), 20];
% end

% for i = [100, 500, 1000]           % set boxsize
%     runs(end+1,:) = [round(i/20), i, 20];
%     runs(end+1,:) = [round(i/15), i, 20];
%     runs(end+1,:) = [round(i/10), i, 20];
%     runs(end+1,:) = [round(i/5), i, 20];
%     runs(end+1,:) = [round(i/2.5), i, 20];
% end

for i = [10,50,100,1000,10000]           % set boxsize
%     runs(end+1,:) = [i, round(i*2 + 99), 20];
%     runs(end+1,:) = [i, round(i*3), 20];
%     runs(end+1,:) = [i, round(i*4), 20];
%     runs(end+1,:) = [i, round(i*5), 20];
%     runs(end+1,:) = [i, round(i*6), 20];
    runs(end+1,:) = [i, round(i*8), 30];
    runs(end+1,:) = [i, round(i*10), 40];
    runs(end+1,:) = [i, round(i*20), 50];
end



fissions = 1000;
rho = 1; % 1 = calculate bubble rho, 0 = use default


% do this to clear old submit file
submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'w');

fprintf(fid, strcat('mkdir ./output', 10,'mkdir ./output/temp', 10));
for r = 1:1:length(runs)
    mkClusterlist( outputdir, runs(r,1), runs(r,2), fissions, runs(r,3), exe, basename, fueltype, legacy, bub_EOS );
end

