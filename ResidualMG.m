## MG marginal analysis of residuals from LegReg
## usage:   intv = ResidualMG(filename, resid);
##          resid = residuals data
##          filename = data filename

## MG marginal analysis
function intv = ResidualMG(filename, resid);
para = dfchoice
para.data = resid;
[result, intv, LowerCluster, UpperCluster, ERR] = zw_marginal_analysis_egdf(para);
# gnp file generation and pdf
gnp = prepgnplot(result);
fileoutput = strcat("data/", "gnp-",strrep(filename,'.csv',''), ".text);
gnsvplot(gnp, fileoutput);
endfunction
