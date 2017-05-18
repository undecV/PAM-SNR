% Probability of a symbol error for PAM

% Plot the SNR Vs Probability of a symbol error for M-ary PAM.
% Author: undecV
% May 2017.

clc; close all; clear;

bits = 1:8;	% Bits
M = 2.^bits; % M-Ary

SNR = -6:0.1:22; % SNR, dB scale.

figure;
subplot(1,1,1);

% Loop for each M.
for m = M
    % disp(m) % ¸ÐÇé¾€loop. m is each number in M.
    % SNR/bit, and change it to linear trans from dB scale to linear scale.
    % Bottom of the Textbook page P433.
    linSNR = exp(SNR*log(10)/10);
    % Probability of error, Textbook P433, Formula 8.5.8
    P_M = (2*(m-1)/m)*qfunc(sqrt((6*log2(m)*linSNR)/((m.^2)-1)));
    % Semilogy plots data with logarithmic scale for the y-axis. (doc)
    semilogy(SNR, P_M, ''); hold on; 
end

axis([-6, 22, 10^(-6), 10^(-1)]);
xlabel('SNR/bit (dB)')
ylabel('P_M, Probability of symbol error')
title('Probability of a symbol error for PAM')
grid on; grid minor;
legend('M = 2', 'M = 4', 'M = 8', 'M = 16' , ...
       'M = 32', 'M = 64', 'M = 128', 'M = 256')
