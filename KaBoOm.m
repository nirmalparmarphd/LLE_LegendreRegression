# To run a series of LLE data analysis

filename = 'hexanol_109.csv';
order = 3;
fn = 'X';

# LegReg: Legendre Regression
LegReg_result = LegReg(filename, order, fn);

# MG marginal analysis of residual from LegReg
intv = ResidualMG(filename, LegReg_result.resid);

# plotting fitY and experimental data
plt_reg = RegPlot(filename, LegReg_result.fitY, fn);

# plotting residuals
plt_res = ResidPlot(filename, LegReg_result, intv, fn);

# estimating the outliers from residuals
rdata = OutliersRemover(filename, LegReg_result, intv, fn);
