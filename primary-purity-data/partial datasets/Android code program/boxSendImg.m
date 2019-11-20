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