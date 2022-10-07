function [events] = detect_events(signal, factor)
%{
Detect events that pass the threshold defined by factor number of standard
devations. 

Args:
    signal (1xn array): signal to analyze
    factor (int): number of std above mean to detect events

Returns:
    events (nx9 matrix):
    1: start index
    2: end index
    3: peak_value
    4: peak index
    5: total area
    6: mid area
    7: total energy
    8: mid energy
    9: max threshold
%}
baseline = mean(signal);
thresh = baseline + std(signal)*factor;
events = extractevents(signal',thresh, baseline, 0, 0.015,0)';
end