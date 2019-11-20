% 6-7-2016
% gray tracking added

pn = {...
'Apple Cinema\Current\Original Display\Full Color_Full Gray\Apple_Cinema', 
'Barco MDCC6130\Current\Original Display\Full Color_Full Gray\BARCO_MDCC6130',
'CMO56HD\Chimei',
'Dell 1907FP\Current\Original Display\Full Color_Full Gray\Dell19',
'Dell P2212Hb\Current\Original Display\Full Color_Full Gray\DELL 2212_08-21-2012_1155',

'EIZO CG243W\Current\Original Display\Full Color_Full Gray\EIZO_CG243W',
'EIZO R31\Current\Original Display\Full Color_Full Gray\EIZO_R31',
'HP ZR2240W\Current\HP_ZR2240W_BR90_CR80_6500K_06-26-2014_1200',
'HP ZR2440W\Current\HP_ZR2440W_BR90_CR80_6500K_06-25-2014_1815',
'HP Z24X\Current\Z24X_adobe_09-04-2014_1919',

'HP Z24X\Current\Z24X_srgb_09-04-2014_2302',
'HP Z24X\Current\Z24X_native_09-05-2014_1605',
'Pyle PLCMHD70\Current\Pyle7_09-11-2014_1216',
'HTC Nexus One\Nexus1 from peter 1-5-2011\n1_01-04-2011',
%'HTC Nexus One\Current\Original Display\Full Color_Full Gray\HTC_Nexus1',
'iPhone 4\Current\Original Display\Full Color_Full Gray\iPhone4 wcc 2016',

'NEC PA271W\Current\Original Display\Full Color_Full Gray\necpa271w',
'Samsung 3D\sm2233rz',
'Samsung 910T\Current\Original Display\Full Color_Full Gray\Samsung19',
'Samsung Galaxy S\galaxys_2016',
'Sony PVM-2551MD\Current\Original Display\Full Color_Full Gray\SONY_PVM60',

'Pyle PLCMHD70\Current\Pyle7_native_11-25-2014_1424',
'Dell P2212Hb\Current\Original Display\Full Color_Full Gray\dell_p2212Hb_native_11-25-2014_1700',
};

dn = {
'Apple_Cinema', 
'Barco_MDCC6130',
'ChiMei_56QFHD',
'Dell_1907FP',
'Dell_P2212Hb',

'EIZO_CG243W',
'EIZO_R31',
'HP_ZR2240W',
'HP_ZR2440W',
'HP_Z24X Adobe',

'HP_Z24X sRGB',
'HP_Z24X Native',
'Pyle_PLCMHD70'
'HTC_Nexus1',
'Apple_iPhone4',

'NEC_PA271W sRGB',
'Samsung_SM2233RZ',
'Samsung_910T',
'Samsung_GalaxyS',
'Sony_PVM-2551MD',

'Pyle_PLCMHD70_ICC',
'Dell_P2212Hb_ICC'
};    

dnshort = {
'Cinema', 
'MDCC6130',
'56QFHD',
'1907FP',
'P2212Hb',

'CG243W',
'R31',
'ZR2240W',
'ZR2440W',
'Z24X',

'Z24X',
'Z24X',
'PLCMHD70'
'Nexus1',
'iPhone4',

'PA271W',
'SM2233RZ',
'910T',
'GalaxyS',
'PVM2551MD'
'PLCMHD70_ICC'
'2212Hb_ICC'
};

displayn = dnshort(1:16);

aucabc = zeros(16,2);

data = zeros(15,4);

clf
hold on

j = 1;
for i = [14 19 20  2 6 11  1 16 8 9 4 15  5 17 13]
    fn = cell2mat(pn(i));
    fn2 = ['../data/' fn];
    
    displaytitle = sprintf('(%s) %s',char(97-1+j),cell2mat(dn(i)));

    [colorauc grayauc stability] = gray_stability_plot(fn2,displaytitle);

    data(j,5) = grayauc;
    
    [uv T1 T2] = tg196_gray_tracking(fn2);

    data(j,1) = mean(T1);
    data(j,2) = max(T1);
    data(j,3) = mean(T2);
    data(j,4) = max(T2);
    
    j = j + 1;
