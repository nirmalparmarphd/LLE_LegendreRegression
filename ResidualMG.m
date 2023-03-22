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
dirpath = strcat('data/', strrep(filename,'.csv',''), '/')
gnp = prepgnplot(result);
fileoutput = strcat(dirpath, "gnp-",strrep(filename,'.csv',''), ".text");
gnsvplot(gnp, fileoutput);
# saving intv as mat
fileoutput_mat = strcat(dirpath, "intv-",strrep(filename,'.csv',''), ".mat");
save(fileoutput_mat, 'intv')
endfunction