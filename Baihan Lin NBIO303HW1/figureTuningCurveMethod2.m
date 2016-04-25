
% So we use a function that calculate the mean and standard deviation based on the given stimulus input

for k = 1:5:400
    [meanall(k),stdall(k)] = generateNoisyDataGeneral(k,1000);
end

stmls = 1:5:400; 

figure;
plot(stmls,meanall(stmls))
title('Tuning Curve')
xlabel('Stimulus')
ylabel('Response')
errorbar(stmls, meanall(stmls), stdall(stmls));

