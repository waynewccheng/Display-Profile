% 11-19-2019
% respond to Color Research and Application 
% reviewr question about figure 4 and 5
% added lines to save data

% 7-15-2014 
% calculate primary stability
% input: file name
% output: AUC and ABC

% function primary_stability_test (display_data_file)
%     [auc abc stability] = primary_stability (display_data_file);
% 
%     %clf
%     hold on
%     plot([0:1/255:1],stability(1,:),'r')
%     plot([0:1/255:1],stability(2,:),'g')
%     plot([0:1/255:1],stability(3,:),'b')
%     % plot(stability(4,:),'k')
%     axis equal
%     axis([0 1 0 1.02])
%     legend('R','G','B','Location','Southeast');
%     xlabel('Normalized DDL');
%     ylabel('Primary Stability');
%     
%     title(sprintf('AUC=%.2f%%  ABC=%.2f%%',auc*100,abc*100))
% end

function [auc abc stability] = primary_stability (display_data_file)
    
    load(display_data_file)
    
    % obtain primary R
    index = 1021;
    r = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));

    % obtain primary G
    index = 1022;
    g = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));

    % obtain primary B
    index = 1023;
    b = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));

    rgbration = zeros(3,256);
    stability = zeros(3,256);

    array_ratioXYZ = zeros(3,256,3);
    
    % for all DDL
    for i = 0:255
        % for RGB channels: 1,2,3
        for colorch = 1:3
            % get the index to the display data matric "mea"
            % r, g, b, w...
            index = 4*(i)+colorch;
            % get the color of interest
            t = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));
            % find the mixing matrix
            ratioXYZ = findratioXYZ(r,g,b,t);
            
            % save it for debugging
            array_ratioXYZ(colorch,i+1,:) = ratioXYZ;
            
            % definition of stability
            stability(colorch,i+1) = ratioXYZ(colorch) ./ sum(ratioXYZ);
        end
        
        % calculate ABC in channel 4
        colorch = 4;
        index = 4*(i)+colorch;
        t = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));
        % definition: max - min 
        stability(colorch,i+1)= max(stability(1:3,i+1)) - min(stability(1:3,i+1));
    end

    % calculate area
    auc = 0;
    for i = 1:256
        auc = auc + min(stability(1:3,i));
    end
    auc = auc/256;

    abc = 0;
    for i = 1:256
        abc = abc + stability(4,i);
    end
    abc = abc/256;

    % 11/19/2019
    save('array_ratioXYZ','array_ratioXYZ')
end

% convert from CIE xyz to CIE XYZ
function XYZ = xyY2XYZ (x, y, bigY)
    XYZ = [0 0 0];
    
    XYZ(2) = bigY;
    XYZ(1) = x * bigY / y;
    XYZ(3) = (1-x-y) * bigY / y;
end

% find the mixing ratio such that
% t = [r g b] * ret;
function ret = findratioXYZ (r, g, b, t)
    ma = [r(1) g(1) b(1); r(2) g(2) b(2); r(3) g(3) b(3)];
    mainv = inv(ma);
    ret = mainv * t';
end

