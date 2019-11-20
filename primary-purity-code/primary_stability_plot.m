% 7-24-2014 
% draw primary stability

function [auc abc stability] = primary_stability_plot (display_data_file, display_name)

    [auc abc stability] = primary_stability (display_data_file);

    hold on
    plot(stability(1,:),'r');
    plot(stability(2,:),'g');
    plot(stability(3,:),'b');
%    legend('R','G','B','Location','SouthEast')
    axis([0 255 0 1.1])
    axis square
%    xlabel('DDL')
%    ylabel('Primary Stability')
%    title(sprintf('%s: AUC=%.2f%%, ABC=%.2f%%',display_name,auc*100,abc*100),'Interpreter','none')
    title(sprintf('%s',display_name),'Interpreter','none')
end

