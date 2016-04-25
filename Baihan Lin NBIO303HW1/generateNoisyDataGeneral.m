% This code will generate a spiking response to an input based on a tuning
% curve and assuming Poisson firing. The response adapts with a fixed
% timecourse.
%
% The interesting part of this function is that it is based on the x, which
% is stimulus input, and y, which is trails, that you input in the (). So
% it is a general form of functions like generateNoisyData5090 and
% generateNoisyData7090.
%

%function [Meantemp] = generateNoisyDataGeneral(x, y)
function [Meantemp, Stdtemp] = generateNoisyDataGeneral(x, y)
%function [Meantemp] = generateNoisyDataGeneral(x)

sinput = x; % stimulus input
ntrials = y; % number of trails
% ntrials = 1000; % for debugging

% sinput = 10 % for debugging
% ntrils = 20 % for debugging

maxrate = 300; % 30 Hz max firing rate

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
   %stdall(x) = std(Sumtemp)
end
    