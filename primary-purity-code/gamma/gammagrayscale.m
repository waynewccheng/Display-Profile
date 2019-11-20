t = 0:1/255:1;
Y = power(t,2.2);

plot(t,Y,'k')
axis([0 1 0 1])
axis square
xlabel('Normalized DDL\it d','Interpreter','tex')
ylabel('Luminance cd/m^2')

saveas(gcf,'gammaY.png')