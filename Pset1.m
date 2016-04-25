%% Problem Set 1 : Sample Answers

% This m-file looks a bit long, but notice that a good chunk of it is 
% either plotting commands (like adding axis labels) or code that I just 
% copy and pasted from a previous section to reuse in another. Most of this
% problem set could be done in about 20-30 unique lines of code!


%% Question 1
% I modified the script generateNoisyData so that I can specify the
% stimulus and number of trials before running it.  (This way I won't have
% to manually enter every stimulus I want to try.)  The new m-file is
% called generateNoisyDataMod.  This was not necessary to complete the
% problem set, but made some parts much easier.

clear all

x1 = 50;  % stimulus
ntrials = 5000;

generateNoisyDataMod

% raster plot
figure;
imagesc(spiketrain)
colormap('gray')
xlabel('time')
ylabel('trial')
title(['raster plot: stimulus = ' num2str(x1)])

% spike counts, mean, standard deviation
counts = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount = mean(counts);  % mean spike count on a trial
stdCount = std(counts);  % std of spike counts across trials

% peri-stimulus time histogram (PSTH)
psth = mean(spiketrain);  % take mean across rows to get average firing rate in each time bin
figure;
plot(times,psth);
xlabel('time (ms)')
ylabel('average firing rate')
title(['PSTH: stimulus = ' num2str(x1)])

% alternate PSTH
% Many people's first inclination when making the PSTH was to use the
% 'hist' command.  A PSTH is a histogram of spike times, so if you wanted
% to use this approach, you'd first have to convert your matrix of zeros
% and ones to a vector of all the spike times, then make a histogram of
% that.  With our data, it is easier to use the previous method, but if you
% wanted to use 'hist', here's an example of how you might do that.
spiketimes = repmat(times,ntrials,1).*spiketrain; % convert matrix of zeros and ones to matrix with spike times
spiketimes = spiketimes(spiketimes~=0); % get rid of zeros ('~=' means 'does not equal')
x = hist(spiketimes,300); % histogram of spike times with 300 bins
figure; 
plot(times,x/ntrials);  % plot spike counts normalized by number of trials to get rate vs. time
xlabel('time (ms)')
ylabel('average firing rate')
title(['PSTH Method 2: stimulus = ' num2str(x1)])

%% Question 2
% We already have responses to a stimulus of 50, so let's now do 55.
x1 = 55;
ntrials = 5000;

generateNoisyDataMod

counts55 = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount55 = mean(counts55);  % mean spike count on a trial
stdCount55 = std(counts55);  % std of spike counts across trials

% make histogram
[h50 binCenters50] = hist(counts,50);
[h55 binCenters55] = hist(counts55,50);
h50 = h50/sum(h50);  % normalize to get area of 1
h55 = h55/sum(h55);  % normalize to get area of 1

% calculate some measure of discriminability
% d' is the easiest in this case, since we already have the mean and std
% for each stimulus
dprime = abs(meanCount-meanCount55)/sqrt((stdCount^2+stdCount55^2)/2);

% plot
figure; hold on;
bar(binCenters50,h50,'r');
bar(binCenters55,h55);
xlabel('spike count on single trial')
ylabel('frequency')
legend('50','55')
title(['d'' = ' num2str(dprime)])


%%% now do the same set of things for 20 and 25
x1 = 20;
ntrials = 5000;

generateNoisyDataMod

counts20 = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount20 = mean(counts20);  % mean spike count on a trial
stdCount20 = std(counts20);  % std of spike counts across trials


x1 = 25;
ntrials = 5000;

generateNoisyDataMod

counts25 = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount25 = mean(counts25);  % mean spike count on a trial
stdCount25 = std(counts25);  % std of spike counts across trials

% make histogram
[h20 binCenters20] = hist(counts20,10);
[h25 binCenters25] = hist(counts25,10);
h20 = h20/sum(h20);  % normalize to get area of 1
h25 = h25/sum(h25);  % normalize to get area of 1

