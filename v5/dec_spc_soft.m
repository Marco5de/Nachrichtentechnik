function ct = dec_spc_soft(y)
    sign = prod(y);
    if sign > 0
        ct = y<0;
        ct = ct(1 :(length(ct)-1));
       return  
    end
    [~,index] = min(abs(y));
    y(index) = y(index) * (-1);
    ct = y < 0;
    ct = ct(1 : (length(ct)-1));
end

