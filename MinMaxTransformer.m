## Preparing Min Max (-1,1) Matrix for regression (LLE data)
## useage:	x_minmax = MinMaxTransformer(x)

function trans_x_values = MinMaxTransformer(x_values);
x_min = min(x_values);
x_max = max(x_values);
trans_x_values = ((2*x_values - x_min - x_max)/(x_max - x_min));
endfunction
