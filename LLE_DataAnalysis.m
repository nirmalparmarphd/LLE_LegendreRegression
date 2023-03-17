## LLE Data Analysis

## pkg import
clear
pkg load io

## loading lle data
lle_data = DataLoading('hexanol_109.csv')

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data)

## MinMax transformaation of X vaues from LLE data
x_minmax_matirx = MinMaxTransformer(x_values)

## regression of LLE data 
# GrregX, mklegendrematrix, legendreclenshaw, legendrepol
# creating legendre matrix
x_legendre_matrix = mklegendrematrix(x_minmax_matirx, 3)

## residual check

## plotting results 