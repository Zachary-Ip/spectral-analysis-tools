function [ripple, label] = label_ripples(prev_rip, prev_label, events, c)
%{
Create labels for values for statistical testing

Args:
    prev_rip (array): storage variable for ripples
    prev_label (array): storage variable for labels
    events (matrix): current animal ripples
    c (int): unique number for each animal in group

Returns: 
    ripple: array concatenating all ripples with number of ripples with name
of new animal
    label: 
%}
ripple = [prev_rip; events]; % DB+ 200D
temp_label = zeros(size(events, 1), 1);
temp_label(:) = c;
label = [prev_label; temp_label];
end