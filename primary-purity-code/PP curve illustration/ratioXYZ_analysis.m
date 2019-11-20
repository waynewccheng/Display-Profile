% 11/19/2019
% to address reviwer's question
% Color Research and Application

% from primary_stability.m
load array_ratioXYZ.mat

% from gray_stability.m
load array_ratioXYZ_gray.mat

%% red shades
ch = 1;

subplot(1,4,ch)
rng = 1:255;
data = squeeze(array_ratioXYZ(ch,rng,:));
data_norm = data ./ sum(data,2);
b = area([data_norm(:,1) data_norm(:,2) data_norm(:,3)])
b(1).FaceColor = [1 0 0];
b(2).FaceColor = [0 1 0];
b(3).FaceColor = [0 0 1];
legend('Red', 'Green', 'Blue', 'Location', 'Southeast')
axis([0 255 0 1])
axis square
xlabel('Red, (t,0,0)')
ylabel('Normalized Contributions')

%% green shades
ch = 2;
subplot(1,4,ch)
rng = 1:255;
data = squeeze(array_ratioXYZ(ch,rng,:));
data_norm = data ./ sum(data,2);
b = area([data_norm(:,2) data_norm(:,1) data_norm(:,3)])
b(1).FaceColor = [0 1 0];
b(2).FaceColor = [1 0 0];
b(3).FaceColor = [0 0 1];
legend('Green', 'Red', 'Blue', 'Location', 'Southeast')
axis([0 255 0 1])
axis square
xlabel('Green, (0,t,0)')
ylabel('Normalized Contributions')

%% blue shades
ch = 3;
subplot(1,4,ch)
rng = 1:255;
data = squeeze(array_ratioXYZ(ch,rng,:));
data_norm = data ./ sum(data,2);
b = area([data_norm(:,3) data_norm(:,1) data_norm(:,2)])
b(1).FaceColor = [0 0 1];
b(2).FaceColor = [1 0 0];
b(3).FaceColor = [0 1 0];
legend('Blue', 'Red', 'Green', 'Location', 'Southeast')
axis([0 255 0 1])
axis square
xlabel('Blue, (0,0,t)')
ylabel('Normalized Contributions')

%% gray shades
% gray tracking
ch = 4;
subplot(1,4,ch)
rng = 1:255;
data_norm = array_ratioXYZ_gray(rng,:);
b = area([data_norm(:,1) data_norm(:,2) data_norm(:,3)])
b(1).FaceColor = [1 0 0];
b(2).FaceColor = [0 1 0];
b(3).FaceColor = [0 0 1];
legend('Red', 'Green', 'Blue', 'Location', 'Southeast')
axis([0 255 0 1])
axis square
xlabel('Gray, (t,t,t)')
ylabel('Normalized Contributions')
