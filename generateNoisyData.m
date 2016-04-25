% 
% This code will generate a spiking response to an input based on a tuning
% curve and assuming Poisson firing. The response adapts with a fixed
% timecourse.
%

x1 = input('Input your test stimulus ')

ntrials = input('How many repeated trials would you like to perform? ');

maxrate = 300; % 30 Hz max firing rate

rate = maxrate*tuningCurve(x1);         
tau = 100;      % adaptation time constant in msec
nmsec = 300;    % number of milliseconds to record for
times= 1:nmsec; % time units

spiketrain = zeros(ntrials,nmsec);      % set up output data

ratecurve = rate*exp(-times/tau)*.001;  % adapting rate function 

for j = 1:ntrials;
    
    for i = 1:nmsec;
   
        if(rand(1)<ratecurve(i)),  
            spiketrain(j,i) = 1;
        end;
    
    end;

end;

    