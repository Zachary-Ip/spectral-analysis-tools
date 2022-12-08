function [b] = plot_box(data, P,method)
% switch nargin
%     case 2
%         Error = varargin{1};
%         data = varargin{2};
%         P = 1;
%     case 3
%         Error = varargin{1};
%         data = varargin{2};
%         P = varargin{3};
% end

ctl = [194, 194, 194] ./255;
WS = [255, 219, 98] ./255;
MS = [242 189 75] ./255;
EEC = [162 200 178] ./255;
EES = [191,218,196] ./255;

switch method
    case 1
        colors = [ctl;WS;MS];
        xlabels = {'Control','2WS','1MS'};
    case 2
        colors = [ctl;MS;EEC;EES];
        xlabels = {'Control','1MS','EEC','EES'};
end
ctl = [194, 194, 194] ./255;
WS = [255, 219, 98] ./255;
MS = [242 189 75] ./255;
EEC = [162 200 178] ./255;
EES = [191,218,196] ./255;
colors = [ctl;MS;EEC;EES];
b= boxplot(data./1250,'Colors','k');

set(gca,'xticklabels',xlabels, 'TickDir','out');

% b.FaceColor = 'flat';
% b.EdgeColor = 'flat';
counter = 0;
% for i = 1:size(P,1)
%     a = P(i,1);
%     b = P(i,2);
%     if P(i,6) <= 0.05
%         counter = counter +1;
%         yt = get(gca, 'YTick');
%         axis([xlim    0  ceil(max(yt)*1.05)])
%         xt = get(gca, 'XTick');
%         hold on
%         plot(xt([a b]), [1 1]*max(yt)*1.02, '-k',  mean(xt([a b])), max(yt)*1.00+(0.01*counter), '*k')
%         hold off
%         box off
%         
%     end
% end


end
