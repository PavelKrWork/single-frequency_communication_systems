function predict_time =  Oerder_Meyr_TED(RX_IQ, L)
    sum_ = 0;
    for k = 1 : L
        sum_ = sum_ + abs(RX_IQ(k))^2 * exp(-1i*2*pi*k / L);
    end
    predict_time = angle(sum_) / (2 * pi);
end