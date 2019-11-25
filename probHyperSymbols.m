function returnVec = probHyperSymbols(p,B)
%probHyperSymbols this function computes the probability of hypersymbols
%based on probability vector pvec and B (Hypersymbol length)
if ~isscalar(B)
    error("B has to be scalar");
end
%check if given parameter pvec is 1-dimensional
if ~isscalar(p)
    error("p has to be scalar");   
end

%wahrscheinlichkeiten ausrechnen
returnVec = [];
for i=0:B
	returnVec = [returnVec, repmat(p^i*(1-p)^(B-i), 1, nchoosek(B, i))];
end

end