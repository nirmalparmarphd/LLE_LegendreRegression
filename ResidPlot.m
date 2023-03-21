## To plot residual as a function of T or X
## usage:   ResidPlot(filename, resid, fn);
##          fn = (X or T) select regression dependent variable
##          result = LegReg_result data
##          intv = interval results from marginal analysis

## fucntion
function plt = ResidPlot(filename, result, intv, fn);

## checking plot direcotry
plottitle = strrep(filename,'.csv','');
dirpath = strcat('data/', strrep(filename,'.csv',''));
if not(isfolder(dirpath))
    mkdir(dirpath)
end

# defined intv values
tl_ub_intv = intv.fin(4) - intv.fin(3);
tl_lb_intv = intv.fin(3) - intv.fin(2);
di_ub_intv = intv.fin(5) - intv.fin(3);
di_lb_intv = intv.fin(3) - intv.fin(1);
lb_intv = intv.LB;
ub_intv = intv.UB;
di_intv = abs(di_lb_intv) + abs(di_ub_intv);

# plotting result for X residuals
if fn == 'X';
plot(result.y, result.resid, 'ob');
hold on
# plotting errorbar
errorbar(median(result.y), intv.fin(3), di_lb_intv, di_ub_intv,'-k');
errorbar(median(result.y), intv.fin(3), tl_lb_intv, tl_ub_intv, '#~r');
# plotting UB LB
if abs(lb_intv) < (3*di_intv);
plot([min(result.y), max(result.y)],[lb_intv, lb_intv], '--r');
endif
if abs(ub_intv) < (3*di_intv);
plot([min(result.y), max(result.y)],[ub_intv, ub_intv], '--r');
endif
hold off
xlabel('Tempearature [K]');
ylabel('Residuals');
legend(strcat(plottitle, ' - LegReg Residuals'), 'Interval of Typical Data', 'Tolerance Interval','location','southoutside');
plotoutput=strcat(dirpath, "/", strrep(filename,'.csv',''), "-Resid-T",".pdf");
print(plotoutput);
plt = strcat('plot saved as_', plotoutput);
disp(plt)

# plotting result for T residuals
elseif fn == 'T';
plot(result.y, result.resid, 'ob');
hold on
# plotting errorbar
# plotting errorbar
errorbar(median(result.y), intv.fin(3), di_lb_intv, di_ub_intv,'-k');
errorbar(median(result.y), intv.fin(3), tl_lb_intv, tl_ub_intv, '#~r');
# plotting UB LB
if abs(lb_intv) < (3*di_intv);
plot([min(result.y), max(result.y)],[lb_intv, lb_intv], '--r');
endif
if abs(ub_intv) < (3*di_intv);
plot([min(result.y), max(result.y)],[ub_intv, ub_intv], '--r');
endif
hold off
xlabel('Mole Fraction');
ylabel('Residuals');
legend(strcat(plottitle, ' - LegReg Residuals'), 'Interval of Typical Data', 'Tolerance Interval','location','southoutside');
plotoutput=strcat(dirpath, "/", strrep(filename,'.csv',''), "-Resid-X",".pdf");
print(plotoutput);
plt = strcat('plot saved as_', plotoutput);
disp(plt)
endif
endfunction