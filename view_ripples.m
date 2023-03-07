function view_ripples(LTD_ripples, LFP, chans, animal)
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
start = LTD_ripples(:,1);
last = LTD_ripples(:,2);                  
                   
Fs = 1250;
window = 0.01;
kernel = gaussian(window*Fs, ceil(8*window*Fs));
Pyramidal_Layer = LFP(:,chans(animal));


idk = HPFilter(Pyramidal_Layer, Fs, 7,4);
pyr = BPfilter( Pyramidal_Layer,Fs,100,250);
pyr_sq = pyr .^2;
pyr_sm = smoothvect(pyr_sq, kernel);
baseline = mean(pyr_sm);
thresh = baseline + std(pyr_sm)*6;

Radiatum = LFP(:,chans(animal)-3);

rad = BPfilter(Radiatum,1250,8,40);
rad = smoothvect(rad, kernel);

window = 1;
figure
set(gcf,'Color','w');
for i = 1:size(LTD_ripples,1)
subplot(4,1,1)
view(idk, start(i), last(i), Fs, window)
title('Pyr LFP >7 Hz')

subplot(4,1,2)
view(pyr, start(i), last(i), Fs, window)
title('Pyr LFP 150-250 Hz')

subplot(4,1,3)
view(pyr_sq, start(i), last(i), Fs, window)
title('Pyr LFP 150-250 Hz ^2')

subplot(4,1,4)
view(pyr_sm, start(i), last(i), Fs, window)
title('Pyr LFP 150-250 Hz ^2 Smoothed')
hline(thresh,'r--')
hline(baseline,'r:')
drawnow
input('Press enter to continue')
end
end
function view(signal, start, last, Fs, window)


sig_len = max([last-start, Fs*window]);
plot(signal(start-window*Fs:start+sig_len),'k')
box off
xlim([0 length(start-window*Fs:start+sig_len)])

% ylim([min(signal) max(signal)])
vline(Fs*window,'c-')
vline(last-start+Fs*window,'c:')
vline(Fs*window+Fs*0.2,'g--')


drawnow

end