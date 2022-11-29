function UCSF_single_animal_excel(data, name, user)
% Calculate CSD values

high_chan = 7; %pyramidal channel
low_chan = 11; % Radiatum channel
pre_win = 1:550; % pre indices
win = 650:750; % ripple indices
post_win = 850:1300; % post indices

% generate storage figure to write to excel
output = NaN(14, length(data.gamma));

% Format data
output(1, 1:3) = data.SS;
output(2, 1:3) = data.SE;
output(3:5, 1:7) = data.PLI;
output(6:8, 1:7) = data.Co;


if ~isempty(data.CSD)
    dipole_pre = calculate_CSD_dipole(data.CSD, high_chan, low_chan, pre_win);
    dipole_post = calculate_CSD_dipole(data.CSD, high_chan, low_chan, post_win);
    dipole = calculate_CSD_dipole(data.CSD, high_chan, low_chan, win);
    output(9, 1:length(data.gamma)) = data.gamma;
    output(10, 1:length(data.dur)) = data.dur;
    output(11, 1:length(data.IRI)) = data.IRI;
    output(12, 1:length(dipole_pre)) = dipole_pre;
    output(13, 1:length(dipole)) = dipole;
    output(14, 1:length(dipole_post)) = dipole_post;
end
% Save excel file
return_path = pwd;
Datetime = string(datetime('now'));
if strcmp(user,'S')
    cd('C:\COM\ePhy\dbdb\Data\Outputs\Data\SingleAnimal');
else
    cd('C:\Users\ipzach\Documents\MATLAB\output\excel');
end
Filename = sprintf([name, '_data_%s.xlsx'], Datetime);
Filename = regexprep(Filename, {' ', ':', '-'}, {'_', '_', '_'});
%xlswrite(Filename, output);
save([name '_data'],'output');
cd(return_path)

%end