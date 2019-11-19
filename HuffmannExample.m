% Huffmann enocoder
clc
clear

symbols = [65:68];
p = [0.5,0.25,0.125,0.125];
%dict enthählt code baum als cell array! {Code Symbol: Rep}
dict = huffmandict(symbols,p);

sig = dms_rand(p,100);
%encoded symbols
comp = huffmanenco(sig,dict);
%decode data and check equality
dsig = huffmandeco(comp,dict);
if isequal(sig,dsig)
   display("Data is equal")
else
    display("Data not equal")
end