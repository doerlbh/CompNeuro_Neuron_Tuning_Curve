
% This is the most orthdoxical, simplistic and dumb method among the three I thought of.
% So here I basically created 20 different scripts to replicate what I did
% in question 1 and 2, then plotted them on the graph here.

generateNoisyData101000; % spiketrain workspace: 10input, 1000trials
generateNoisyData201000; % spiketrain workspace: 20input, 1000trials
generateNoisyData301000; % spiketrain workspace: 30input, 1000trials
generateNoisyData401000; % spiketrain workspace: 40input, 1000trials
generateNoisyData501000; % spiketrain workspace: 50input, 1000trials
generateNoisyData601000; % spiketrain workspace: 60input, 1000trials
generateNoisyData701000; % spiketrain workspace: 70input, 1000trials
generateNoisyData801000; % spiketrain workspace: 80input, 1000trials
generateNoisyData901000; % spiketrain workspace: 90input, 1000trials
generateNoisyData1001000; % spiketrain workspace: 100input, 1000trials
generateNoisyData1101000; % spiketrain workspace: 110input, 1000trials
generateNoisyData1201000; % spiketrain workspace: 120input, 1000trials
generateNoisyData1301000; % spiketrain workspace: 130input, 1000trials
generateNoisyData1401000; % spiketrain workspace: 140input, 1000trials
generateNoisyData1501000; % spiketrain workspace: 150input, 1000trials
generateNoisyData1601000; % spiketrain workspace: 160input, 1000trials
generateNoisyData1701000; % spiketrain workspace: 170input, 1000trials
generateNoisyData1801000; % spiketrain workspace: 180input, 1000trials
generateNoisyData1901000; % spiketrain workspace: 190input, 1000trials
generateNoisyData2001000; % spiketrain workspace: 200input, 1000trials

% make matrix to store the sum of spikes in each trail in a column
Sum101000 = sum(spiketrain101000, 2);
Sum201000 = sum(spiketrain201000, 2);
Sum301000 = sum(spiketrain301000, 2);
Sum401000 = sum(spiketrain401000, 2);
Sum501000 = sum(spiketrain501000, 2);
Sum601000 = sum(spiketrain601000, 2);
Sum701000 = sum(spiketrain701000, 2);
Sum801000 = sum(spiketrain801000, 2);
Sum901000 = sum(spiketrain901000, 2);
Sum1001000 = sum(spiketrain1001000, 2);
Sum1101000 = sum(spiketrain1101000, 2);
Sum1201000 = sum(spiketrain1201000, 2);
Sum1301000 = sum(spiketrain1301000, 2);
Sum1401000 = sum(spiketrain1401000, 2);
Sum1501000 = sum(spiketrain1501000, 2);
Sum1601000 = sum(spiketrain1601000, 2);
Sum1701000 = sum(spiketrain1701000, 2);
Sum1801000 = sum(spiketrain1801000, 2);
Sum1901000 = sum(spiketrain1901000, 2);
Sum2001000 = sum(spiketrain2001000, 2);

% calculate the means of spikes in different trails
Meanall(10) = mean(Sum101000);
Meanall(20) = mean(Sum201000);
Meanall(30) = mean(Sum301000);
Meanall(40) = mean(Sum401000);
Meanall(50) = mean(Sum501000);
Meanall(60) = mean(Sum601000);
Meanall(70) = mean(Sum701000);
Meanall(80) = mean(Sum801000);
Meanall(90) = mean(Sum901000);
Meanall(100) = mean(Sum1001000);
Meanall(110) = mean(Sum1101000);
Meanall(120) = mean(Sum1201000);
Meanall(130) = mean(Sum1301000);
Meanall(140) = mean(Sum1401000);
Meanall(150) = mean(Sum1501000);
Meanall(160) = mean(Sum1601000);
Meanall(170) = mean(Sum1701000);
Meanall(180) = mean(Sum1801000);
Meanall(190) = mean(Sum1901000);
Meanall(200) = mean(Sum2001000);

% calculate the standard deviation of spikes in different trails
Stdall(10) = std(Sum101000);
Stdall(20)= std(Sum201000);
Stdall(30) = std(Sum301000);
Stdall(40) = std(Sum401000);	
Stdall(50) = std(Sum501000);
Stdall(60) = std(Sum601000);
Stdall(70) = std(Sum701000);
Stdall(80) = std(Sum801000);
Stdall(90) = std(Sum901000);
Stdall(100) = std(Sum1001000);
Stdall(110) = std(Sum1101000);
Stdall(120) = std(Sum1201000);
Stdall(130) = std(Sum1301000);
Stdall(140) = std(Sum1401000);
Stdall(150) = std(Sum1501000);
Stdall(160) = std(Sum1601000);
Stdall(170) = std(Sum1701000);
Stdall(180) = std(Sum1801000);
Stdall(190) = std(Sum1901000);
Stdall(200) = std(Sum2001000);
 
% make graph
stmls = 10:10:200;
figure;
plot(stmls, Meanall(stmls))
title('Tuning Curve')
xlabel('Stimulus')
ylabel('Response')
errorbar(stmls,Meanall(stmls), Stdall(stmls))


