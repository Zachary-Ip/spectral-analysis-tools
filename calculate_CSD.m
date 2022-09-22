function [storage] = calculate_CSD(storage, LFP, events, channel, before, after, Fs)
%{
Calculate 
%}
temp_CSD = zeros(before+after+1,12,length(events));
for i = 1:length(LTDevents)
    temp_CSD(:,:,i) = CSDlite(...
        LFP(LTDevents(i)-before:LTDevents(i)+after,...
        channel-5:channel+6),...
        Fs,...
        1e-4);
end

if isempty(storage)
    storage = temp_CSD;
else
    storage = cat(3,storage,temp_CSD);
end

end