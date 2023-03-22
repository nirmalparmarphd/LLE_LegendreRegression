# To run a series of LLE data analysis

filename = 'hexanol_109.csv';
order = 4;
fn = 'X';

# LLE data analysis 
[LegReg_result, intv, plt_reg, plt_res, rdata] = analysis(filename, order, fn);