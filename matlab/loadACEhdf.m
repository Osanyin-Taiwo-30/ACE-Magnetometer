function [MAGdata,MAGdataName] = loadACEhdf(hdfFN,fpYearReq,MAGdataFields)
%
% loads ACE data 
%
% INPUTS:
% --------
%
% hdfFN: filename of HDF5 datafile to read
% yearDOY: year.doy [start stop] e.g. [datetime('2012-02-12'), datetime('2012-02-14')]

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
