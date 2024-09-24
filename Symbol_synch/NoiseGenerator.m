function NoisedSignal = NoiseGenerator(signal, SNR)
    % Мощность сигнала
    P_sig = PowerSignal(signal);
    % Определим амплитуду шума 
    A_noise = sqrt(P_sig / 10 ^(SNR / 10));
    NoiseRe = A_noise * normrnd(0, 1, [1, length(signal)]);
    NoiseIm = A_noise * normrnd(0, 1, [1, length(signal)]);
    Noise = complex(NoiseRe, NoiseIm);
    NoisedSignal = signal + Noise;
end
