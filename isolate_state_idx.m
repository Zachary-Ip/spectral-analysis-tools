function [idx] = isolate_state_idx(starts, ends, Fs, method)
%{
Generate an array of indices for data points according to an array of start
and end times, recording frequency

Args:
    starts (1xn array): List of start times in seconds
    ends (1xn array): List of end times in seconds
    Fs (int): Recording frequency
    method (str): string determining whether to return high or low indices

Returns:
    idx (1xn boolean): mask of when state is active during recording
%}

idx  = [];
if strcmp('high',method) == 1
    for iRem = 1:length(starts)
        idx = [idx (round(starts(iRem)*Fs):round(ends(iRem)*Fs))];
    end
elseif strcmp('low',method) == 1
    try
        low_starts = ends(1:end-1);
        low_ends = starts(2:end);
        
        for iRem = 1:length(low_starts)
            idx = [idx (round(low_starts(iRem)*Fs)):(round(low_ends(iRem)*Fs))];
        end
    catch
        error('No low states detected, likely only one high state present')
    end
else
    error('please enter "high" or "low" for the method argument(4)')
end