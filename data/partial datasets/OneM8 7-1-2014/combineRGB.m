% 7-24-2014
% combine R, G, B files from Ray
% into the traditional format

rfile = 'HTC_OneM8_R_06-24-2014_1410';
gfile = 'HTC_OneM8_G_06-24-2014_1326';
bfile = 'HTC_OneM8_B_06-24-2014_1301';

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

mea = zeros(1024,7);
specarray = zeros(1024,401);

mea(1:4:1024,:) = mear(:,:);
specarray(1:4:1024,:) = specarrayr(:,:);

mea(2:4:1024,:) = meag(:,:);
specarray(2:4:1024,:) = specarrayg(:,:);

mea(3:4:1024,:) = meab(:,:);
specarray(3:4:1024,:) = specarrayb(:,:);

save('mydisplay','mea','specarray')