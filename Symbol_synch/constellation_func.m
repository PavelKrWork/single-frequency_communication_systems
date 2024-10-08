function [Dictionary, Bit_depth_Dict] = constellation_func(Constellation)
    % Bit_depth_Dict - разрядность созвездия

    % Dictionary - словарь {"точка созвездия","I,Q"}

    switch Constellation
        case "BPSK"
            keys = ["0", "1"];
            values = [complex(-1, 0), complex(1, 0)];
            Bit_depth_Dict = 1;
        case "QPSK"
            keys = ["0  0", "0  1", "1  0", "1  1"];
            values = [complex(-1, -1), complex(-1, 1), complex(1, -1), complex(1, 1)];
            Bit_depth_Dict = 2;
        case "8PSK"
            keys = ["0  0  0", "0  0  1", "0  1  1", "0  1  0", "1  1  0", "1  1  1", "1  0  1", "1  0  0"];
            values = [complex(-sqrt(2)/2, -sqrt(2)/2), complex(-1, 0), complex(-sqrt(2)/2, sqrt(2)/2), complex(0, 1), complex(sqrt(2)/2, sqrt(2)/2), complex(1, 0), complex(sqrt(2)/2, -sqrt(2)/2), complex(0, -1)];
            Bit_depth_Dict = 3;
        case "16-QAM"
            keys = ["0  0  0  0", "0  0  0  1", "0  0  1  0", "0  0  1  1", "0  1  0  0", "0  1  0  1", "0  1  1  0", "0  1  1  1", "1  0  0  0", "1  0  0  1", "1  0  1  0", "1  0  1  1", "1  1  0  0", "1  1  0  1", "1  1  1  0", "1  1  1  1"];
            values = [complex(-3, 3), complex(-3, 1), complex(-3, -3), complex(-3, -1), complex(-1, 3), complex(-1, 1), complex(-1, -3), complex(-1, -1), complex(3, 3), complex(3, 1), complex(3, -3), complex(3, -1), complex(1, 3), complex(1, 1), complex(1, -3), complex(1, -1)];
            Bit_depth_Dict = 4;
    end
    
    norm = Norm(values);
    values = values./norm;
    Dictionary = dictionary(keys, values);
end

