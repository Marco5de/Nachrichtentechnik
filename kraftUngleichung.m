function bool = kraftUngleichung(wVec)
%kraftUngleichung this function checks if the Kraft-inequation is
%fullfilled, based on the given length Vector wVec

if sum(2.^(-wVec)) <= 1
    bool = 1
else
    bool = 0
end

