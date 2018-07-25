function [dayOfYear, year] = date2DOY(datenumvector)
%
% converts "datenum" format dates into the day of year format.
%
% Michael Hirsch June 2013
 
[year,~] = datevec(datenumvector);
 
dayOfYear = datenumvector - datenum(year,1,1,0,0,0) + 1;
 
end
