function RX_IQ_interpol = interpol(RX_IQ, time_shift, inter_type)
    mu = time_shift;
    RX_IQ_interpol = zeros(1, length(RX_IQ));
    if (inter_type == "linear_interpol")
        RX_IQ_interpol(1) = RX_IQ(1);
        
        for i = 1:(length(RX_IQ) - 1)
            RX_IQ_interpol(i+1) = mu * RX_IQ(i+1) + (1 - mu) * RX_IQ(i);
        end

    elseif (inter_type == "quadro_interpol")
        alpha = 0.43;
        h4 = alpha*mu^2 - alpha*mu;
        h3 = - alpha*mu^2 + (1 + alpha)*mu;
        h2 = - alpha*mu^2 - (1 - alpha)*mu + 1;
        h1 = alpha*mu^2 - alpha*mu;
        
        RX_IQ_interpol(1) = RX_IQ(1);
        RX_IQ_interpol(2) = RX_IQ(2);
        
        for i = 1:(length(RX_IQ) - 3)
            RX_IQ_interpol(i+2) = h1*RX_IQ(i) + h2*RX_IQ(i+1) + h3*RX_IQ(i+2) + h4*RX_IQ(i+3);
        end
    end
end