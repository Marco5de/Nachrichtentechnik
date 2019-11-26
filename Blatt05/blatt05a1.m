clc
clear

p = [0.3, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1];
length(p);

w = shanonCodeWordLength(p);

avgCodeWordLength(w,p);

entropy(p);


symbols = [1:7];
%dict enthählt code baum als cell array! {Code Symbol: Rep}
dict = huffmandict(symbols,p);

w_huff = [1,2,3,4,5,6,6];
huffman_len = avgCodeWordLength(w_huff,p);
