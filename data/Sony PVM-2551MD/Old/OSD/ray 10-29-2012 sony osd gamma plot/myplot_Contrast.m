
function myplot_Contrast()
%Gamma 1.8
figure(1)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G18_COOFF_CH1_10-24-2012_1300.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G18_COOFF_CH1_10-24-2012_1337.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G18_COOFF_CH1_10-24-2012_1415.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G18_COOFF_CH1_10-24-2012_1452.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G18_COOFF_CH1_10-24-2012_1529.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G18_COOFF_CH1_10-24-2012_1605.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G18_COOFF_CH1_10-24-2012_1641.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

figure(2)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G18_COOFF_CH1_10-24-2012_1300.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*5,'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G18_COOFF_CH1_10-24-2012_1337.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*3.4,'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G18_COOFF_CH1_10-24-2012_1415.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*2.5,'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G18_COOFF_CH1_10-24-2012_1452.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.9,'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G18_COOFF_CH1_10-24-2012_1529.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.5,'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G18_COOFF_CH1_10-24-2012_1605.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.2,'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G18_COOFF_CH1_10-24-2012_1641.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

%Gamma 2.0
figure(3)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G20_COOFF_CH1_10-24-2012_1256.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G20_COOFF_CH1_10-24-2012_1333.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G20_COOFF_CH1_10-24-2012_1411.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G20_COOFF_CH1_10-24-2012_1448.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G20_COOFF_CH1_10-24-2012_1525.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G20_COOFF_CH1_10-24-2012_1601.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G20_COOFF_CH1_10-24-2012_1637.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

figure(4)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G20_COOFF_CH1_10-24-2012_1256.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*6.02,'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G20_COOFF_CH1_10-24-2012_1333.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*3.87,'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G20_COOFF_CH1_10-24-2012_1411.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*2.72,'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G20_COOFF_CH1_10-24-2012_1448.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*2.02,'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G20_COOFF_CH1_10-24-2012_1525.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.54,'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G20_COOFF_CH1_10-24-2012_1601.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.23,'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G20_COOFF_CH1_10-24-2012_1637.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

%Gamma 2.2
figure(5)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G22_COOFF_CH1_10-24-2012_1254.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G22_COOFF_CH1_10-24-2012_1331.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G22_COOFF_CH1_10-24-2012_1409.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G22_COOFF_CH1_10-24-2012_1446.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G22_COOFF_CH1_10-24-2012_1523.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G22_COOFF_CH1_10-24-2012_1559.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G22_COOFF_CH1_10-24-2012_1635.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

figure(6)
hold on
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR40_BR50_G22_COOFF_CH1_10-24-2012_1254.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*7.3,'red')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR50_BR50_G22_COOFF_CH1_10-24-2012_1331.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*4.45,'green')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR60_BR50_G22_COOFF_CH1_10-24-2012_1409.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*3,'cyan')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR70_BR50_G22_COOFF_CH1_10-24-2012_1446.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*2.16,'magenta')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR80_BR50_G22_COOFF_CH1_10-24-2012_1523.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.61,'blue')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR90_BR50_G22_COOFF_CH1_10-24-2012_1559.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6)*1.25,'yellow')%Plot Gamma Curve
load('C:\Workspace\Sony OLED Database\Database\Gamma Special\Sony_PVM_D65_CR100_BR50_G22_COOFF_CH1_10-24-2012_1635.mat')
[lmin lmax gam] = ray_findgamma(mea);
plot(mea(1:1:16,6),'black')%Plot Gamma Curve

end
 
function [lmin lmax gam] = ray_findgamma(mea)

    graylevel_normalize=zeros(16,1);
    Gamma_normalize=zeros(16,1);
    Fit_gamma=zeros(16,1);
    Gamma=4;
    Constrain=0.1;
    flag = 1;
    Acc=4;
    mea1=mea;
    %specarray1=specarray;
    Retry_count=0;

    lmin = mea1(1,6);
    lmax = mea1(16,6);
    xmin = mea1(1,1)/255;
    xmax = mea1(16,1)/255;

    while(flag)
        if(Retry_count==400)
            Constrain=Constrain+0.001;
            Retry_count=0;
            Gamma=4;
        else
            if(Acc>=Constrain)
                Acc=0;
                Gamma=Gamma-0.01;

                for i=1:1:16
                    graylevel_normalize(i) = mea1(i,1)./255;
                    Gamma_normalize(i) = mea1(i,6)/(mea1(16,6) / (xmax^Gamma-xmin^Gamma));
                    Fit_gamma(i)=graylevel_normalize(i)^Gamma + Gamma_normalize(1);
%                    Fit_gamma(i) = my_gamma(xmin,xmax,lmin,lmax,Gamma, graylevel_normalize(i)) ./ lmax;
                    Acc=Acc+abs(Fit_gamma(i)-Gamma_normalize(i));
                end
                Retry_count=Retry_count+1;
            else
                flag=0;
                %Acc=0;
            end
        end
    end
%     figure
%     hold on
%     plot(Gamma_normalize,'red')%Plot Gamma Curve
%     plot(Fit_gamma,'green')%Plot Gamma Curve
    gam = Gamma;

        [lmin lmax gam]
    return
end