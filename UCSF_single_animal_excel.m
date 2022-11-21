function UCSF_single_animal_excel(data, name,cwd)
% Calculate CSD values

high_chan = 7; %pyramidal channel
low_chan = 11; % Radiatum channel
pre_win = 1:550; % pre indices
win = 650:750; % ripple indices
post_win = 850:1300; % post indices


dipole_pre =  calculate_CSD_dipole(data.CSD, high_chan, low_chan, pre_win);
dipole_post = calculate_CSD_dipole(data.CSD, high_chan, low_chan, post_win);
dipole =      calculate_CSD_dipole(data.CSD, high_chan, low_chan, win);

% generate storage figure to write to excel
output = NaN(14,length(data.gamma));

% Format data
output(1,1) = data.SS(1);
output(1,2) = data.SS(2);
output(2,1) = data.SE;
output(3:5,1:7) = data.PLI;
output(6:8,1:7) = data.Coh;
output(9,:) = data.gamma;
output(10,:) = data.dur;
output(11,:) = data.IRI;
output(12,:) = dipole_pre;
output(13,:) = dipole;
output(14,:) = dipole_post;

% Save excel file
Datetime = string(datetime('now'));
cd('C:\COM\ePhy\dbdb\Data\Outputs\Data\SingleAnimal');
Filename = sprintf([name '_data_%s.xlsx'], Datetime);
Filename = regexprep(Filename, {' ', ':', '-'}, {'_', '_', '_'});
xlswrite(Filename, output);


%end