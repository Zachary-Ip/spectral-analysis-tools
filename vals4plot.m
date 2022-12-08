function stats = vals4plot(data, method)
switch method
    case '1way'
        L_val_store = NaN(...
            max(...
            [length(data{1,1}) length(data{2,1}) length(data{3,1})]...
            ),3);
        L_val_store(1:length(data{1,1}),1) = data{1,1};
        L_val_store(1:length(data{2,1}),2) = data{2,1};
        L_val_store(1:length(data{3,1}),3) = data{3,1};
        
        stats.L_vals = L_val_store;
        stats.L_means = [mean(data{1,1}) mean(data{2,1}) mean(data{3,1})];
        stats.L_SD = [std(data{1,1}) std(data{2,1}) std(data{3,1})];
        stats.L_n = [length(data{1,1}) length(data{2,1}) length(data{3,1})];
        
        
        R_val_store = NaN(...
            max(...
            [length(data{1,2}) length(data{2,2}) length(data{3,2})]...
            ),3);
        R_val_store(1:length(data{1,2}),1) = data{1,2};
        R_val_store(1:length(data{2,2}),2) = data{2,2};
        R_val_store(1:length(data{3,2}),3) = data{3,2};
        
        stats.R_vals = R_val_store;
        stats.R_means = [mean(data{1,2}) mean(data{2,2}) mean(data{3,2})];
        stats.R_SD = [std(data{1,2}) std(data{2,2}) std(data{3,2})];
        stats.R_n = [length(data{1,2}) length(data{2,2}) length(data{3,2})];
    case '2way'
        L_val_store = NaN(...
            max(...
            [length(data{1,1}) length(data{3,1}) length(data{4,1}) length(data{5,1})]...
            ),4);
        L_val_store(1:length(data{1,1}),1) = data{1,1};
        L_val_store(1:length(data{3,1}),2) = data{3,1};
        L_val_store(1:length(data{4,1}),3) = data{4,1};
        L_val_store(1:length(data{5,1}),4) = data{5,1};
        
        stats.L_vals = L_val_store;
        stats.L_means = [mean(data{1,1}) mean(data{3,1}) mean(data{4,1}) mean(data{5,1})];
        stats.L_SD = [std(data{1,1}) std(data{3,1}) std(data{4,1}) std(data{5,1})];
        stats.L_n = [length(data{1,1}) length(data{3,1}) length(data{4,1}) length(data{5,1})];
        
        R_val_store = NaN(...
            max(...
            [length(data{1,2}) length(data{3,2}) length(data{4,2}) length(data{5,2})]...
            ),4);
        R_val_store(1:length(data{1,2}),1) = data{1,2};
        R_val_store(1:length(data{3,2}),2) = data{3,2};
        R_val_store(1:length(data{4,2}),3) = data{4,2};
        R_val_store(1:length(data{5,2}),4) = data{5,2};
        
        stats.R_vals = R_val_store;
        stats.R_means = [mean(data{1,2}) mean(data{3,2}) mean(data{4,2}) mean(data{5,2})];
        stats.R_SD = [std(data{1,2}) std(data{3,2}) std(data{4,2}) std(data{5,2})];
        stats.R_n = [length(data{1,2}) length(data{3,2}) length(data{4,2}) length(data{5,2})];
end
end