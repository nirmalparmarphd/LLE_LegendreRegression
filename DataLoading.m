## To load, clean and sort LLE data from data.csv file
## useage:	data = DataLoading('data.csv')

function data = DataLoading(filename);
data_raw = csvread(filename);
format short g
output_precision(4)
data = data_raw(2:end,:); # droping the title of LLE data

endfunction
