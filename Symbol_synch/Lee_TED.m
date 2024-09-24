function predict_time = Lee_TED(RX_IQ, T, L)
    sum_ = 0;
    for k = 2 : 2 * L
        sum_ = sum_ + abs(RX_IQ(k))^2 * exp(-1i * k * pi) + real(RX_IQ(k) * conj(RX_IQ(k - 1))) * exp(-1i*(k - 0.5)*pi);
    end

    predict_time = angle(sum_) * T / (2 * pi);
end