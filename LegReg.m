## LLE Data Analysis with Legendre gnostic regression 
## usage:   LegReg_result = LegReg(filename,order,fn)
##          filename: ../data/filename.csv
##          order: polynomial degree
##          fn = (X or T) select regression dependent variable

function LegReg_result = LegReg(filename, order, fn);
## pkg import
pkg load io

## creating directory for data and plots
if not(isfolder('data'))
    mkdir('data')
end

## creating example specific directory
dirpath = strcat('data/', strrep(filename,'.csv',''))
if not(isfolder(dirpath))
    mkdir(dirpath)
end

## loading lle data
lle_data = DataLoading(strcat("data/",filename))

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data,fn);

## MinMax transformaation of X vaues from LLE data
x_minmax_matirx = MinMaxTransformer(x_values);

## regression of LLE data 
# GrregX, mklegendrematrix, legendreclenshaw, legendrepol
# creating legendre matrix for x transformed values
x_legendre_matrix = mklegendrematrix(x_minmax_matirx, order);
# x - y values structure for GrregX
xy_matrix.x = x_legendre_matrix;
xy_matrix.y = y_values;
# GrregX on xy matrix
LegReg_result = GrregX(xy_matrix)
# coefficient from GrregX
coefficients = LegReg_result.coef;
residuals = LegReg_result.resid;
fitY = LegReg_result.fitY;

## saving LegReg results as mat file
matpath = strcat(dirpath, '/')
save([matpath,'LegReg_result.mat'], 'LegReg_result')
save([matpath,'LegReg_coef.mat'], 'coefficients')
endfunction