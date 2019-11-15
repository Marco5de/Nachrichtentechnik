function returnVec = probHyperSymbols(pvec,B)
%probHyperSymbols this function computes the probability of hypersymbols
%based on probability vector pvec and B (Hypersymbol length)
if size(B)~=[1,1]
    error("B has to be scalar");
end
[m,L] = size(pvec);
%check if given parameter pvec is 1-dimensional
if m~=1
    error("Wahrscheinlichkeits Matrizen werden nicht unterstützt!");   
end

%Todo wahrscheinlichkeiten ausrechnen und wie müssen diese angeordnet
%werden?


end

