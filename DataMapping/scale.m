function y = scale( x, oldMin, oldMax, newMin, newMax )
%scale - uses the slope of a linear relationship between old and new
%boundaries to create a ratio between them

y = (newMax - newMin)*(x - oldMin)/(oldMax-oldMin) + newMin;

end

