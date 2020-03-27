
h = loadFile('ab1355_10s.dat');
hs = msg(h,1,256,80000); %samples the data in 80,000 256 unit-sized blocks
g = ffreq(h); %gives 11 or so values based on center frequency
plot(abs(hs(:,1000))); %plots data at t = 1 second



fs = 2048000; 			% sampling frequency
dt = 1/fs;    			% sampling time
t = [1:length(hs)]*dt;  		% time of each of the samples of d
%hm = s.*exp(-i*2*pi*(g(n))*t);

m = ones(1, length(g));
test_freq = (2048000/2)+ g(8);
downsampled_freq = round(test_freq/8000);
plot(abs(hs(downsampled_freq, :)));

tiledlayout('flow');

for n = 1:length(g)
g(n)
channel_freq_mhz =  (2048000/2)+ g(n);
channel_freq = round(channel_freq_mhz/8000);

hx = abs(hs(channel_freq,:));
%hm = abs(hs.*exp(-i*2*pi*(g(n))*t));

nexttile
plot(hx)
title(g(n))

if mod(n, 3) == 0
  disp(3);  
end
%hx = hx/max(hx);
%sound(hx,8000);

end

