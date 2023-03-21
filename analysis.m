## LLE analysis script


# LegReg: Legendre Regression
LegReg_result = LegReg(filename='hexanol_109.csv', order=3, fn='X');

# MG marginal analysis of residual from LegReg
intv = ResidualMG(filename, LegReg_result.resid);

# plotting fitY and experimental data
plt = RegPlot(filename, LegReg_result.fitY, fn);

# plotting residuals
plt_res = ResidPlot(filename, LegReg_result, intv, fn);

# estimating the outliers from residuals
rdata = OutliersRemover(filename, LegReg_result, intv, fn);