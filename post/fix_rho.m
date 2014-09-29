f.arho = [];
for i =1:1:length(f.radius)
    f.arho(end+1) = bubRho(2, f.radius(i), 2000);           % atoms/A^3
end

f.atoms = f.bubvol .* f.arho;