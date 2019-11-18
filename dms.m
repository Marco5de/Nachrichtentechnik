function info_sequence = dms(pvec,q)
%dms implementing a discrete memoryless source, which returns a random
%sequence of length q using symbols of a Alphabet (A,B,...) based on the
%probabilites in pvec

if abs(sum(pvec)-1) > 0.001
    error("Summe über den Wahrscheinlichkeitsvektor muss 1 sein");
end

len = length(pvec);
x = [];
seq = ceil(pvec * q);

for i=1:length(seq)
    x = [x, repmat((i-1+'A'), 1, seq(i))];
end
%anpassen auf die gewünschte Länge, da zuvor Ceiling verwendet wurde
if length(x) > q
    while length(x) > q
        length(x)
        x(end) = [];
    end
end
%shuffle indices inside vector
x = x(randperm(length(x)));
info_sequence = char(x);
end

