% 11-28-2012
% require 'ScreenBright.exe' in the same directory
% based on rs232_sony_cs2000_auto()
% 10-15-2012


function rs232_cs2000_DDC()
    clear
    global S;
    global mea;
    global remote;
    global measize;

    % check if ScreenBright.exe exists
    fd = dir('screenbright.exe')
    fdsize = size(fd)
    if (fdsize(1)==0)
       disp('cannot find ScreenBright.exe')
       return
    end
    
    measize = 0;
    preparepattern();
    specarray = zeros(measize,401);

    % for user to locate the pattern
    clf
    showpattern(128,128,128);
    beep;
    displayname = input('place pattern window and enter: ', 's');

    tStart2 = tic;
    S = serial('COM9','RequestToSend','off','BaudRate',9600,'DataBits',8,'StopBits',1,'FlowControl','none')
    fopen(S);
    cs2kenter;

    for Contrast = 100%[20 40 60 80 100]
        
        for Brightness = 100%[0 20 40 60 80 100]
            
            for Red_Color = 100
                
                for Green_Color = 50
                    
                    for Blue_Color = 100
                        
                        adjust_contrast (Contrast);
                        adjust_brightness (Brightness);
                        adjust_redcolor (Red_Color);
                        adjust_greencolor (Green_Color);
                        adjust_bluecolor (Blue_Color);
                        
                        try
                            %          for r=3:1:6
                            %              adjust_sony_gamma_color_chroma( r, 1, 1, commport);
                            % locate pattern
                            
                            displayname1 = sprintf('DDC_CR%d_BR%d_R%d_G%d_B%d',Contrast,Brightness,Red_Color,Green_Color,Blue_Color)
                            
                            
                            % measurement loop
                            
                            for i=1:measize
                                red=mea(i,1);
                                green=mea(i,2);
                                blue=mea(i,3);
                                showpattern(red,green,blue);
                                
                                % obtain reading here
                                disp(sprintf('measuring %d/%d/%d',red,green,blue))
                                
                                tStart = tic;
                                [cieY ciex ciey spec] = cs2kmeasure;
                                etime = toc(tStart);
                                
                                
                                % save data
                                mea(i,4:7)=[cieY ciex ciey etime];
                                specarray(i,1:401) = spec(1:401);
                            end
                            
                            % save results
                            %                a = clock;
                            %                timestamp = sprintf('%02d-%02d-%4d_%02d%02d',a(2),a(3),a(1),a(4),a(5));
                            %                save([displayname1 '_' timestamp '.mat'],'mea','specarray');
                            
                            save([displayname1 '.mat'],'mea','specarray');
                            
                            
                        catch
                            disp('something wrong')
                            cs2kexit;
                            rs232close;
                        end
                    end
                end
            end
            
        end
    end
cs2kexit;

rs232close;
etime2 = toc(tStart2);
disp(sprintf('  time %.2f sec\n',etime2))
end


function [a b] = adjust_contrast (val)
    if val < 0 || val > 100
        disp('out of range')
        return
    end
    
    cmd = sprintf('screenbright -set contrast %d',val)
    [a b] = system(cmd)
    pause(5)
end

function [a b] = adjust_brightness (val)
    if val < 0 or val > 100
        disp('out of range')
        return
    end
    
    cmd = sprintf('screenbright -set brightness %d',val)
    [a b] = system(cmd)
    pause(5)
end

function [a b] = adjust_redcolor (val)
    if val < 0 or val > 100
        disp('out of range')
        return
    end
    
    cmd = sprintf('screenbright -set red %d',val)
    [a b] = system(cmd)
    pause(5)
end

function [a b] = adjust_greencolor (val)
    if val < 0 or val > 100
        disp('out of range')
        return
    end
    
    cmd = sprintf('screenbright -set green %d',val)
    [a b] = system(cmd)
    pause(5)
end

function [a b] = adjust_bluecolor (val)
    if val < 0 or val > 100
        disp('out of range')
        return
    end
    
    cmd = sprintf('screenbright -set blue %d',val)
    [a b] = system(cmd)
    pause(5)
end


function preparepattern ()
    global mea;
    global measize;

    % specify pattern here
    % grayscale only
    t = [0:16:239 255];

    ts = size(t);
    steps=ts(2);
    measize = steps*4;
    mea = zeros(measize,7);
    
    %Red
    mea(1:4:measize,1)= t';
    mea(1:4:measize,2)= zeros(steps,1);
    mea(1:4:measize,3)= zeros(steps,1);
    %Green
    mea(2:4:measize,1)= zeros(steps,1);
    mea(2:4:measize,2)= t';
    mea(2:4:measize,3)= zeros(steps,1);
    %Blue
    mea(3:4:measize,1)= zeros(steps,1);
    mea(3:4:measize,2)= zeros(steps,1);
    mea(3:4:measize,3)= t';
    %Gray
    mea(4:4:measize,1)= t';
    mea(4:4:measize,2)= t';
    mea(4:4:measize,3)= t';
