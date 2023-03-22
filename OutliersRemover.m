## To identify outliers and remove
## useage:  rdata = OutliersRemover(filename, result, intv, fn);
##          fn = (X or T) select regression dependent variable
##          result = LegReg_result data

# function
function rdata = OutliersRemover(filename, result, intv, fn);

## checking plot direcotry
plottitle = strrep(filename,'.csv','');
dirpath = strcat('data/', strrep(filename,'.csv',''));
if not(isfolder(dirpath))
    mkdir(dirpath)
end

## loading main data
lle_data = DataLoading(strcat("data/",filename));
## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data,fn);

## bounds from interval of typical data
di_lb = intv.LB;
di_ub = intv.UB;
## matrix of Y and residuals
## Exp x values. Exp y values, residual values
mdata = [x_values, result.y, result.resid];
## removing outliers
rdata = [];
for i = 1:size(mdata,1);
    if mdata(i,3) <= di_ub && mdata(i,3) >= di_lb;
    rdata = [rdata; mdata(i,:)];
    end
end
disp(rdata)

## saving clean data without outliers
dirpath = strcat('data/', strrep(filename,'.csv',''));
matpath = strcat(dirpath, '/', fn,"-");
save([matpath,'clean_data.mat'], 'rdata');
csvwrite(strcat(matpath, "clean_data.csv"), rdata);

endfunction