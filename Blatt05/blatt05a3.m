clc
clear

p = [0.7, 0.25, 0.05];
H = entropy(p);

%Huffmann codierung
w = [1,2,2];
avgLen = avgCodeWordLength(w,p);

%Vektoren
pvec = [0.49, 0.175, 0.035, 0.175, 0.0625, 0.0125, 0.035, 0.0125, 0.0025];
entropy(pvec)/2
wvec = [1,2,5,3,5,7,5,6,7];
avgLenVec = avgCodeWordLength(wvec,pvec)/2

