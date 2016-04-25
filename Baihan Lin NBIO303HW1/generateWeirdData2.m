
function [Meantemp, Stdtemp] = generateWeirdData2(x, y)

sinput = x; % stimulus input
ntrials = y; % number of trails

maxrate = 600; % 30 Hz max firing rate

rate = maxrate*tuningCurve(sinput);         
tau = 100;      % adaptation time constant in msec
nmsec = 300;    % number of milliseconds to record for
times= 1:nmsec; % time units

spiketraintemp = zeros(ntrials,nmsec);      % set up output data

ratecurve = .001*rate*exp(-times/tau);  % adapting rate function 

for j = 1:ntrials;
    
    for i = 1:nmsec;
   
        if(rand(1)<ratecurve(i)),  
            spiketraintemp(j,i) = 1;
        end;
    
    end;

end;

 Sumtemp = sum(spiketraintemp, 2);
    Meantemp = mean(Sumtemp);
   Stdtemp = std(Sumtemp);

end
    