function len = avgCodeWordLength(wVec,pVec)
%avgCodeWordLength compute avg codeword length for the given length vector
%wVec and its corresponding probaility in pVec

%Todo no error handling

len = wVec * pVec';
end

