% This code will generate a spiking response to an input (which is 50 here) based on a tuning
% curve and assuming Poisson firing. The response adapts with a fixed
% timecourse. It runs 90 trials.
%

x1 = 50; % stimulus input

ntrials = 90; % trails

maxrate = 300; % 30 Hz max firing rate

rate = maxrate*tuningCurve(x1);         
tau = 100;      % adaptation time constant in msec
nmsec = 300;    % number of milliseconds to record for
times= 1:nmsec; % time units

spiketrain5090 = zeros(ntrials,nmsec);      % set up output data

ratecurve = rate*exp(-times/tau)*.001;  % adapting rate function 

for j = 1:ntrials;
    
    for i = 1:nmsec;
   
        if(rand(1)<ratecurve(i)),  
            spiketrain5090(j,i) = 1;
        end;
    
    end;

end;

    