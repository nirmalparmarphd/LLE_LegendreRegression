## MG marginal analysis of residuals from LegReg
## usage:   intv = ResidualMG(para);
##          data = residuals data


## MG marginal analysis
function intv = ResidualMG(resid);
para = dfchoice
para.data = resid;
[result, intv, LowerCluster, UpperCluster, ERR] = zw_marginal_analysis_egdf(para);
endfunction
