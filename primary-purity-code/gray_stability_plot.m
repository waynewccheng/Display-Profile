% 7-24-2014 
% draw primary stability

function [colorauc grayauc stability] = gray_stability_plot (display_data_file, display_name)

    [colorauc abc stability] = primary_stability (display_data_file);

    hold on
    
    plot(0:1/255:1,stability(1,:),'r');
    plot(0:1/255:1,stability(2,:),'g');
    plot(0:1/255:1,stability(3,:),'b');

    [grayauc gt_stability] = gray_stability (display_data_file);
    plot(0:1/255:1,gt_stability(4,:),'k:');
    
    %    legend('R','G','B','Location','SouthEast')
    axis([0 1 0 1.1])
    axis square

  % stole from https://www.mathworks.com/matlabcentral/answers/94708-how-do-i-change-my-y-axis-or-x-axis-values-to-percentage-units-and-have-these-changes-reflected-on  
% Convert y-axis values to percentage values by multiplication
     a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
% Create a vector of '%' signs
     pct = char(ones(size(a,1),1)*'%'); 
% Append the '%' signs after the percentage values
     new_yticks = [char(a),pct];
% 'Reflect the changes on the plot
     set(gca,'yticklabel',new_yticks)     
    
%    xlabel('DDL')
%    ylabel('Primary Stability')
%    title(sprintf('%s: AUC=%.2f%%, ABC=%.2f%%',display_name,auc*100,abc*100),'Interpreter','none')
    title(sprintf('%s',display_name),'Interpreter','none')
end

