function [pyr, rad] = process_LFP(LFP, animal, chans)
%{
Isolates pyramidal and radiatum signals from LFP block, preprocessing them
for event detection

Args:
    LFP (nxm matrix): Raw electrode LFP where n is channels and m is
    recording length
    animal (int): number of animal
    chans (1xn array): array of channel numbers where the pyramidal layer
    is located

Returns:
    pyr (1xn array): bandpassed, squared, and smoothed LFP from the
    pyramidal channel
    rad (1xn array): bandpassed and smoothed LFP from the radiatum channel.
    
%}
Fs = 1250;
window = 0.01;
kernel = gaussian(window*Fs, ceil(8*window*Fs));


Pyramidal_Layer = LFP(:,chans(animal));
Radiatum = LFP(:,chans(animal)-4);

pyr = BPfilter( Pyramidal_Layer,Fs,150,250).^2; % filter for SWR (150-250 Hz) and square
pyr = smoothvect(pyr, kernel);

rad = BPfilter(Radiatum,1250,8,40);
rad = smoothvect(rad, kernel);
end