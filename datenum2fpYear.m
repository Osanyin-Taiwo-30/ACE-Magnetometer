function fpYear = datenum2fpYear(datenumvector)
%
% converts "datenum" format dates into the day of year format.
%
% Michael Hirsch June 2013
%
%
 
[year,~] = datevec(datenumvector);
year = unique(year);
if length(year)>1, 
    year = year(1);
    error(['this function only uses first year value ',num2str(year)]), 
end
 
daysInYear = 365 + double(( ~rem(year, 4) & rem(year, 100) ) | ~rem(year, 400));
 
dayOfYear = datenumvector - datenum(year,1,1,0,0,0) + 1;
 
fracYear = (dayOfYear-1)/daysInYear;
 
fpYear = year+fracYear;
 
 
 
 
end
