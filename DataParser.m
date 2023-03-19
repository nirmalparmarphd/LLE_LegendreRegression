## LLE Data Parser, to select X values and Y values from the data
## useage:	[x, y] = DataParser(data)

function [x_values, y_values] = DataParser(data);

x_values = data(:,2); # X values from the LLE data
y_values = data(:,3); # T (K) values from the LLE data

endfunction
