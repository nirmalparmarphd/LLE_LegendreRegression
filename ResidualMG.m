## MG marginal analysis of residuals from LegReg
## usage:   intv = ResidualMG(para);
##          para = to define parameters for dfchoice


## MG marginal analysis
function intv = ResidualMG(para);
para = dfchoice
para.data = LegReg_result.resid;
[result, intv, LowerCluster, UpperCluster, ERR] = zw_marginal_analysis_egdf(para);
endfunction
