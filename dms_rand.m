function info_sequence = dms_rand(pvec,q)
%dms implementing a discrete memoryless source, which returns a random
%sequence of length q using symbols of a Alphabet (A,B,...) based on the
%probabilites in pvec

if abs(sum(pvec)-1) > 0.001
    error("Summe über den Wahrscheinlichkeitsvektor muss 1 sein");
end

lenPvec = length(pvec);
x = [];
sep = [];
sumpvec = 0;

for i=1:lenPvec
    sumpvec = sumpvec + pvec(i);
    sep = [sep, sumpvec];
end

for i=1:q
    r = rand();
    for j=1:length(sep)
        if r < sep(j)
            x = [x, (j-1+'A')];
            break
        end
    end
end

info_sequence = char(x);

end
