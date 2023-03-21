## LLE analysis script


# LegReg: Legendre Regression
LegReg_result = LegReg(filename='hexanol_109.csv', order=3, fn='T');

# MG marginal analysis of residual from LegReg
intv = ResidualMG(filename, LegReg_result.resid);

# plotting results and data
plt = RegPlot(filename, LegReg_result.fitY, fn);