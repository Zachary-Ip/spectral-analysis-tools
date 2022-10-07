function [x,y] = define_window(csd)
%{
View CSD and get coordinates of regions of interest

Args:
    csd (m x n array): 2D matrix of csd values to be plotted as a heatmap

Returns:
    x (1xn array): 1D array of x coordinates of selected points
    y (1xn array): 1D array of y coordinates of selected points
%}
hotcold = redblue();
f = figure;
h2 = pcolor(csd);
set(h2,'EdgeColor','none'), colormap(flipud(hotcold))
title('400 d','FontSize',14)
caxis([-5 5])
[x,y] = getpts(f);
disp(x)
disp(y)
end
