## LLE analysis script
## useage:   [LegReg_result, mg_result, intv, plt_reg, plt_res, rdata] = analysis(filename, order, fn);
##          filename: ../data/filename.csv
##          order: polynomial degree
##          fn = (X or T) select regression dependent variable
##          LegReg_result: result from legendre regression
##          intv: intervals from MG marginal analysis
##          plt_reg: regression plot
##          plt_res: residual plot


function [LegReg_result, mg_result, intv, plt_reg, plt_res, rdata] = analysis(filename, order, fn);

# LegReg: Legendre Regression
LegReg_result = LegReg(filename, order, fn);

# MG marginal analysis of residual from LegReg
[mg_result, intv] = ResidualMG(filename, LegReg_result.resid);

# plotting fitY and experimental data
plt_reg = RegPlot(filename, LegReg_result.fitY, fn);

# plotting residuals
plt_res = ResidPlot(filename, LegReg_result, intv, fn);

# estimating the outliers from residuals
rdata = OutliersRemover(filename, LegReg_result, intv, fn);

# done
msgbox("KaBoOm!");
disp("Done!")
endfunction