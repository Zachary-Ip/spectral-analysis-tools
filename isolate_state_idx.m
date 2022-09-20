function [idx] = isolate_state_idx(starts, ends, Fs)
%{
Generate an array of indices for data points according to an array of start
and end times, recording frequency

Args:
    starts (array): List of start times in seconds
    ends (array): List of end times in seconds
    Fs (int): Recording frequency
%}

 idx  = [];
for iRem = 1:length(starts)
    idx = [idx (round(starts(iRem)*Fs)):(round(ends(iRem)*Fs))];
end
end