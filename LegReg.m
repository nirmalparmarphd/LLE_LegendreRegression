## LLE Data Analysis with Legendre gnostic regression 
## usage:   LegReg_result = LegReg(filename,order,fn)
##          filename: ../data/filename.csv
##          order: polynomial degree
##          fn: fitY = f(X or T) 

function LegReg_result = LegReg(filename, order, fn);
## pkg import
pkg load io

## creating directory for data and plots
if not(isfolder('data'))
    mkdir('data')
end

## creating example specific directory
dirpath = strcat('data/', strrep(filename,'.csv',''));
if not(isfolder(dirpath))
    mkdir(dirpath)
end

## loading lle data
lle_data = DataLoading(strcat("data/",filename));

## arranind order of the data as per the function option
if fn == "X"
    [~, idx] = sort(lle_data(:,2),  'ascend');
    lle_data = lle_data(idx,:)
elseif fn == "T"
    [~, idx] = sort(lle_data(:,3),  'ascend');
    lle_data = lle_data(idx,:)
end

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data,fn);

## MinMax transformaation of X (2nd clm) values from LLE data
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
matpath = strcat(dirpath, '/');
save([matpath,'LegReg_result.mat'], 'LegReg_result');
save([matpath,'LegReg_coef.mat'], 'coefficients');
csvwrite([matpath,'LegReg_result.csv'], coefficients);
disp(strcat('legendre regression output saved at:-', dirpath,'/'))
endfunction