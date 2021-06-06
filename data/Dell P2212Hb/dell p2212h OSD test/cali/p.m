load DELL_P2212Hb_2_WICC_10-03-2012_1613.mat

cc = 'rgbcmrgbcm';

clf
subplot(1,2,1)
hold on
for i = [1:7]
x = mea([i*4+1 i*4+2 i*4+3 i*4+1],4);
y = mea([i*4+1 i*4+2 i*4+3 i*4+1],5);
plot(x,y,cc(i+1));
x = mea([i*4+4],4);
y = mea([i*4+4],5);
plot(x,y,[cc(i+1) '+']);
axis([0 1 0 1])
end

load DELL_P2212Hb_2_WOICC_10-03-2012_1608
subplot(1,2,2)
hold on
for i = [1:7]
x = mea([i*4+1 i*4+2 i*4+3 i*4+1],4);
y = mea([i*4+1 i*4+2 i*4+3 i*4+1],5);
plot(x,y,cc(i+1));

x = mea([i*4+4],4);
y = mea([i*4+4],5);
plot(x,y,[cc(i+1) '+']);
axis([0 1 0 1])

end
