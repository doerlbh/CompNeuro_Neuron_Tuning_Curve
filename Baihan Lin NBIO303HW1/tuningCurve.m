
function f = tuningCurve( x )

%TuningCurve: firing rate as a function of input

f = 1./(1 + exp(-(x-50)/10));

end
