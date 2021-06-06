% 8-14-2012
% based on rs232_cs2k_mac_m5.m
% to do: get and set measurement speed/observer

function rs232_cs2000a_mobile ()
    clc
    clear global;
    
    global S;
    global mea;
    global remote;
    global measize;
    main_dir=pwd;
    %folder_name = uigetdir;
    %cd (folder_name);
    %measize = str2double(input('Please enter the nuber of measurement set:', 's'));
    delay=0.5;
    Grayscale_max=256;
    Pattern_LUT=[0:1:255];
    temp = size(Pattern_LUT);
    measize = temp(2);
    specarray = zeros(measize,401);
    CS2000_on=1;
    Color_sel=[0 0 1];%[R G B]
    try
        if CS2000_on==1
            S = serial('COM7','RequestToSend','off','BaudRate',9600,'DataBits',8,'StopBits',1,'FlowControl','none')
        end
    
        % locate pattern
        beep;
        displayname = input('place pattern window and enter display name [cs2k]: ', 's');
        if (isempty(displayname))
            displayname = 'cs2k';
        end
        Time_start = tic;
        % measurement loop
        if Color_sel(1)==1
            %R
            fopen(S);
            cs2kenter;
            for i=1:1:measize
                cd('E:\Research\Aldo Measurement\Samsung\GalaxyS3\R\')
                fn=(sprintf('Samsung_GalaxyS3_R%d_G0_B0.jpg',Pattern_LUT(i)))
                fnmat = my_findfile(fn);
                if isempty(fnmat)
                    disp('error finding file')
                    return
                end
                boxSendImg(fnmat, '192.168.44.156',8080,3);
                mea(i,1)=(i-1);
                mea(i,2)=0;
                mea(i,3)=0;
                pause(delay);
                if CS2000_on==1
                    % obtain reading here
                    disp(sprintf('measuring %d/%d/%d',mea(i,1),mea(i,2),mea(i,3)))
                    tStart = tic;
                    
                    [cieY ciex ciey spec] = cs2kmeasure;
                    
                    etime = toc(tStart);
                    disp(sprintf('  time %.2f sec\n',etime))
                    
                    % save data
                    mea(i,4:7)=[cieY ciex ciey etime];
                    specarray(i,1:401) = spec(1:401);
                end
            end
            if CS2000_on==1
                % save results
                a = clock;
                timestamp = sprintf('%02d-%02d-%4d_%02d%02d',a(2),a(3),a(1),a(4),a(5));
                save([displayname '_R_' timestamp '.mat'],'mea','specarray');
                
                
                plot(spec);
                
                cs2kexit;
                
                rs232close;
            end
        end
        %G
        if Color_sel(2)==1
            fopen(S);
            cs2kenter;
            for i=1:1:measize
                cd('E:\Research\Aldo Measurement\Samsung\GalaxyS3\G\')
                fn=(sprintf('Samsung_GalaxyS3_R0_G%d_B0.jpg',Pattern_LUT(i)))
                fnmat = my_findfile(fn);
                if isempty(fnmat)
                    disp('error finding file')
                    return
                end
                boxSendImg(fnmat, '192.168.44.156',8080,3);
                mea(i,1)=0;
                mea(i,2)=(i-1);
                mea(i,3)=0;
                pause(delay);
                if CS2000_on==1
                    % obtain reading here
                    disp(sprintf('measuring %d/%d/%d',mea(i,1),mea(i,2),mea(i,3)))
                    tStart = tic;
                    
                    [cieY ciex ciey spec] = cs2kmeasure;
                    
                    etime = toc(tStart);
                    disp(sprintf('  time %.2f sec\n',etime))
                    
                    % save data
                    mea(i,4:7)=[cieY ciex ciey etime];
                    specarray(i,1:401) = spec(1:401);
                end
            end
            if CS2000_on==1
                % save results
                a = clock;
                timestamp = sprintf('%02d-%02d-%4d_%02d%02d',a(2),a(3),a(1),a(4),a(5));
                save([displayname '_G_' timestamp '.mat'],'mea','specarray');
                
                
                plot(spec);
                
                cs2kexit;
                
                rs232close;
            end
        end
        %B
        if Color_sel(3)==1
            fopen(S);
            cs2kenter;
            for i=1:1:measize
                cd('E:\Research\Aldo Measurement\Samsung\GalaxyS3\B\')
                fn=(sprintf('Samsung_GalaxyS3_R0_G0_B%d.jpg',Pattern_LUT(i)))
                fnmat = my_findfile(fn);
                if isempty(fnmat)
                    disp('error finding file')
                    return
                end
                boxSendImg(fnmat, '192.168.44.156',8080,3);
                mea(i,1)=0;
                mea(i,2)=0;
                mea(i,3)=(i-1);
                pause(delay);
                if CS2000_on==1
                    % obtain reading here
                    disp(sprintf('measuring %d/%d/%d',mea(i,1),mea(i,2),mea(i,3)))
                    tStart = tic;
                    
                    [cieY ciex ciey spec] = cs2kmeasure;
                    
                    etime = toc(tStart);
                    disp(sprintf('  time %.2f sec\n',etime))
                    
                    % save data
                    mea(i,4:7)=[cieY ciex ciey etime];
                    specarray(i,1:401) = spec(1:401);
                end
            end
            if CS2000_on==1
                % save results
                a = clock;
                timestamp = sprintf('%02d-%02d-%4d_%02d%02d',a(2),a(3),a(1),a(4),a(5));
                save([displayname '_B_' timestamp '.mat'],'mea','specarray');
                
                
                plot(spec);
                
                cs2kexit;
                
                rs232close;
            end
        end
        cd(main_dir);
        Time_end=toc(Time_start)
    catch
        disp('something wrong')
        cs2kexit;
        rs232close;
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
% boxSendImg
% Send an image file to a host:port with number_of_retries
function boxSendImg(file, host, port, number_of_retries)

    import java.net.Socket
    import java.io.*

    if (nargin < 4)
        number_of_retries = 20; % set to -1 for infinite
    end
    
    retry = 0;
    
    output_socket = [];
   
    
    while true

        retry = retry + 1;
        if ((number_of_retries > 0) && (retry > number_of_retries))
            fprintf(1, 'Too many retries\n');
            break;
        end
        
        try
            
            % throws if unable to connect
            output_socket = Socket(host, port);
            output_stream   = output_socket.getOutputStream;
            %d_output_stream = DataOutputStream(output_stream);

            %fprintf(1, 'Connected to server\n');
            %d_output_stream.write(1);%Specify sending image (1 is image, 2 is mouse data)
            fi=fopen(file);
            bytes = fread(fi);
            fclose(fi);
            %d_output_stream.write(bytes,0,length(bytes));
            output_stream.write(bytes,0,length(bytes));
            output_stream.flush();
            
            output_socket.close;
            %fprintf(1, 'Sent %d bytes\n',length(bytes));
            pause(0.25);
            break;
            
        catch
            if ~isempty(output_socket)
                output_socket.close;
            end
            fprintf(1, 'Retry %d connecting to %s:%d\n', retry, host, port);

            % pause before retrying
            pause(0.25);
        end
    end
end

function r = my_findfile (fn)
    dlist = dir('*.jpg');
    
    for i = 1:size(dlist)
        fn2 = dlist(i).name;
        if strncmpi(fn2,fn,length(fn)-4)
            r = fn2;
            return;
        end
    end
    r = '';
    return;
end 
    
function fn = my_filename (pattern_num)
    fn = sprintf('Image_%d.png',pattern_num);
end