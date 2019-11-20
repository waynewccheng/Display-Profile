% mea2XYZ('EIZO_CG243W_08-01-2013_0530.mat')

function mea2XYZ

display = '../data/EIZO R31\Current\Original Display\Full Color_Full Gray\EIZO_R31';
load (display)

rYxy = mea(1:4:1024,4:6);
gYxy = mea(2:4:1024,4:6);
bYxy = mea(3:4:1024,4:6);
wYxy = mea(4:4:1024,4:6);

m = rYxy;
n = [m(:,2).*m(:,1)./m(:,3) m(:,1) (1-m(:,2)-m(:,3)).*m(:,1)./m(:,3)];
n2 = n ./ repmat(n(256,1:3),[256,1]);
rXYZ = n2;

m = gYxy;
n = [m(:,2).*m(:,1)./m(:,3) m(:,1) (1-m(:,2)-m(:,3)).*m(:,1)./m(:,3)];
n2 = n ./ repmat(n(256,1:3),[256,1]);
gXYZ = n2;

m = bYxy;
n = [m(:,2).*m(:,1)./m(:,3) m(:,1) (1-m(:,2)-m(:,3)).*m(:,1)./m(:,3)];
n2 = n ./ repmat(n(256,1:3),[256,1]);
bXYZ = n2;

m = wYxy;
n = [m(:,2).*m(:,1)./m(:,3) m(:,1) (1-m(:,2)-m(:,3)).*m(:,1)./m(:,3)];
n2 = n ./ repmat(n(256,1:3),[256,1]);
wXYZ = n2;


clf

subplot(1,4,1)
hold on
plot(0:255,rXYZ(:,1),'r')
plot(0:255,rXYZ(:,2),'g')
plot(0:255,rXYZ(:,3),'b')
legend('CIE X','CIE Y','CIE Z','Location','northwest')
legend('boxoff')

%plot(0:255,rYxy(:,2),'r')
%plot(0:255,rYxy(:,3),'g')
axis([0 255 0 1])
axis square
%title(display,'Interpreter','none')
xlabel('(a) Red, (r,0,0)')
ylabel('Normalized CIE X, Y, and Z')

subplot(1,4,2)
hold on
plot(0:255,gXYZ(:,1),'r')
plot(0:255,gXYZ(:,2),'g')
plot(0:255,gXYZ(:,3),'b')
%plot(0:255,gYxy(:,2),'r')
%plot(0:255,gYxy(:,3),'g')
axis([0 255 0 1])
axis square
xlabel('(b) Green, (0,g,0)')

subplot(1,4,3)
hold on
plot(0:255,bXYZ(:,1),'r')
plot(0:255,bXYZ(:,2),'g')
plot(0:255,bXYZ(:,3),'b')
%plot(0:255,bYxy(:,2),'r')
%plot(0:255,bYxy(:,3),'g')
axis([0 255 0 1])
axis square
xlabel('(c) Blue, (0,0,b)')

subplot(1,4,4)
hold on
plot(0:255,wXYZ(:,1),'r')
plot(0:255,wXYZ(:,2),'g')
plot(0:255,wXYZ(:,3),'b')
%plot(0:255,wYxy(:,2),'r')
%plot(0:255,wYxy(:,3),'g')
axis([0 255 0 1])
xlabel('(d) Gray, (r,g,b)')
axis square

saveas(gcf,'XYZ vs DDL normalized.tif')