d = loadFile('hb1455_10s.dat');

ds = msg(d,1,1024,2000);
plot(abs(ds(:,1000)));
plot(abs(ds(379, :)));
da = abs(ds(379, 1000));

%ffreq(d)
%d = abs(d(379, :));
%demodulation
fs = 2048000; 			% sampling frequency
dt = 1/fs;    			% sampling time
t = [1:length(da)]*dt;   % time of each of the samples of d
%dm = da.*exp(-i*2*pi*(-396000)*t);
fc = 200;
fDev = 50;
dm = abs(d(379, :));% d is the RF data loaded above, dm is is the demodulated data WHAT IS THIS


%filtering
dmd = decimate(dm,8,'fir');
dfm = decimate(dmd, 8, 'fir');

%displaying
%msg(dfm, 1, 256, 1024);

