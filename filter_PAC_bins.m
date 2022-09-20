function [FreqTransform] = filter_PAC_bins(signal, FreqVector, bandwidth, Fs)
%{
Generate matrix of eeg filtered signals.

Args:
    

%}


FreqTransform = zeros(length(FreqVector), length(signal));
for i = 1:length(FreqVector)
    Af1 = FreqTransform(i); % Amplitude frequency start
    Af2 = Af1 + bandwidth; % amplitude frequency end
    Freq = eegfilt(signal', Fs, Af1, Af2); % just filtering
    FreqTransform(i, :) = abs(hilbert(Freq)); % getting the amplitude envelope
end
end