% 7-9-2021
% from iterator_colorgraytracking.m
% class

% 6-6-2021
% Q: cover image

% 6-7-2016
% gray tracking added

classdef displaysim < handle
    %DISPLAYSIM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %
        % define the pathname for 22 displays
        %
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
            'iPhone 4\Current\Original Display\Full Color_Full Gray\iPhone4 wcc 2016',
            
            'NEC PA271W\Current\Original Display\Full Color_Full Gray\necpa271w',
            'Samsung 3D\sm2233rz',
            'Samsung 910T\Current\Original Display\Full Color_Full Gray\Samsung19',
            'Samsung Galaxy S\galaxys_2016',
            'Sony PVM-2551MD\Current\Original Display\Full Color_Full Gray\SONY_PVM60',
            
            'Pyle PLCMHD70\Current\Pyle7_native_11-25-2014_1424',
            'Dell P2212Hb\Current\Original Display\Full Color_Full Gray\dell_p2212Hb_native_11-25-2014_1700',
            };
        
        %
        % define display full names (=manufacturer_model) for 22 displays
        %
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
        
        %
        % pick 15 out of 22, in CRA paper
        %
        % [14 19 20  2 6 11  1 16 8 9 4 15  5 17 13]
        %
        
        xyY_r
        xyY_g
        xyY_b
        xyY_w
        
        XYZ_r
        XYZ_g
        XYZ_b
        XYZ_w
        
        XYZ_whitepoint
        XYZ_blackpoint
        XYZ_primaryR
        XYZ_primaryG
        XYZ_primaryB
        
        id
        name
    end
    
    methods
        
        function obj = displaysim (i)
            %displaysim Construct an instance of this class
            %   Detailed explanation goes here
            
            obj.id = i;
            obj.name = obj.dn(i);
            
            % construct the measurement filename
            fn = cell2mat(obj.pn(i));
%            fn2 = ['../data/' fn];
            fn2 = ['C:\Users\wcc\Documents\GitHub\Display-Profile\data\' fn];

            % load the measurement data
            load(fn2)
            %whos
            
            % retrive RGBW channels
            obj.xyY_r = [mea(1:4:1024,5) mea(1:4:1024,6) mea(1:4:1024,4)];
            obj.xyY_g = [mea(2:4:1024,5) mea(2:4:1024,6) mea(2:4:1024,4)];
            obj.xyY_b = [mea(3:4:1024,5) mea(3:4:1024,6) mea(3:4:1024,4)];
            obj.xyY_w = [mea(4:4:1024,5) mea(4:4:1024,6) mea(4:4:1024,4)];
            
            obj.XYZ_r = obj.xyY2XYZ(obj.xyY_r);
            obj.XYZ_g = obj.xyY2XYZ(obj.xyY_g);
            obj.XYZ_b = obj.xyY2XYZ(obj.xyY_b);
            obj.XYZ_w = obj.xyY2XYZ(obj.xyY_w);
            
            obj.XYZ_whitepoint = obj.XYZ_w(255,:);
            obj.XYZ_blackpoint = obj.XYZ_w(1,:);

            obj.XYZ_primaryR = obj.XYZ_r(255,:);
            obj.XYZ_primaryG = obj.XYZ_g(255,:);
            obj.XYZ_primaryB = obj.XYZ_b(255,:);
            
            return
            
        end
        
        function XYZ = rgb_predict_XYZ (obj,rgb)
            % XYZ from each channel
            subpixel_r = obj.XYZ_r(rgb(1)+1,:);
            subpixel_g = obj.XYZ_g(rgb(2)+1,:);
            subpixel_b = obj.XYZ_b(rgb(3)+1,:);
            
            % leakage of black point
            subpixel_black = obj.XYZ_w(1,:);
            
            %
            % each of RGB has subpixel_black; keep only one by minus 2
            %
            XYZ = subpixel_r + subpixel_g + subpixel_b - 2*subpixel_black;
        end
        
        function show_curves (obj)
            clf
            
            lmax = max(obj.XYZ_w(255,:))
            
            subplot(2,2,1)
            show_curves_x1(obj.XYZ_r,'-')
            title(obj.name,'Interpreter','None')
            
            subplot(2,2,2)
            show_curves_x1(obj.XYZ_g,'-')
            
            subplot(2,2,3)
            show_curves_x1(obj.XYZ_b,'-')
            
            subplot(2,2,4)
            hold on
            show_curves_x1(obj.XYZ_w,'-')
            show_curves_x1(obj.XYZ_r+obj.XYZ_g+obj.XYZ_b,':')
            
            return
            
            function show_curves_x1 (XYZ,mkr)
                hold on
                plot(XYZ(:,1),[mkr 'r'])
                plot(XYZ(:,2),[mkr 'g'])
                plot(XYZ(:,3),[mkr 'b'])
                legend('X','Y','Z','Location','northwest')
                xlabel('DDL')
                ylabel('CIEXYZ')
                axis([0 255 0 lmax])
                axis square
                return
            end
        end
        
        %
        % convert from CIE xyz to CIE XYZ
        %
        function XYZ = xyY2XYZ (obj,xyY)
            x = xyY(:,1);
            y = xyY(:,2);
            bigY = xyY(:,3);
            
            XYZ(:,2) = bigY;
            XYZ(:,1) = x .* bigY ./ y;
            XYZ(:,3) = (1-x-y) .* bigY ./ y;
        end
        
        
    end
end




