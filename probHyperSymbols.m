function returnVec = probHyperSymbols(p,B)
%probHyperSymbols this function computes the probability of hypersymbols
%based on probability vector pvec and B (Hypersymbol length)
if ~isscalar(B)
    error("B has to be scalar");
end
%check if given parameter pvec is 1-dimensional
if (~isscalar(p) || p<0 || p>1)
    error("p has to be scalar and in interval [0,1]");   
end

%wahrscheinlichkeiten ausrechnen
returnVec = [];
for i=0:B
    %repeats prob in dim(1,nchoosek(B,i))
	returnVec = [returnVec, repmat(p^i*(1-p)^(B-i), 1, nchoosek(B, i))];
end

end