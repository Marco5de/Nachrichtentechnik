clc
clear

p = [0.25, 0.125, 0.125, 1/6, 1/6, 1/18, 1/18, 1/18];

%beachte ternärer Code!
w = [2,3,3,2,2,3,3,3]
avgLen = avgCodeWordLength(w,p);

entropy = entropy(p);