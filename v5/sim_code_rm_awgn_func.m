function [BER,R,G] = sim_code_rm_awgn_func(M,rho)
    N = 2^M;
    index = 0:rho;
    K=sum(nchoosek(M,index)); dmin=2^(M-rho); R = K / N;
    G = 10*log10(R*dmin);

    EbN0_dB = 0:1:10;
    loop = 20000;
    BER = zeros(1,length(EbN0_dB));

    for l = 1:loop
       %i ist {0,1}
       i = (rand(1,1)>0.5);
       c = enc_rm(i,rho,M)
       % x ist {-1,1}
       x = (-1).^c;

       %noise
       n = randn(1,N);

       for s=1:length(EbN0_dB)
           %AWGN channel
           sigma_n = sqrt(10^(-EbN0_dB(s)/10)/R/2);
           y = x + sigma_n * n;

           %decision
           r = (y < 0);
           %decodieren von wiederholungscodes
           c_est = dec_rm_soft(y,rho,M);
           i_est = invenc_rm(c_est,rho,M);

           %count errrors
           BER(1,s) = BER(1,s) + sum(abs(i_est - i));
       end

    end

    BER = BER/ (K*loop);
end

