function [LTD_events] = TD_check(events, REM, recording)
%{
Check if events occur during LTD period, return events during LTD

Args:
    events (nx9):  matrix of detected events and characteristics
    REM (struct): Struct containing multiple values, namely start and end
    times of REM periods
    recording (int): num of recording for this animal to reference in REM

Returns:
    LTD_events(nx9): events that occur during LTD
%}
Fs = 1250;
ThetaDeltaIdx = [];
LTD_events = [];
for iiRem = 1:length(REM(recording).R.start)
    ThetaDeltaIdx = [ThetaDeltaIdx (round(REM(recording).R.start(iiRem)*Fs)):(round(REM(recording).R.end(iiRem)*Fs))];
end

counter = 0;
for i = 1: size(events,1)
    if ismember(events(i,1),ThetaDeltaIdx)
        counter = counter + 1;
        LTD_events(counter,:) = events(i,:);
    end
end
end