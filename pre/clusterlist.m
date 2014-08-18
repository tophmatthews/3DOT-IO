clear
outputdir = '/Users/topher/Dropbox/OSU/phd/3DOT/cluster/';
basename = 'kleg';
fueltype = 'uc';
exe = 'mytrim_bub';
legacy = '0';

runs = zeros(0,3);

% for i = [100]           % set radii
%     for j = [300,400,500,600,700,800,900,1000]   % set box sizes
%         runs(end+1,:) = [i,j];
%     end
% end
    
% f = 10;
% for i = [250,500,750,1000,1250,1500,1750,2000,2250,2500]           % set radii
%     for j = [5000]   % set box sizes
%         runs(end+1,:) = [i,j,f];
%     end
% end 

% runs = [  10    ,     120  ,         10;
%           16    ,     132  ,         10;
%           25    ,     150  ,         10;
%           40    ,     180  ,        10;
%           50    ,     200  ,        10;
%           63    ,     226  ,        10;
%          100    ,     250  ,        10;
%          126    ,     378  ,        10;
%          158    ,     474  ,        10;
%          251    ,     753  ,        10;
%          398    ,    1194  ,        10;
%          500    ,    1000 ,         10;
%          631    ,    1893 ,         10;
%         1000    ,    2500 ,         10;
%         1585     ,   4755 ,         10;
%         2500     ,   5000 ,         10;
%         2512      ,  7024 ,         20;
%         3981     ,   9962 ,         20;
%         5000    ,   10000 ,         20;
%         6310    ,   14620 ,         20;
%        10000    ,   22000 ,         20;
%        15849    ,   33698 ,         20;
%        25119    ,   52238 ,         20;
%        39811    ,   81622 ,         20;
%        63096     , 128192 ,         20;
%       100000     , 202000 ,         20];

runs = [ 1000, 2490, 20;
         1000, 2510, 20;
          990, 2500, 20;
         1100, 2500, 20;
         1000, 2500, 10;
         1001, 2491, 20;
         1001, 2511, 20;
          991, 2501, 20;
         1101, 2501, 20;
         1001, 2501, 10;];
         

fissions = 1000;
rho = 1; % 1 = calculate bubble rho, 0 = use default


% do this to clear old submit file
submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'w');

fprintf(fid, strcat('mkdir ./output', 10,'mkdir ./output/temp', 10));
for r = 1:1:length(runs)
    mkClusterlist( outputdir, runs(r,1), runs(r,2), fissions, runs(r,3), exe, basename, fueltype, legacy );
end

