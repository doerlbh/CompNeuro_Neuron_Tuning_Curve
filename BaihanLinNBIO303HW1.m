%%
%**************************************************
% Question 1:

% make spiketrain workspace
generateNoisyData5090; % spiketrain5030 workspace: 50input, 90trials
generateNoisyData7090; % spiketrain7030 workspace: 70input, 90trials

% make rastor plot with two subplots.
figure;
subplot(2,1,1)
rastor5090 = imagesc(spiketrain5090);
xlabel('spikes')
ylabel('trails')
title('stimulus input = 50');
subplot(2,1,2)
rastor7090 = imagesc(spiketrain7090);
xlabel('spikes')
ylabel('trails');
title('stimulus input = 70');

%% Do the statistics
% make matrix to store the sum of spikes in each trail in a column
Sum5090 = sum(spiketrain5090, 2);
Sum7090 = sum(spiketrain7090, 2);

% calculate the means of spikes in different trails
Mean5090 = mean(Sum5090);
Mean7090 = mean(Sum7090);
disp(['Mean of input 50 and 70 are ', num2str(Mean5090), ' and ', num2str(Mean7090)]);

% calculate the standard deviation of spikes in different trails
Std5090 = std(Sum5090);
Std7090 = std(Sum7090);
disp(['Standard Deviation of input 50 and 70 are ', num2str(Std5090), ' and ', num2str(Std7090)]);
%%
% ***********************************************************
% Question 2:

% try to create line of best fit models: Gaussian distribution
x=0:50;
f5090 = 90*exp(-(x-Mean5090).^2/(2*Std5090.^2))/(Std5090*sqrt(2*pi)); 
f7090 = 90*exp(-(x-Mean7090).^2/(2*Std7090.^2))/(Std7090*sqrt(2*pi)); 

% make frequency distribution histogram
figure; 
scale = 0:50;
Distribution5090 = histc(Sum5090, scale);
bar(scale,Distribution5090)
xlabel('spikes')
ylabel('frequency')
hold on
Distribution7090 = histc(Sum7090, scale);
bar(scale, Distribution7090,'r')
xlabel('spikes')
ylabel('frequency')
xlim([0 50])
ylim([0 20])
title('Distribution Histogram of Spikes')

% for Gaussian distribution
hold on 
plot(x, f5090)
hold on 
plot(x, f7090, 'r') 

%%
% explor how discriminable

dprime = abs((Mean5090 - Mean7090)/sqrt((Std5090^2+Std7090^2)/2));
disp(['dprime is ', num2str(dprime)])

%%
% *******************************************************************
% Question 3
% Map out the tuning curve, with error bars

choice = input('So here we are at question 3, the fun part.\n To map out the tuning curve, I tried 3 methods.\n Which of my 3 methods do you like to use?\n  1: the dumb method, to explore the trend\n  2: the functional method, to generalize the model\n  3:the cool method, to try a new direction\nplease enter 1, 2, or 3. Thx!\n')

switch choice
    case 1
        disp('please wait for a little while...Thank you for the patience.')
        figureTuningCurveMethod1;
    case 2
        disp('This is fast. So you may only wait for a few seconds...Thank you for the patience.')
        figureTuningCurveMethod2;
    case 3
        disp('Every innovation comes at a price.\n Please wait for a little while...Thank you for the patience.')
        figureTuningCurveMethod3;
    otherwise
        disp('Please make the right choice, alright?')
end


%%
% *******************************************************************
% Question 4

% I think of 3 methods. 

% Method 1: Change tuningcurve function
% change tunningcurve function: f = 1./(1 + exp(-(x-50)/10)) 
% to 
% f = n*1./(1% + exp(-(m*x-50)/10)), where n and m both >1.
% so that the shape of the graph is thinner and taller, and more
% discriminable.

% Method 2: Change maxrate
% increase maxrate to increase rate and make bigger data (taller), thus more discriminable.

% Method 3: Change tau
% increase tau to increase ratecurve and make bigger data (taller), thus more discriminable.

selection = input('So here is question 4.How to make tuning curve more discriminable at 20?\n I got 3 methods to make tuning curve more discriminable. Which to try?\n  1: change tuningcurve function\n  2: change maxrate\n  3: change tau\nplease input 1, 2 or 3 and follow instruction.\n');
[x15, s15] = generateNoisyDataGeneral(15,1000);
[x25, s25] = generateNoisyDataGeneral(25,1000);
result = dprimef (x15, x25, s15, s25);

switch selection
    case 1
        disp('You made a great choice!\n Now first look at original graph and d-prime between stimulus 15 and 25.\n')
        figureTuningCurveMethod2;
        disp(['dprime is ', num2str(result)]);
        selection1 = input('Then, we will now change turningcurve function from f = 1./(1 + exp(-(x-50)/10))\n to f = n./(1% + exp(-(m*x-50)/10)), where n>1, m>1\n Here as an example we set n=5, m=4.\n Are you ready to see the graph and dprime now? Press 4 to see.\n');
        switch selection1
            case 4
                AfterTCchange;
                [x115, s115] = generateWeirdData1(15,1000);
                [x125, s125] = generateWeirdData1(25,1000);
                result1 = dprimef (x115, x125, s115, s125);
                disp(['dprime is ', num2str(result1), '--> Much bigger, right? --> More discriminable.']);
            otherwise
                disp('You coward, you should have pressed 4!');
        end
    case 2
        disp('You made a great choice!\n Now first look at original graph and d-prime between stimulus 15 and 25.\n')
        figureTuningCurveMethod2;
        disp(['dprime is ', num2str(result)]);
        selection2 = input('Then, we will now increase maxrate from 300 to n\n Here as an example we set n=600.\n Are you ready to see the graph and dprime now? Press 5 to see.\n');
        switch selection2
            case 5
                AfterMRchange;
                [x215, s215] = generateWeirdData2(15,1000);
                [x225, s225] = generateWeirdData2(25,1000);
                result2 = dprimef (x215, x225, s215, s225);
                disp(['dprime is ', num2str(result2), '--> Much bigger, right? --> More discriminable.']);
            otherwise
                disp('You coward, you should have pressed 5!');
        end
    case 3
        disp('You made a great choice!\n Now first look at original graph and d-prime between stimulus 15 and 25.\n')
        figureTuningCurveMethod2;
        disp(['dprime is ', num2str(result)]);
        selection3 = input('Then, we will now increase tau from 100 to n.\n Here as an example we set n=300\n Are you ready to see the graph and dprime now? Press 6 to see.\n');
        switch selection3
            case 6
                AfterTauchange;
                [x315, s315] = generateWeirdData3(15,1000);
                [x325, s325] = generateWeirdData3(25,1000);
                result3 = dprimef (x315, x325, s315, s325);
                disp(['dprime is ', num2str(result3), '--> Much bigger, right? --> More discriminable.']);
            otherwise
                disp('You coward, you should have pressed 6!');
        end
    otherwise
        disp('Please make the right choice, alright?')
end



