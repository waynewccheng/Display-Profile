load DDC_CR80_BR100_R100_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

clf
hold on

plot(x,r,'r');



load DDC_CR80_BR100_R80_G100_B100.mat
x = mea(1:4:64,1);
r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,r*1.5,'r');


load DDC_CR80_BR100_R60_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,r*2.6,'r');

load DDC_CR80_BR100_R40_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,r*5.5,'r');

load DDC_CR80_BR100_R20_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,r*9.5,'r');

load DDC_CR80_BR100_R0_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,r*9.2,'b');
