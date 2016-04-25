
% The cool part is that I created a 3D matrix, so one dimension is the
% spikes, one is trails, one is stimulus. The I reduce the dimension using
% methods like mean(), sum(), and std(), finally I sqeeze the matrix into
% two functions of mean and std which can be plotted.

alldata = zeros(ntrials, nmsec, 400);

ntrials = 1000;
nmsec = 300;   % number of milliseconds to record for
    times= 1:nmsec; % time units
    tau = 100;      % adaptation time constant in msec
%nbin = 400;

for k = 1:80 % Because I want to plot out all stimulus 1:5:400, thus third dimension is 80.
    x1 = 5*k;
    
    maxrate = 300; % 30 Hz max firing rate

    rate = maxrate*tuningCurve(x1);         
    ratecurve = rate*exp(-times/tau)*.001;  % adapting rate function 

    for j = 1:ntrials;
        for i = 1:nmsec;
           if(rand(1)<ratecurve(i)),  
              alldata(j,i,k) = 1;
           end   
        end
    end;
end

allmean = mean(squeeze(sum(alldata,2)),1);
allstd = std(squeeze(sum(alldata,2)),1);

stmls = 1:80;

figure;
plot(5*stmls,allmean(stmls))
title('Tuning Curve')
xlabel('Stimulus')
ylabel('Response')
errorbar(5*stmls, allmean(stmls), allstd(stmls))

