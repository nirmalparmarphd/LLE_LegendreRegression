## LLE analysis script

# LegReg: Legendre Regression
LegReg_result = LegReg('hexanol_109.csv', order=3);

# MG marginal analysis of residual from LegReg
intv = ResidualMG(para);