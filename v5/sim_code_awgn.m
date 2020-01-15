clc
clear

K=1; N=3; dmin=N; R = K / N;

EbN0_dB = 0:1:10;
loop = 20000;
BER = zeros(2,length(EbN0_dB));

for l = 1:loop
   %i ist {0,1}
   i = (rand(1,1)>0.5);
   c = i * ones(1,N); %es handelt es sich hier um einen wiederholugscode!
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
       c_est_hard = dec_wdh_hard(r); 
       c_est_soft = dec_wdh_soft(y);
       i_est_hard = c_est_hard;
       i_est_soft = c_est_soft;
      
       
       %count errrors
       BER(1,s) = BER(1,s) + sum(abs(i_est_hard - i));
       BER(2,s) = BER(2,s) + sum(abs(i_est_soft - i));
   end
    
end

BER = BER/ (K*loop);
display("Done");

plot(EbN0_dB,log(BER(1,:)));
hold on;
plot(EbN0_dB,log(BER(2,:)));
hold off;
title("Simulation der Bitfehlerrate eines Wiederholungscodes");
xlabel("E_b/N0 [dB]"); ylabel("BER ");
legend("hard decision","soft decision");

