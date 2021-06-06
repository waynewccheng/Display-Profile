% 7-24-2014
% combine R, G, B files from Ray
% into the traditional format

rfile = 'Samsung_GalaxyS3_R_06-24-2014_1624';
gfile = 'Samsung_GalaxyS3_G_06-24-2014_1658';
bfile = 'Samsung_GalaxyS3_B_06-24-2014_1732';

load(['R\' rfile])
mear = mea;
mear(:,[1 2 3 4 5 6 7]) = mea(:,[1 2 3 6 4 5 7]);
specarrayr = specarray;

load(['G\' gfile])
meag = mea;
meag(:,[1 2 3 4 5 6 7]) = mea(:,[1 2 3 6 4 5 7]);
specarrayg = specarray;

load(['B\' bfile])
meab = mea;
meab(:,[1 2 3 4 5 6 7]) = mea(:,[1 2 3 6 4 5 7]);
specarrayb = specarray;

load('Samsung_S3_800x480_BR100_12-10-2012_1147')
meaw = mea;
meaw(:,[1 2 3 4 5 6 7]) = mea(:,[1 2 3 6 4 5 7]);
specarrayw = specarray;


mea = zeros(1024,7);
specarray = zeros(1024,401);

mea(1:4:1024,:) = mear(:,:);
specarray(1:4:1024,:) = specarrayr(:,:);

mea(2:4:1024,:) = meag(:,:);
specarray(2:4:1024,:) = specarrayg(:,:);

mea(3:4:1024,:) = meab(:,:);
specarray(3:4:1024,:) = specarrayb(:,:);

mea([4:64:1024 1024],:) = meaw(:,:);
specarray([4:64:1024 1024],:) = specarrayw(:,:);


save('mydisplay','mea','specarray')