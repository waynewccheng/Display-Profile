clear
load('iPhone4 wcc')

i = 500;
mea(i,4:6) = (mea(i-4,4:6) + mea(i+4,4:6))/2;

i = 916;
mea(i,4:6) = (mea(i-4,4:6) + mea(i+4,4:6))/2;

save('iPhone4 wcc 2016')