clear
outputdir = '/Users/topher/Dropbox/OSU/phd/3DOT/cluster/';
basename = 'l_leg';
fueltype = 'uc';
exe = 'mytrim_bub';
legacy = '1';

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
          16    ,     132  ,        10;
          25    ,     151  ,        10;
          40    ,     180  ,        10;
          50    ,     201  ,        10;
          63    ,     226  ,        10;
         101    ,     251  ,        10;
         126    ,     378  ,        10;
         158    ,     474  ,        10;
         251    ,     753  ,        10;
         398    ,     851  ,        10;
         501    ,    1001 ,         10;
         631    ,    1893 ,         10;
        1001    ,    2501 ,         10;
        1585     ,   4755 ,         10;
        2501     ,   5001 ,         10;
        2512      ,  7024 ,         20;
        3981     ,   9962 ,         20;
        5001    ,   10001 ,         20;
        6310    ,   14620 ,         20;
       10000    ,   22000 ,         20;
       15849    ,   33698 ,         20;
       25119    ,   52238 ,         20;
       39811    ,   81622 ,         20;
       63096     , 128192 ,         20;
      100000     , 202000 ,         20];
         

fissions = 1000;
rho = 1; % 1 = calculate bubble rho, 0 = use default


% do this to clear old submit file
submit = strcat('submit_', basename,'.',fueltype);
fid = fopen(strcat(outputdir, submit),'w');

fprintf(fid, strcat('mkdir ./output', 10,'mkdir ./output/temp', 10));
for r = 1:1:length(runs)
    mkClusterlist( outputdir, runs(r,1), runs(r,2), fissions, runs(r,3), exe, basename, fueltype, legacy );
end

