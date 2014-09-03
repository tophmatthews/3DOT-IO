clear
outputdir = '/Users/topher/Dropbox/OSU/phd/3DOT/cluster/';
basename = 'pmore_22';
fueltype = 'uc';
exe = 'mytrim_bub';
legacy = '0';

% 11 or 21 = VDW, 12 or 22 = RONCHI, 11 or 12 = 1000K, 21 or 22 = 2000K
bub_EOS = '22'; 

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

runs = [  10    ,     120  ,        10;
          16    ,     150  ,        10;
          25    ,     150  ,        10;
          40    ,     180  ,        10;
          50    ,     200  ,        10;
          63    ,     220  ,        10;
         101    ,     300  ,        10;
         126    ,     325  ,        10;
         158    ,     400  ,        10;
         251    ,     600  ,        10;
         398    ,     900  ,        10;
         501    ,    1100 ,         10;
         631    ,    1400 ,         10;
        1001    ,    2100 ,         10;
        1585     ,   3200 ,         10;
        2501     ,   5200 ,         10;
        3981     ,   4200 ,         20;
        5001    ,   10200 ,         20;
        6310    ,   13000 ,         20;
       10000    ,   20200 ,         20;
       15849    ,   31000 ,         20;
       25119    ,   51000 ,         20;
       39811    ,   80000 ,         20;
       63096     , 13000 ,          20;
      100000     , 202000 ,         20;
      25,   100,    10;
      25,   200,    10;
      10,   150,    10;
      50    150,    10;
      1000, 2500,   10;
      1000, 3000,   10;
      900,  2500,   10;
      1100, 2500,   10];


         

fissions = 1000;
rho = 1; % 1 = calculate bubble rho, 0 = use default


% do this to clear old submit file
submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'w');

fprintf(fid, strcat('mkdir ./output', 10,'mkdir ./output/temp', 10));
for r = 1:1:length(runs)
    mkClusterlist( outputdir, runs(r,1), runs(r,2), fissions, runs(r,3), exe, basename, fueltype, legacy, bub_EOS );
end

