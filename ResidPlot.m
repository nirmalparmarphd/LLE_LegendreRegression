## To plot residual as a function of T or X
## usage:   ResidPlot(filename, resid, fn);
##          fn = (X or T) select regression dependent variable
##          reside = residual data

## fucntion
function plt = ResidPlot(filename, resid, y, fn);

## checking plot direcotry
plottitle = strrep(filename,'.csv','');
dirpath = strcat('data/', strrep(filename,'.csv',''))
if not(isfolder(dirpath))
    mkdir(dirpath)
end

# plotting result for X residuals
if fn == 'X';
plot(y, resid, 'ob');
xlabel('Tempearature [K]');
ylabel('Residuals');
legend(strcat(plottitle, ' - LegReg Residuals'));
plotoutput=strcat(dirpath, "/", strrep(filename,'.csv',''), "-Resid-T",".pdf");
print(plotoutput);
plt = strcat('plot saved as_', plotoutput);
disp(plt)
# plotting result for T residuals
elseif fn == 'T';
plot(y, resid, 'ob');
xlabel('Mole Fraction');
ylabel('Residuals');
legend(strcat(plottitle, ' - LegReg Residuals'));
plotoutput=strcat(dirpath, "/", strrep(filename,'.csv',''), "-Resid-X",".pdf");
print(plotoutput);
plt = strcat('plot saved as_', plotoutput);
disp(plt)
endif
endfunction