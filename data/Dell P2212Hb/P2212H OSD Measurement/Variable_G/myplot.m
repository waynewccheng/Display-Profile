load DDC_CR80_BR100_R100_G100_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

clf
hold on
plot(r,'r');
plot(g,'g');
plot(b,'b');


load DDC_CR80_BR100_R100_G80_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(r,'r');
plot(g*1.6,':g');
plot(b,'b');

load DDC_CR80_BR100_R100_G60_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(r,'r');
plot(g*2.9,':g');
plot(b,'b');

load DDC_CR80_BR100_R100_G40_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(r,'r');
plot(g*6.6,':g');
plot(b,'b');

load DDC_CR80_BR100_R100_G20_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(r,'r');
plot(g*12.5,':b');
plot(b,'b');

load DDC_CR80_BR100_R100_G0_B100.mat

r = mea(1:4:64,6);
g = mea(2:4:64,6);
b = mea(3:4:64,6);

plot(r,'r');
plot(g*12.5,':r');
plot(b,'b');