end


function showpattern (red,green,blue)
    global remote
    global ipaddr
    global portno
    imagedimx = 640; 
    imagedimy = 960;
    ia = uint8(ones(imagedimy,imagedimx,3))*128;  % image frame
    unityarray = ones(imagedimy,imagedimx); % for assignment
    
    % prepare pattern
    ia(:,:,1) = uint8(red .* unityarray);
    ia(:,:,2) = uint8(green .* unityarray);
    ia(:,:,3) = uint8(blue .* unityarray);
    % show the image
    if (remote==1)
        imwrite(ia,'1.jpg');
        boxSendImg('1.jpg',ipaddr, portno, 1)
    else
        image(ia);
        pause(0.1);
    end    
end

function [vy vciex vciey spec] = cs2kmeasure
    global S

    spec = zeros(1,401);
    
    % --- trigger measurement
    rs232send('MEAS,1');

    % pre-measurement
    err = rs232get;
    if (err(1:5)=='OK00,')
        wait = err(6:length(err));
        waitsec = str2num(wait) + 1;
        pause(waitsec)
    else
        disp error pre-measure
        cs2kexit;
        rs232close;
    end
    
    % actual measurement completed
    err = rs232get;
    if (err(1:4)~='OK00')
        disp error actual
        cs2kexit;
        rs232close;
    end

    % --- obtain colorimetric measurement data
    rs232send('MEDR,2,0,02');
    err = rs232get;
    if (err(1:4) ~= 'OK00')
        disp error obtain
        cs2kexit;
        rs232close;
    else
        % parse result
        val = textscan(err,'%s %f %f %f\n','Delimiter',',');
        vy = cell2mat(val(2));
        vciex = cell2mat(val(3));
        vciey = cell2mat(val(4));
    end
    
    % --- obtain spectral measurement data
    specindex = 1;
    rs232send('MEDR,1,0,01');
    err = rs232get;
    if (err(1:4) ~= 'OK00')
        disp error obtain
        cs2kexit;
        rs232close;
    else
        % parse result
        commapos = strfind(err,',');
        commapos(101) = length(err)+1;

        for i = 1:100
           wavelength = err(commapos(i)+1:commapos(i+1)-1);
           spec(specindex) = str2num(wavelength);
           specindex = specindex + 1;
        end
    end
    
    rs232send('MEDR,1,0,02');
    err = rs232get;
    if (err(1:4) ~= 'OK00')
        disp error obtain
        cs2kexit;
        rs232close;
    else
        % parse result
        commapos = strfind(err,',');
        commapos(101) = length(err)+1;

        for i = 1:100
           wavelength = err(commapos(i)+1:commapos(i+1)-1);
           spec(specindex) = str2num(wavelength);
           specindex = specindex + 1;
        end
    end

    rs232send('MEDR,1,0,03');
    err = rs232get;
    if (err(1:4) ~= 'OK00')
        disp error obtain
        cs2kexit;
        rs232close;
    else
        % parse result
        commapos = strfind(err,',');
        commapos(101) = length(err)+1;

        for i = 1:100
           wavelength = err(commapos(i)+1:commapos(i+1)-1);
           spec(specindex) = str2num(wavelength);
           specindex = specindex + 1;
        end
    end

    rs232send('MEDR,1,0,04');
    err = rs232get;
    if (err(1:4) ~= 'OK00')
        disp error obtain
        cs2kexit;
        rs232close;
    else
        % parse result
        commapos = strfind(err,',');
        commapos(102) = length(err)+1;

        for i = 1:101
           wavelength = err(commapos(i)+1:commapos(i+1)-1);
           spec(specindex) = str2num(wavelength);
           specindex = specindex + 1;
        end
    end
end


% enter the remote mode
function ret = cs2kenter
    % enter and exit the remote mode to avoid receiving the 'REMOTE MODE' message; should flush the serial port 
    % enter Remote mode
    global S
    rs232send('RMTS,1');
    ret = rs232get;
end

% leave the remote mode
function ret = cs2kexit
    % exit Remote mode
    global S
    rs232send('RMTS,0');
    ret = rs232get;
end

% close the serial port
function rs232close
    global S

    fclose(S);
    clear S;
end

% send a string+13 to the serial port
function rs232send (str)
    global S

    str
    fwrite(S,str);
    fwrite(S,13);
end

% get a 13-terminating string from the serial port
function ret = rs232get
    global S

    flag = 1;
    ret = '';
    while flag
        b = fread(S,1,'uint8');
        if b == 13
            flag = 0;
        else
            ret = [ret b];
        end
    end
end