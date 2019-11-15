clc
clear

pts = 0:0.001:1;
%apply function to each element of the array pts
H = arrayfun(@binaryEntropy,pts);


subplot 221; plot(pts,H);
title("Binäre Entropie einer gedächtnislosen Quelle");
xlabel("Wahrscheinlichkeit p"); ylabel("Entropie H(p)");