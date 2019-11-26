function [avgLen,avgLenPerSymbol] = huffmanProperties(p,Blocklen)
%huffmannPropteries gets all the relevant huffmannProperties for a
%givenBlocklen and scalar p

%Todo kann auch noch für weitere gesucht eigenschaften erweitert werden
B = Blocklen;
pBlock = probHyperSymbols(p,B);
symbols = [1:2^B];
code = huffmandict(symbols,pBlock);

avgLen = avgHuffmanLength(code,pBlock);
avgLenPerSymbol = avgLen / B;

end

