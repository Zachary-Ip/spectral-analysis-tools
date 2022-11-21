function [clean] = clean_events(events, max_idx, before, after)
%{
Remove events outside the window of interest to preserve window integrity

Args:
    events (1xn array): array of event times in data indices
    max_idx (int): the length of recording being cleaned
    before (int): num of datapoints before event to include
    after (int): num of datapoitns after event to include

Returns:
    clean (1xn array): array of event times that do not clip the before or
    after windows
%}
no_before = events(events >= before);
clean = no_before(no_before <= max_idx - after);
end