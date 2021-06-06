load peterOfficial0_1_50_01-04-2011_1152.mat   
m1=mea
load peterOfficial51_1_100_01-04-2011_1214.mat   
m2=mea
load peterOfficial101_1_150_01-04-2011_1257.mat
m3=mea
load peterOfficial151_1_200_01-04-2011_1325.mat
m4=mea
load peterOfficial201_1_255_01-04-2011_1349.mat 
m5=mea

mm=[m1; m2; m3; m4; m5]

clf
plot(mm(1:4:1024,4),'r'); hold
plot(mm(2:4:1024,4),'g')
plot(mm(3:4:1024,4),'b')
plot(mm(4:4:1024,4),'k')
plot(mm(1:4:1024,4)+mm(2:4:1024,4)+mm(3:4:1024,4),'c')
title('I9000')
xlabel('digital count')
ylabel('luminance (cd/m/m)')
legend('red','green','blue','white','r+g+b','location','northwest')
