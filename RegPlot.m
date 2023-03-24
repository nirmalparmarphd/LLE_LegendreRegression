## Plot graph of Legendre Polynomican and experimental data
## usage:   plt = RegPlot(filename, fitY, fn);
##          fn = (X or T) select regression dependent variable


function plt = RegPlot(filename, fitY, fn);
## checking plot direcotry
dirpath = strcat('data/', strrep(filename,'.csv',''));
if not(isfolder(dirpath))
    mkdir(dirpath)
end

## loading lle data
plottitle = strrep(filename,'.csv','');
lle_data = DataLoading(strcat("data/",filename));

## arranind order of the data as per the function option
if fn == "X"
    [~, idx] = sort(lle_data(:,2),  'ascend');
    lle_data = lle_data(idx,:)
elseif fn == "T"
    [~, idx] = sort(lle_data(:,3),  'ascend');
    lle_data = lle_data(idx,:)
end

## Data parsing to get X and Y values from LLE data
[x_values, y_values] = DataParser(lle_data,fn);

## plotting results
figure(1);
if fn == 'X';
# fitY plot for mole fraction
plot((2*x_values-1), y_values,'ok', (2*x_values-1), fitY, '-r')
xlabel('mole fraction [2x-1]')
ylabel('Temperature [K]')
legend(strcat(plottitle, '- Data'), strcat(plottitle, '- Legendre Regression'),'location','southoutside')
title(plottitle)
plotoutput = strcat(dirpath,"/",strrep(filename,'.csv',''), "-X",".pdf");
print(plotoutput, '-dpdf', '-S1200,720')
plt = strcat('plot saved as_', plotoutput);
disp(plt)
elseif fn == 'T';
# fitY plot for Temperature
plot((2*y_values-1), x_values, 'ok', (2*fitY-1), x_values, '-r')
xlabel('mole fraction [2x-1]')
ylabel('Temperature [K]')
legend(strcat(plottitle, '- Data'), strcat(plottitle, '- Legendre Regression'), 'location','southoutside')
title(plottitle)
plotoutput = strcat(dirpath,"/",strrep(filename,'.csv',''), "-T",".pdf");
print(plotoutput, '-dpdf', '-S1200,720')
plt = strcat('plot saved as-->', plotoutput);
disp(plt)
endif
endfunction