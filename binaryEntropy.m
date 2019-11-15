function H = binaryEntropy(p)
%binaryEntropy This function computes the binaryEntropy for a given
%probability p (p has to be between 0 and 1)
if all(p>1 || p<0)
    error("p muss eine Wahrscheinlichkeit sein");
end
if p==1 || p==0
    H=0;
    return;
end

%compute binary entropy based on (2.3)
H = -p*log2(p)-(1-p)*log2(1-p);
end