end

clf

%%
subplot(2,2,1)
hold on

% OLED
for i = [1 2 3]
    plot(data(i,5),data(i,1),'og')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% High-end
for i = [4 5 6 8]
    plot(data(i,5),data(i,1),'ob')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% consumer grade
for i = [7 9 10 11 13]
    plot(data(i,5),data(i,1),'or')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% mobile
for i = [12]
    plot(data(i,5),data(i,1),'oc')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

cc = corrcoef([data(:,5) data(:,1)]);
r = cc(1,2)
s_r = sprintf('R=%.4f',r);
text(0.97,0.0275,s_r,'Interpreter','none');

axis square
xlabel('G_AUC','Interpreter','none')
ylabel('\tau_{1,mean}','Interpreter','tex')
%legend('mean','max')
axis([0.9 1 0 0.03])

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'xtick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_xticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'xticklabel',new_xticks) 


%%
subplot(2,2,2)
hold on

% OLED
for i = [1 2 3]
    plot(data(i,5),data(i,2),'xg')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% High-end
for i = [4 5 6 8]
    plot(data(i,5),data(i,2),'xb')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% consumer grade
for i = [7 9 10 11 13]
    plot(data(i,5),data(i,2),'xr')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% mobile
for i = [12]
    plot(data(i,5),data(i,2),'xc')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

cc = corrcoef(data(:,5),data(:,2));
r = cc(1,2)
s_r = sprintf('R=%.4f',r);
text(0.97,0.0275,s_r,'Interpreter','none');

axis square
xlabel('G_AUC','Interpreter','none')
ylabel('\tau_{1,max}','Interpreter','tex')
%legend('mean','max')
axis([0.9 1 0 0.03])

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'xtick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_xticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'xticklabel',new_xticks) 


%%
subplot(2,2,3)
hold on

% OLED
for i = [1 2 3]
    plot(data(i,5),data(i,3),'og')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% High-end
for i = [4 5 6 8]
    plot(data(i,5),data(i,3),'ob')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% consumer grade
for i = [7 9 10 11 13]
    plot(data(i,5),data(i,3),'or')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% mobile
for i = [12]
    plot(data(i,5),data(i,3),'oc')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% Low-end
% for i = [14 15]
%    plot(data(i,5),data(i,3),'om')
%    plot(data(i,5),data(i,4),'xm')
%     plot(aucabc(i,1),aucabc(i,2),'om')
%     text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
% end

cc = corrcoef(data(:,5),data(:,3));
r = cc(1,2)
s_r = sprintf('R=%.4f',r);
text(0.97,0.011,s_r,'Interpreter','none');
    
axis square
xlabel('G_AUC','Interpreter','none')
ylabel('\tau_{2,mean}','Interpreter','tex')
%legend('mean','max')
axis([0.9 1 0 0.012])

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'xtick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_xticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'xticklabel',new_xticks) 


%%
subplot(2,2,4)
hold on

% OLED
for i = [1 2 3]
    plot(data(i,5),data(i,4),'xg')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% High-end
for i = [4 5 6 8]
    plot(data(i,5),data(i,4),'xb')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% consumer grade
for i = [7 9 10 11 13]
    plot(data(i,5),data(i,4),'xr')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% mobile
for i = [12]
    plot(data(i,5),data(i,4),'xc')
    %text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% Low-end
% for i = [14 15]
%    plot(data(i,5),data(i,3),'om')
%    plot(data(i,5),data(i,4),'xm')
%     plot(aucabc(i,1),aucabc(i,2),'om')
%     text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
% end

cc = corrcoef(data(:,5),data(:,4));
r = cc(1,2);
s_r = sprintf('R=%.4f',r);
text(0.97,0.011,s_r,'Interpreter','none');
    
axis square
xlabel('G_AUC','Interpreter','none')
ylabel('\tau_{2,max}','Interpreter','tex')
%legend('mean','max')
axis([0.9 1 0 0.012])

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'xtick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_xticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'xticklabel',new_xticks) 



%%

     
return
     