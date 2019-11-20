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



clf
hold on

j = 1;
for i = [14 19 20  2 6 11  1 16 8 9 4 15  5 17 13]
    fn = cell2mat(pn(i));
    fn2 = ['../data/' fn];
    
    %----------------------------
%    subplot(4,4,i)
%     gamutplot(fn2,i);
%     grid on

    %----------------------------
    subplot(5,3,j)
    
    displaytitle = sprintf('(%s) %s',char(97-1+j),cell2mat(dn(i)));
    [colorauc grayauc stability] = gray_stability_plot(fn2,displaytitle);

    aucabc(j,1) = colorauc;
    aucabc(j,2) = grayauc;
    displayn(j) = dnshort(i);
    
    if mod(j-1,3) == 0
        ylabel('Primary Purity')
    else
        %set(gca,'YTick',[])        
    end
    if (j>=13) &&(j<=15) 
        xlabel('DDL')
    else
        %set(gca,'XTick',[])        
    end
    
    s_auc = sprintf('C_AUC=%.2f%%',colorauc*100);
    s_abc = sprintf('G_AUC=%5.2f%%',grayauc*100);
    
    text(0.15,0.4,s_auc,'Interpreter','none');
    text(0.15,0.2,s_abc,'Interpreter','none');
    
    j = j+1;
%     
    %----------------------------
end

%return
figure

% summary plot


clf
hold on
% OLED
for i = [1 2 3]
    plot(aucabc(i,1),aucabc(i,2),'og')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% High-end
for i = [4 5 6 8]
    plot(aucabc(i,1),aucabc(i,2),'ob')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% consumer grade
for i = [7 9 10 11 13]
    plot(aucabc(i,1),aucabc(i,2),'or')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% mobile
for i = [12]
    plot(aucabc(i,1),aucabc(i,2),'oc')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

% Low-end
for i = [14 15]
    plot(aucabc(i,1),aucabc(i,2),'om')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

axis([0.8 1 0.7 1])
axis equal
xlabel('Color Tracking (C_AUC)','Interpreter','none')
ylabel('Gray Tracking (G_AUC)','Interpreter','none')

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'xtick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_xticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'xticklabel',new_xticks) 
     
  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_yticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'yticklabel',new_yticks) 