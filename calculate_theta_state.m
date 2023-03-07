function [idx, signal] = calculate_theta_state(Theta, Delta)
Fs = 1250;
SMOOTHING = 1; %300ms
KERNEL = gaussian(SMOOTHING*Fs, ceil(8*SMOOTHING*Fs));
KERNEL2 = gaussian(10*SMOOTHING*Fs, ceil(80*SMOOTHING*Fs));
THRESH = 0.5;
MINDUR = 10; 

H_Theta = abs(hilbert(Theta));
H_Delta = abs(hilbert(Delta));

S_Theta = smoothvect(H_Theta, KERNEL);
S_Delta = smoothvect(H_Delta, KERNEL);

Theta_Delta = S_Theta./S_Delta;
signal  = smoothvect(Theta_Delta, KERNEL2);
% in sec, standard 10
disp('making index')
High_C = find(signal > THRESH);
crossings_C = find(Fs*MINDUR < diff(High_C) );

idx = [0 High_C(crossings_C+1)'; High_C(crossings_C)' High_C(end)];

end