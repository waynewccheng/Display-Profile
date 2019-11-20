pn = {'Apple Cinema\Current\Original Display\Full Color_Full Gray\Apple_Cinema', 
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
'iPhone 4\Current\Original Display\Full Color_Full Gray\iPhone4 wcc',
'NEC PA271W\Current\Original Display\Full Color_Full Gray\necpa271w',
'Samsung 3D\sm2233rz',
'Samsung 910T\Current\Original Display\Full Color_Full Gray\Samsung19',
'Samsung Galaxy S\galaxys',
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
'NEC_PA271W',
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
%for i = [14 19 20  2 6 10  1 16 8 9 4 15  5 17 13]
for i = [14 19 20  2 6 10 1 16 8 9 22 15  5 17 13]
    fn = cell2mat(pn(i));
    fn2 = ['../data/' fn];
    
    %----------------------------
%    subplot(4,4,i)
%     gamutplot(fn2,i);
%     grid on

    %----------------------------
    subplot(5,3,j)
    
    displaytitle = sprintf('(%s) %s',char(97-1+j),cell2mat(dn(i)));
    [auc abc stability] = primary_stability_plot(fn2,displaytitle);

    abc6 = mean(stability(4,[52 85 121 160 200 243]));
    
    aucabc(j,1) = auc;
    aucabc(j,2) = abc;
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
    
    %s_auc = sprintf('PPAUC=%.2f%%',auc*100);
    s_abc6 = sprintf('PPABC6=%.2f%%',abc6*100);
    s_abc = sprintf('PPABC=%5.2f%%',abc*100);
    
    %text(40,0.4,s_auc);
    text(40,0.4,s_abc6);
    text(40,0.2,s_abc);
    
    j = j+1;
%     
    %----------------------------
end

return
% summary plot


clf
hold on
% OLED
for i = [1 2 3]
    plot(aucabc(i,1),aucabc(i,2),'og')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end
for i = [4 5 6]
    plot(aucabc(i,1),aucabc(i,2),'ob')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end
for i = [7 8 9 10]
    plot(aucabc(i,1),aucabc(i,2),'or')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end
for i = [11 12]
    plot(aucabc(i,1),aucabc(i,2),'oc')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end
for i = [13 14 15]
    plot(aucabc(i,1),aucabc(i,2),'om')
    text(aucabc(i,1)+0.002,aucabc(i,2)+0.001,displayn(i),'Interpreter','none')
end

axis([0.83 1 0 0.11])
axis equal
xlabel('PPAUC (good color tracking)')
ylabel('PPABC (poor gray tracking)')