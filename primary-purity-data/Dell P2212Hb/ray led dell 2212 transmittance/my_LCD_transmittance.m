load DELL+2212_08-17-2012_2311

specr = specarray(1:4:256,:);
specg = specarray(2:4:256,:);
specb = specarray(3:4:256,:);
specw = specarray(4:4:256,:);

bandwidth=3;
for ddl=1:64
temp = specr;
for w= 1:401
    wbegin = max(1,w-bandwidth);
    wend = min(401,w+bandwidth);
    specr(ddl,w) = mean(temp(ddl,wbegin:wend));
end
end

for ddl=1:64
temp = specg;
for w= 1:401
    wbegin = max(1,w-bandwidth);
    wend = min(401,w+bandwidth);
    specg(ddl,w) = mean(temp(ddl,wbegin:wend));
end
end

for ddl=1:64
temp = specb;
for w= 1:401
    wbegin = max(1,w-bandwidth);
    wend = min(401,w+bandwidth);
    specb(ddl,w) = mean(temp(ddl,wbegin:wend));
end
end


xrange = 380:780;

clf

subplot(2,1,1)
hold on

%for ddl = 1:16:64
for ddl = 48
     plot(xrange,specr(ddl,:),'r')
     plot(xrange,specg(ddl,:),'g')
     plot(xrange,specb(ddl,:),'b')
end
for ddl = 64
     plot(xrange,specr(ddl,:),'r')
     plot(xrange,specg(ddl,:),'g')
     plot(xrange,specb(ddl,:),'b')
end
axis([400 700 0 0.00005])


subplot(2,1,2)
hold on

%for ddl = 1:16:64

for ddl = [1 32 48 56]
   plot(xrange,specr(ddl,:)./specr(64,:),'r')
   plot(xrange,specg(ddl,:)./specg(64,:),'g')
   plot(xrange,specb(ddl,:)./specb(64,:),'b')
end


axis([400 700 0 1])
