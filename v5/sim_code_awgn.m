clc
clear


EbN0_dB = 0:1:10;
N_opt = [1,3,5,11,31];

BER_th = 0.5 * (1 - erf(sqrt(10.^(EbN0_dB/10))));

K=1;

for n = N_opt
    dmin=n; R = K / n;
    
    g_asym = 10*log10(R*dmin)

    BER = sim_code_awgn_func(n);
    
    figure(n)
    plot(EbN0_dB,log10(BER(1,:)));
    hold on;
    plot(EbN0_dB,log10(BER(2,:)));
    hold on;
    plot(EbN0_dB,log10(BER_th));
    hold on;
    plot(g_asym);
    hold off;
    title("Simulation der Bitfehlerrate eines Wiederholungscodes");
    xlabel("E_b/N0 [dB]"); ylabel("BER ");
    legend("hard decision","soft decision","Theoretical BER","Code Gain");
end



display("Done");


