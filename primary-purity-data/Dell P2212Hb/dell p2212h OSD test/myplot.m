clf
hold on
gamma = 1.6;
gamma2 = 2;

load DDC_100_100
m1 = mea;
%plot(m1(:,1),m1(:,6),'r')
plot(m1(:,1)/m1(16,1),(((m1(:,6)-m1(1,6))/(m1(16,6)-m1(1,6))).^(1/gamma)*1).^1,'r')
%m1n = m1(:,6)/m1(16,6);
%m1nl = (1+0.055) * m1n.^(1/2) - 0.055;
%plot(m1(:,1)/m1(16,1),m1nl.^1,'g')


load DDC_100_50
m2 = mea;
%plot(m2(:,1),m2(:,6)*1.45,'g')

load DDC_50_100
m3 = mea;
plot(m3(:,1)/m3(16,1),((((m3(:,6)-m3(1,6))/(m3(16,6)-m3(1,6))).^(1/gamma2))).^1,'b')

load DDC_50_50
m4 = mea;
%plot(m4(:,1),m4(:,6)*1.45,'m')

plot(0:0.1:1,0:0.1:1,':m')