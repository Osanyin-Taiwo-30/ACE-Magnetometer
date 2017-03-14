function [MAGdata,MAGdataName] = loadACEhdf(hdfFN,fpYearReq,MAGdataFields)
%
% loads ACE data 
%
% INPUTS:
% --------
%
% hdfFN: filename of HDF5 datafile to read
% yearDOY: year.doy [start stop]  E.g. to retreive 2013-04-14T08-54-00 to
% 2013-04-14T08-55-00, yearDOY= [2013.

statHDF = hdfinfo(hdfFN);

fpYear = hdfread(statHDF.Vgroup(1).Vdata,'Fields','fp_year');

fpYear = cell2mat(fpYear);

ReqInd = find(fpYear >= fpYearReq(1) & fpYear <= fpYearReq(2));

ReqIndStart = ReqInd(1);
ReqIndEdge= ReqInd(end)-ReqInd(1) + 1;


 MAGdata = hdfread(statHDF.Vgroup(1).Vdata,...
     'Fields',MAGdataFields,...
     'FirstRecord',ReqIndStart,'NumRecords',ReqIndEdge);

MAGdataName = statHDF.Vgroup(1).Name;

end
