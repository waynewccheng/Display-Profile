% 6-20-2018 TG196
% 6-1-2016
% find the gray stability
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

function [Yuv T1 T2] = tg196_gray_tracking (display_data_file)
    
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

    % obtain primary W
    index = 1024;
    w = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));
    
    stability = zeros(4,256);
    Yuv = zeros(18,3);
    
    % for DDL = 0, 15, 30,...,255
    for j = 0:17
        ddl = j*15;

        % gray
        colorch = 4;
        
        % get the index to the display data matric "mea"
        % r, g, b, w...
        index = 4*ddl + colorch;

        % get XYZ
        patchXYZ = xyY2XYZ(mea(index,5),mea(index,6),mea(index,4));
        
        Yuv(j+1,1:3) = XYZ2Yuv(patchXYZ);

        
    end
    
    % calculate differences
    for j = 1:17
        Yuv1 = Yuv(j,:);
        Yuv2 = Yuv(j+1,:);
        Yuv3 = Yuv(18,:);
        T1(j) = delta_uv(Yuv1,Yuv3);
        T2(j) = delta_uv(Yuv1,Yuv2);
    end

%     plot(0:17,Yuv(:,2))
%     hold on
%     plot(0:17,Yuv(:,3))
    
end

% convert from CIE xyz to CIE XYZ
function XYZ = xyY2XYZ (x, y, bigY)
    XYZ = [0 0 0];
    
    XYZ(2) = bigY;
    XYZ(1) = x * bigY / y;
    XYZ(3) = (1-x-y) * bigY / y;
end

% convert from CIE XYZ to CIE LUV
% https://en.wikipedia.org/wiki/CIELUV
function Yuv = XYZ2Yuv (XYZ)
    Y = XYZ(2);
    u_prime = 4*XYZ(1)/(XYZ(1)+15*XYZ(2)+3*XYZ(3));
    v_prime = 9*XYZ(1)/(XYZ(1)+15*XYZ(2)+3*XYZ(3));
    Yuv = [Y u_prime v_prime];
end

function duv = delta_uv (Yuv1,Yuv2)
    if Yuv1(1) < 5 || Yuv2(1) < 5 
        duv = 0;        
    else
        uv1 = Yuv1(2:3);
        uv2 = Yuv2(2:3);
        duv = sum((uv1-uv2).^2).^0.5;        
    end
end
