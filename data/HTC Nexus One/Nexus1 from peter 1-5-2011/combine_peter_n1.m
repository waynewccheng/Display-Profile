load peternexus0_50_01-04-2011_1653.mat 
m1=mea
load peternexus51_100_01-04-2011_1522.mat 
m2=mea
load peternexus101_200_01-04-2011_1553.mat 
m3=mea
load peternexus201_255_01-04-2011_1613.mat
m4=mea

mm=[m1; m2; m3; m4]

plot(mm(1:4:1024,4),'r'); hold
plot(mm(2:4:1024,4),'g')
plot(mm(3:4:1024,4),'b')
plot(mm(4:4:1024,4),'k')
plot(mm(1:4:1024,4)+mm(2:4:1024,4)+mm(3:4:1024,4),'c')
title('Nexus One')
xlabel('digital count')
ylabel('luminance (cd/m/m)')
legend('red','green','blue','white','r+g+b','location','northwest')
