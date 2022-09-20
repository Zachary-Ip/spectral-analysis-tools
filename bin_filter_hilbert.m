function [FreqTransform] = bin_filter_hilbert(signal, FreqVector, bandwidth, Fs)
%{
Generate matrix of eeg filtered signals.

Args:
    signal (1xn array): signal to be filter
    FreqVector (1xn array): Array specifying how many and which frequencies 
    to filter
    bandwidth (int): how wide of a signal window to filter
    Fs (int): sampling frequency

Returns:
    FreqTransform (m x n matrix): where m is where m is number of frequencies, and n is signal
    length, and each row is a filtered version of the eeg. 
%}


FreqTransform = zeros(length(FreqVector), length(signal));
for i = 1:length(FreqVector)
    Af1 = FreqVector(i); % Amplitude frequency start
    Af2 = Af1 + bandwidth; % amplitude frequency end
    Freq = eegfilt(signal', Fs, Af1, Af2); % just filtering
    FreqTransform(i, :) = hilbert(Freq); % getting the amplitude envelope
end
end