## Plot graph of Legendre Polynomican and experimental data
## usage:   plt = RegPlot(filename, fitY);

function plt = RegPlot(filename, fitY);
## loading lle data
plottitle = strrep(filename,'.csv','');
plotoutput = strcat("plots/",strrep(filename,'.csv',''),".pdf");
lle_data = DataLoading(strcat("data/",filename));

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data);

## plotting results 
plot(x_values, y_values,'ok', x_values, fitY, '*r')
xlabel('mol fraction [x]')
ylabel('Temperature [K]')
legend(strcat(plottitle, '-Data'), strcat(plottitle, '-LegReg'))
title(plottitle)
print(plotoutput)
plt = strcat('plot saved as ', plotoutput)
disp(plt)
endfunction