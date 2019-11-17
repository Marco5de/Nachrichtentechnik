function D23 = d23(pvec, q)
    h = hist( dms_rand(pvec, q) - 'A', 0:length(pvec)-1 ) / q
    hShould = pvec
    H = entropy(h)
    HShould = entropy(pvec)
end
