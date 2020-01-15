function c_est = dec_wdh_soft(y)
%dec_wdh_soft implementiert eine soft decision, basierend auf den analogen
%eingabewerten y
c_est = sum(y) < 0;

end

