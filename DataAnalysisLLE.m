## LLE Data Analysis with Legendre gnostic regression 

## pkg import
clear
pkg load io

## loading lle data
filename = ('hexanol_109.csv');
plottitle = strrep(filename,'.csv','');
plotoutput = strcat("plots/",strrep(filename,'.csv',''),".pdf");

lle_data = DataLoading(filename)

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data);

## MinMax transformaation of X vaues from LLE data
x_minmax_matirx = MinMaxTransformer(x_values)

## regression of LLE data 
# GrregX, mklegendrematrix, legendreclenshaw, legendrepol

# creating legendre matrix for x transformed values
x_legendre_matrix = mklegendrematrix(x_minmax_matirx, 3)
# x - y values structure for GrregX
xy_matrix.x = x_legendre_matrix;
xy_matrix.y = y_values;

# GrregX on xy matrix
grregx_result = GrregX(xy_matrix)
# coefficient from GrregX
coefficients = grregx_result.coef;
residuals = grregx_result.resid;

## legendreclenshaw
y_lc = legendreclenshaw(x_values, coefficients);
y_lc_resid = y_values - y_lc;
## residual for y_lc
lc_reg_result = [y_values, y_lc, y_lc_resid]

## legendrepol
y_lpoly = legendrepol(x_values,5);
y_lpoly_resid = y_values - y_lpoly;
y_lpoly_result = [y_values, y_lpoly, y_lpoly_resid]

## plotting results 
plot(x_values, y_values,'ok', x_values, y_lc, '*r')
xlabel('mol fraction [x]')
ylabel('Temperature [K]')
legend(strcat(plottitle, '-Data'), strcat(plottitle, '-LReg'))
title(plottitle)
print(plotoutput)
