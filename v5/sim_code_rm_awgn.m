clc
clear

EbN0_dB = 0:1:10;
BER_th = 0.5 * (1 - erf(sqrt(10.^(EbN0_dB/10))));

inputVec = [[1,0],[3,1],[5,2],[3,0],[3,1],[3,2],[3,3]];
M = [1,3,5,3,3,3,3];
rho = [0,1,2,0,1,2,3];

index = 1;
for x = [M;rho]
    
    [BER,R,G] = sim_code_rm_awgn_func(x(1),x(2));
   
    figure(index)
    plot(EbN0_dB,log10(BER));
    hold on;
    plot(EbN0_dB,log10(BER_th));
    hold on;
    hold off;
    title("Simulation der Bitfehlerrate eines Wiederholungscodes");
    xlabel("E_b/N0 [dB]"); ylabel("BER ");
    legend("soft decision","Theoretical BER");
    
    sprintf('M= %f, rho= %f \nG= %f \n R= %f\n',M,rho,G,R)
    
    index = index +1;
end
