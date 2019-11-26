function avgLen = avgHuffmanLength(code,pVec)
%avgHuffmannLength computing the average Length of a Huffmann encoded
%source given by pVec

%todo error handling
avgLen = 0;
for i=1:length(code)
    avgLen = avgLen + length(code{i,2}) * pVec(i);
end

