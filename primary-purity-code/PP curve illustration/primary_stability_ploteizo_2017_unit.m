% 7-24-2014 
% draw primary stability

function primary_stability_plot_eizo

    display_data_file = '..\..\data\EIZO R31\Current\Original Display\Full Color_Full Gray\EIZO_R31';

    [colorauc abc stability] = primary_stability (display_data_file);
    [grayauc gt_stability] = gray_stability (display_data_file);

    clf
    hold on

    % draw 3 curves to generate legends
    plot(stability(1,:),'r');
    plot(stability(2,:),'g');
    plot(stability(3,:),'b');
    plot(gt_stability(4,:),'k--');
    
    % lower curve
    ln = stability(2,:);

    % upper curve
    ln2 = gt_stability(4,:);

    % draw G_AUC
    px1 = 0:1/255:1;
    py1 = ln2;
    px1 = [px1 1 1 0 0];
    py1 = [py1 ln2(256) 0.01 0.01 ln2(1)];
    fill(px1,py1,[0.95 0.98 0.98],'EdgeColor','none');

    % draw C_AUC
    px1 = 0:1/255:1;
    py1 = ln;
    px1 = [px1 1 1 0 0];
    py1 = [py1 ln(256) 0.01 0.01 ln(1)];
    fill(px1,py1,[0.98 0.98 0.95],'EdgeColor','none');

    % draw 3 curves again
    x1 = 0:1/255:1;
    plot(x1,stability(1,:),'r');
    plot(x1,stability(2,:),'g');
    plot(x1,stability(3,:),'b');
    plot(x1,gt_stability(4,:),'k--');
    legend('Red s(d,0,0)','Green s(0,d,0)','Blue s(0,0,d)','Gray t(d,d,d)','Location','SouthEast')
    
    axis([0 1 0 1])
    axis square
    xlabel('DDL d')
    ylabel('Primary and Gray Purity')

    s_auc = sprintf('CAUC = %.2f%%',colorauc*100);
    s_abc = sprintf('GAUC = %5.2f%%',grayauc*100);
    text(25,0.3,s_auc,'Interpreter','none');
    text(25,0.2,s_abc,'Interpreter','none');
    
    x1 = [0 1];
    y1 = [1 1];
    y2 = [0.5 0.5];
    plot(x1,y1,'k:')
    plot(x1,y2,'k:')

    
  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_yticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'yticklabel',new_yticks) 
     
end

