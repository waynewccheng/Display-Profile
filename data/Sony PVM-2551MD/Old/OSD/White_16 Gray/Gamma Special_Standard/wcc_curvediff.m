% 11-14-2012
% calculate the difference between the target curve and the measured data

% input data
load Sony_PVM_D65_CR100_BR100_G22_COOFF_CH1_11-06-2012_2040.mat

% input parameter
targetgamma = 2.2;

% obtain graylevel
gray = mea(:,6);
lmin = min(gray);
lmax = max(gray);
% grayx is the digital count as well as the target because of linearity
grayx = mea(:,1)./255;

% calculate de-gamma
graynormalized = (gray - lmin) ./ (lmax-lmin);
graydegamma = power(graynormalized,1/targetgamma);

% define target
graytarget = grayx;

% calculate difference
graydiff = graytarget - graydegamma;

% calculate difference
graydiffpos = (graydegamma >  graytarget) .* (graydegamma - graytarget);
graydiffneg = (graydegamma <= graytarget) .* (graytarget - graydegamma);

% output
diffposavg = mean(graydiffpos)
diffnegavg = mean(graydiffneg)

% show plot
% only for sorted data
clf
hold on
plot(grayx,graydegamma(:),'or')
plot(grayx,grayx,'-b')

plot(grayx,graydiffpos,':g')
plot(grayx,graydiffneg,':r')