function ripple_visualize(start,last, LFP, chans, animal)
%{
Plots LFP to get intuition on whether SPWRS are real

Args:
    start (int): start idx of SPWR
    last (int): end idx of SPWR
    LFP (32xn matrix): unfiltered LFP
    chans: array with location of pyramidal layers
    animal (int): which animal is being viewed
    pyr (1xn array): Filtered and squared pyr signal
    rad (1xn array): Filtered rad signal
%}
BUFFER = 100;
Fs = 1250;
Pyramidal_Layer = LFP(:,chans(animal));
pyr = BPfilter( Pyramidal_Layer,Fs,100,250);

Radiatum = LFP(:,chans(animal)-3);
rad = BPfilter(Radiatum,1250,8,40);
subplot(2,2,1)
plot(Pyramidal_Layer(start-BUFFER:last+BUFFER))
title('Unfiltered Pyr')
vline(BUFFER,'r')
vline(last-start+BUFFER,'r')


subplot(2,2,2)
plot(pyr(start-BUFFER:last+BUFFER))
title('Filtered Pyr')
vline(BUFFER,'r')
vline(last-start+BUFFER,'r')


subplot(2,2,3)
plot(Radiatum(start-BUFFER:last+BUFFER))
title('Unfiltered Rad')
vline(BUFFER,'r')
vline(last-start+BUFFER,'r')

subplot(2,2,4)
plot(rad(start-BUFFER:last+BUFFER))
title('Filtered rad')
vline(BUFFER,'r')
vline(last-start+BUFFER,'r')

drawnow

end