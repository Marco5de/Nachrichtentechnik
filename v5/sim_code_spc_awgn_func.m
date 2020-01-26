function BER = sim_code_spc_awgn_func(N)

K=N-1;dmin=2; R = K / N;

EbN0_dB = 0:1:10;
loop = 20000;
BER = zeros(1,length(EbN0_dB));

for l = 1:loop
   %i ist {0,1}
   i = (rand(1,K)>0.5);
   c = [i,mod(sum(i),2)];
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
       c_est_soft = dec_spc_soft(y);
       i_est_soft = c_est_soft;

       %count errrors
       BER(1,s) = BER(1,s) + sum(abs(i_est_soft - i));
   end
    
end

BER = BER/ (K*loop);
end

