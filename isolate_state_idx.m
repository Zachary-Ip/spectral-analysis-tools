function [idx] = isolate_state_idx(starts, ends, Fs)
%{
Generate an array of indices for data points according to an array of start
and end times, recording frequency

Args:
    starts (1xn array): List of start times in seconds
    ends (1xn array): List of end times in seconds
    Fs (int): Recording frequency

Returns:
    idx (1xn boolean): mask of when state is active during recording
%}

 idx  = [];
for iRem = 1:length(starts)
    idx = [idx (round(starts(iRem)*Fs)):(round(ends(iRem)*Fs))];
end
end