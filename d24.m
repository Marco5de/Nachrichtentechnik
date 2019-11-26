clc
clear

%erstelle sequenz der quelle
p = [0.2, 0.8];
B = 2;
info_seq = dms_rand(p,100);
%zusammen zu Hypersymbolen, pBLock vector der neuen Wahrscheinlichkeiten
pBlock = probHyperSymbols(p(1),B);

%konstruktion von Huffmann hiervon
symbols = [1:2^B];
dict = huffmandict(symbols,pBlock);
%mit dict/code kann der Baum visualisiert werden und die durchschnittliche
%länge ausgerechnet werden
avgLen = avgHuffmanLength(dict,pBlock);
avgLenPerSymbol = avgLen/B;

%stimmt mit dem oben überein
[avgLenFunc,perSymbolFunc] = huffmanProperties(0.2,2);
[avgLenFunc3,perSymbolFunc3] = huffmanProperties(0.2,3);


%Todo visualisieren
avgLenPerSymbolVec = zeros(1,10);
for b=1:10
    [x,relevant] = huffmanProperties(0.2,b);
    avgLenPerSymbolVec(b) = relevant;
end

%siehe hier immer noch größer als dieEntropie!
binEntropy = binaryEntropy(0.2);
plotEntropyVec = repelem(binEntropy,10);
%Warum ist das hier nicht monoton? 
bVals = 1:10;
subplot 211;
plot(bVals,avgLenPerSymbolVec);
hold on;
plot(bVals,plotEntropyVec);
hold off;
xlabel("Blocklaenge B");
ylabel("Bits/Symbol");
title("Variation der Blocklaenge im Vergleich mit der Entropie");
legend("B Variation","Entropie");


%Todo analog zu oben, nur dass jetzt p von 0 nach 1 variiert wird
%setzte hier B fest zu 3
%Todo replace some of this stuff with vector operations
pVals = 0:0.01:1;
avgLenP = zeros(1,(1/0.01)+1);
entropyVec = zeros(1,(1/0.01)+1);
for i = 1:100
   [x,relevant] = huffmanProperties(pVals(i),3);
   avgLenP(i) = relevant;
   entropyVec(i) = binaryEntropy(pVals(i));
end

subplot 212;
plot(pVals,avgLenP); %sollte passen, ist immernoch ähnlich zur binären entropie!
hold on;
plot(pVals,entropyVec);
hold off;
xlabel("Wahrscheinlichkeit p");
ylabel("Bits/Symbol");
title("Variation der Wahrscheinlichkeit im Vergleich mit der Entropie");
legend("p Variation","Entropie");



