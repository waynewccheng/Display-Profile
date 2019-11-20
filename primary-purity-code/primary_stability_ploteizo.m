% 7-24-2014 
% draw primary stability

function primary_stability_plot_eizo

    display_data_file = '..\data\EIZO R31\Current\Original Display\Full Color_Full Gray\EIZO_R31';

    [auc abc stability] = primary_stability (display_data_file);

    clf
    hold on

    % draw 3 curves to generate legends
    plot(0:255,stability(1,:),'r');
    plot(0:255,stability(2,:),'g');
    plot(0:255,stability(3,:),'b');
    legend('Red s(d,0,0)','Green s(0,d,0)','Blue s(0,0,d)','Location','NorthWest')

    % lower curve
    ln = stability(2,:);

    % upper curve
    ln2 = stability(3,:);

    % draw AUC
    px1 = 0:255;
    py1 = ln;
    px1 = [px1 255 255 0 0];
    py1 = [py1 ln(256) 0 0 ln(1)];
    fill(px1,py1,[0.98 0.98 0.75],'EdgeColor','none');

    % draw ABC
    px1 = [0:255 255 255 255:-1:0 0 0];
    py1 = [ln2 ln2(256) ln(256) fliplr(ln) 0 0];
    fill(px1,py1,[0.75 0.98 0.98],'EdgeColor','none');
    
    % draw 3 curves again
    plot(0:255,stability(1,:),'r');
    plot(0:255,stability(2,:),'g');
    plot(0:255,stability(3,:),'b');

    axis([0 255 0 1.1])
    axis square
    xlabel('DDL d')
    ylabel('Primary Purity')
%    title(sprintf('%s: AUC=%.2f%%, ABC=%.2f%%',display_name,auc*100,abc*100),'Interpreter','none')

    auc
    abc

    
    x1 = [0 255];
    y1 = [1 1];
    y2 = [0.5 0.5];
    plot(x1,y1,'k:')
    plot(x1,y2,'k:')
end

