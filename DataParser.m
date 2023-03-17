# LLE Data Parser

function [x_values, y_values] = DataParser(data)

x_values = data(:,2) # X values from the LLE data
y_values = data(:,3) # T (K) values from the LLE data

endfunction