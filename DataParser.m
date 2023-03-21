## LLE Data Parser, to select X values and Y values from the data
## useage:	[x, y] = DataParser(data, fn)
##          data = LLE experimental data [Sr.No, X, T[K]]
##          fn = (X or T) select regression dependent variable

function [x_values, y_values] = DataParser(data, fn);

if fn == 'X';
x_values = data(:,2); # X mole fraction values from the LLE data
y_values = data(:,3); # T (K) values from the LLE data

elseif fn == 'T';
x_values = data(:,3); # T (K) values from the LLE data
y_values = data(:,2); # X mole fraction values from the LLE data

else
disp('wrong useage')
endif
endfunction
