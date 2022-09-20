function [comodulogram] = comodulate(amp, phase)
%{
Generate comodulogram using filtered amplitude and phase signals to
calculate modulation index.

Args:
    amp(m x n array): where m is number of frequencies, and n is signal
    length
    phase(m x n array): where m is number of frequencies, and n is signal
    length

Returns:
    comodulogram (m x n array): where m is number of amplitude frequencies
    and n is the number of phase frequencies the values are the modulation
    index

%}
comodulogram = single(zeros(size(phase,1),size(amp,1)));

nbin = 0:17; % defines how many fractions to divide phase into
winsize = 2*pi/18;
position = nbin*winsize-pi;

counter1= 0;
for i = 1:size(phase,1)
    counter1 = counter1+1;
    counter2=0;
    for j = 1:size(amp,1)
        counter2 = counter2+1;
        [MI,~] = ModIndex_v2(phase(i, :), amp(j, :), position);
        comodulogram(counter1,counter2) = MI;
    end % for j
end  % for  i

end