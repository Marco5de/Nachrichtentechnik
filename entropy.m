function H = entropy(pvec)
%This function computes the entropy of the given probability vector
[m,L] = size(pvec);
epsilon = 0.001;
%check if given parameter pvec is 1-dimensional
if m~=1
    error("Wahrscheinlichkeits Matrizen werden nicht unterstützt!");   
end
if ~isempty(pvec(pvec>1))
   error("Wahrscheinlichkeitswert kann nicht größer als 1 sein"); 
end
if abs(sum(pvec)-1) > epsilon
    display(sum(pvec))
    error("Summe der Wahrscheinlichkeiten muss 1 ergeben");
end

nonZeroPvec = pvec(pvec~=0);

H = -(nonZeroPvec * log2(nonZeroPvec)');
end

