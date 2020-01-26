function c_est = dec_wdh_hard(r)
%DEC_WDH_HARD implementiert eine hard decision fuer einen wiederholungscode
c_est = sum(r) > length(r)/2; 
end

