## MG marginal analysis of residuals from LegReg
## usage:   [result, intv] = ResidualMG(filename, resid);
##          resid = residuals data
##          filename = data filename

## MG marginal analysis
function [result, intv] = ResidualMG(filename, resid);
para.Type = "E";
para.Kind = "g";
para.Form = "a";
para.varS = 1;
para.data = resid;
disp("calculating...")
[result, intv, LowerCluster, UpperCluster, ERR] = zw_marginal_analysis_egdf(para);
# gnp file generation and pdf
dirpath = strcat('data/', strrep(filename,'.csv',''), '/');
gnp = prepgnplot(result);
fileoutput = strcat(dirpath, "gnp-",strrep(filename,'.csv',''), ".text");
gnsvplot(gnp, fileoutput);
# saving intv as mat
fileoutput_mat = strcat(dirpath, "intv-",strrep(filename,'.csv',''), ".mat");
save(fileoutput_mat, 'intv')
endfunction
