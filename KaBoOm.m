# To run a series of LLE data analysis

filename = 'propanol_175_176.csv';
order = 5;
fn = 'X';

# LLE data analysis 
[LegReg_result, mg_result, intv, plt_reg, plt_res, rdata] = analysis(filename, order, fn);