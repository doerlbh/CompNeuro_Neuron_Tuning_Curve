% This is the scripts inside the dumb method 1.

x1 = 90; % stimulus input

ntrials = 1000; % trails

maxrate = 300; % 30 Hz max firing rate

rate = maxrate*tuningCurve(x1);         
tau = 100;      % adaptation time constant in msec
nmsec = 300;    % number of milliseconds to record for
times= 1:nmsec; % time units

spiketrain901000 = zeros(ntrials,nmsec);      % set up output data

ratecurve = rate*exp(-times/tau)*.001;  % adapting rate function 

for j = 1:ntrials;
    
    for i = 1:nmsec;
   
        if(rand(1)<ratecurve(i)),  
            spiketrain901000(j,i) = 1;
        end;
    
    end;

end;

    