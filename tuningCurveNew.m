
function f = tuningCurveNew( x )

%TuningCurve: firing rate as a function of input

f = 5./(1 + exp(-(4*x-50)/10));

end