% calculate some measure of discriminability
% d' is the easiest in this case, since we already have the mean and std
% for each stimulus
dprime = abs(meanCount20-meanCount25)/sqrt((stdCount20^2+stdCount25^2)/2);

% plot
figure; hold on;
bar(binCenters20,h20,'r');
bar(binCenters25,h25);
xlabel('spike count on single trial')
ylabel('frequency')
legend('20','25')
title(['d'' = ' num2str(dprime)])

% We can see simply by visual inspection that the two distributions for 20
% and 25 overlap more than those at 50 and 55, so these distributions are
% less discriminable.  The d' values quantitatively back this up.


%% Question 3
% The goal for this part was not to use the tuning curve function directly, 
% but to use the data to 'uncover' it.  In Part 1, we found the average
% number of spikes in response to a stimulus of 50, as well as the standard
% deviation across multiple trials.  Now if we do that for several
% different stimulus values, we can generate a plot of mean spike count vs.
% stimulus with error bars.

clear all
stims = 5:5:100;  % stimuli i want to test
ntrials = 500;

rates = zeros(length(stims),1); % initialize variable for rates
stds = zeros(length(stims),1); % initialize variable for std

for k = 1:length(stims)  % for each stimulus i want to test
    x1 = stims(k);  % set x1 equal to that stimulus
    generateNoisyDataMod 
    counts(:,k) = sum(spiketrain,2);  % calculate spike counts, as in part 1
    rates(k) = mean(counts(:,k));  % calculate mean spike count, as in part 1
    stds(k) = std(counts(:,k)); % calculate std spike count, as in part 1
    
end

figure; errorbar(stims,rates,stds)
title('tuning curve')
xlabel('stimulus')
ylabel('average spike count')

% The error bars grow along with the mean response.

%% Question 4
% There are several ways you could go about this, but the most common way
% that people did this was to shift the tuning curve.  Currently, the
% tuning curve function has the number 50 in it.  This number adjusts the
% offset along the x-axis.  (Remember back to your algebra classes and
% think about how you manipulate equations to shift them and stretch them
% in various directions).  The original tuning curve is shifted so that the
% point of highest slope falls at 50.  If we shift the tuning curve to the
% left by 30 (by changing the 50 to 20), the point with highest slope now
% falls at 20.  This means that for the same change in stimulus (e.g. we
% did 5 above), we will now get a larger change in output.  This should
% push our histograms further apart and make our responses more
% discriminable.  Let's checkt this.

% I modified the tuningcurve function as described above before running
% this.  The code below is simply copy-pasted from above.


x1 = 20;
ntrials = 5000;

generateNoisyDataMod

counts20 = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount20 = mean(counts20);  % mean spike count on a trial
stdCount20 = std(counts20);  % std of spike counts across trials


x1 = 25;
ntrials = 5000;

generateNoisyDataMod

counts25 = sum(spiketrain,2);  % sum across columns to get spike count for each trial
meanCount25 = mean(counts25);  % mean spike count on a trial
stdCount25 = std(counts25);  % std of spike counts across trials

% make histogram
[h20 binCenters20] = hist(counts20,10);
[h25 binCenters25] = hist(counts25,10);
h20 = h20/sum(h20);  % normalize to get area of 1
h25 = h25/sum(h25);  % normalize to get area of 1

% calculate some measure of discriminability
% d' is the easiest in this case, since we already have the mean and std
% for each stimulus
dprime = abs(meanCount20-meanCount25)/sqrt((stdCount20^2+stdCount25^2)/2);

% plot
figure; hold on;
bar(binCenters20,h20,'r');
bar(binCenters25,h25);
xlabel('spike count on single trial')
ylabel('frequency')
legend('20','25')
title(['d'' = ' num2str(dprime)])

% If we compare this to our previous histogram for 20 and 25, we can see
% that in general the firing rates are higher, but more importantly there
% is less overlap between the two distributions.  This may not be totally
% obvious from just looking at the histograms, but by looking at our new d'
% value, we can confirm that we have, in fact, improved discriminability.