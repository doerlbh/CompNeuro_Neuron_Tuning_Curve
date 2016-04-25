
% here we take 1000 trials as an example.

%ResponseMeanandStd = zeros (2, 400);

% global stdall;

for k = 1:5:400
    [meanall(k),stdall(k)] = generateWeirdData2(k,1000);
end

stmls = 1:5:400; 

figure;
plot(stmls,meanall(stmls))
title('Tuning Curve')
xlabel('Stimulus')
ylabel('Response')
errorbar(stmls, meanall(stmls), stdall(stmls));

