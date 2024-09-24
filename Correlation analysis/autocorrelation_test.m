clear all; clc; 
close all;
%% Generate new M-sequence
newseq = new_m_sequence([1 1 1], 7);
newseq = (newseq - 0.5) * 2;
%% Autocorrelation_test1
header = [0 1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 0 1 0 0 1 0 1 1 0 0 1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 0 1 0 0 1 0 1 1 0 0 1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 0 1 0 0 1 0 1 1 0 0 1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 0 1 0 0 1 0 1 1 0 0 1 1];
new_header = newseq;
news = header;
for i = 1 : 7
    new_header(i) = dot(newseq, circshift(newseq, i));
    news(i) = dot(header, circshift(header, i));
    % plot(new_header);
end
plot(new_header);

% plot(news);
%% Autocorrelation_test2
plot(xcorr(header));


