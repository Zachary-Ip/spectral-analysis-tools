function UCSF_create_excel(measure, vals,file_name)

formatted_vals  = [vals.means; vals.SD; vals.n];
Datetime = string(datetime('now'));
cd(['C:\COM\ePhy\dbdb\Data\Outputs\Data\' measure])
Filename = sprintf([file_name '_data_%s.xlsx'], Datetime);
Filename = regexprep(Filename, {' ', ':', '-'}, {'_', '_', '_'});
xlswrite(Filename, formatted_vals);
end