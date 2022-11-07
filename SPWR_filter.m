function [events] = SPWR_filter(pyr, rad)
%{
Find events in pyr that co-occur during radiatum events

Args:
    pyr (nx9 matrix): pyramidal events and properties
    rad (nx9 matrix): radiatum events and properties

Returns:
    events(mx9 matrix): Events that co-occur 
%}
events = [];
counter = 0;

    for i = 1: size(rad,1)
        association = ismember(pyr(:,1), rad(i,1):rad(i,2));
        for j = 1:length(association)
            if association(j)
                counter = counter + 1;
                events(counter,:) = pyr(j,:);
            end
        end
    end

end