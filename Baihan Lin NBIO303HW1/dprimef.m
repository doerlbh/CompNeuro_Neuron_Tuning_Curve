function [ans] = dprimef (x1, x2, s1, s2)

ans = abs((x1 - x2)/sqrt((s1^2+s2^2)/2));

end