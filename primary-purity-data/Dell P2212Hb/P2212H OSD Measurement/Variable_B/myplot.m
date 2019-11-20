load DDC_CR80_BR100_R100_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

clf
hold on

plot(x,b,'b');



load DDC_CR80_BR100_R100_G100_B80.mat
x = mea(1:4:64,1);
r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,b*1.6,'b');


load DDC_CR80_BR100_R100_G100_B60.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,b*2.7,'b');

load DDC_CR80_BR100_R100_G100_B40.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,b*4,'b');

load DDC_CR80_BR100_R100_G100_B20.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,b*6,'b');

load DDC_CR80_BR100_R100_G100_B0.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(x,b*6,'b');

