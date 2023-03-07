function view_data(LFP, TD)
Fs = 1250;
smoothing_width = 0.01; % 300 ms
kernel = gaussian(smoothing_width*Fs, ceil(8*smoothing_width*Fs));
hp_pyr = HPFilter(LFP, Fs, 7, 4);
pyr = BPfilter(LFP, 1250, 150, 250);
pyr2 = BPfilter(hp_pyr, 1250, 150, 250);
sq_pyr = pyr .^2;
sm_pyr = smoothvect(sq_pyr, kernel);

baseline = mean(sm_pyr);
thresh = baseline + std(sm_pyr)*6;

figure
for i = 1:50:length(LFP)
subplot(5,1,1)
view(hp_pyr, i)
title('LFP > 7 Hz');

subplot(5,1,2)
view(pyr, i)
title('LFP 150-250 Hz');

subplot(5,1,3)
view(sq_pyr, i)
title('LFP 150-250 Hz ^2');

subplot(5,1,4)
view(sm_pyr, i)
title('LFP 150-250 Hz Smoothed');
hline(thresh,'r--')
hline(baseline,'r:')


subplot(5,1,5)
view(TD, i)
title('TD state');
hline(0.5)
drawnow
pause(0.04)

end
end

function view(signal, i)
plot(signal(i:i+12500),'k')
xlim([0 1250])
%ylim([min([0, min(signal)]), max(signal)])

end

