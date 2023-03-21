## Plot graph of Legendre Polynomican and experimental data
## usage:   plt = RegPlot(filename, fitY, fn);
##          fn = (X or T) select regression dependent variable


function plt = RegPlot(filename, fitY, fn);
## checking plot direcotry
dirpath = strcat('data/', strrep(filename,'.csv',''))
if not(isfolder(dirpath))
    mkdir(dirpath)
end

## loading lle data
plottitle = strrep(filename,'.csv','');
lle_data = DataLoading(strcat("data/",filename));

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data,fn);

## plotting results
if fn == 'X';
# fitY plot for mole fraction
plot((2*x_values-1), y_values,'ok', (2*x_values-1), fitY, '-r')
xlabel('mole fraction [x]')
ylabel('Temperature [K]')
legend(strcat(plottitle, '-Data'), strcat(plottitle, '-LegReg'))
title(plottitle)
plotoutput = strcat(dirpath,"/",strrep(filename,'.csv',''), "-X",".pdf");
print(plotoutput)
plt = strcat('plot saved as_', plotoutput)
disp(plt)
elseif fn == 'T';
# fitY plot for Temperature
plot((2*x_values-1), y_values,'ok', (2*x_values-1), fitY, '-r')
ylabel('mole fraction [x]')
xlabel('Temperature [K]')
legend(strcat(plottitle, '-Data'), strcat(plottitle, '-LegReg'))
title(plottitle)
plotoutput = strcat(dirpath,"/",strrep(filename,'.csv',''), "-T",".pdf");
print(plotoutput)
plt = strcat('plot saved as-->', plotoutput)
disp(plt)
endif
endfunction