function [MAGdata,MAGdataName,MAGdataFields] = PlotACE(startTime, endTime)


%% user parameters

hdfFN = '~/data/ACE/ACE_BROWSE_2013-001_to_current.HDF';


MAGdataFields = {'fp_year','DOY','B_rtn_r_MAG','B_rtn_t_MAG','B_rtn_n_MAG',...
               'B_rtn_theta_MAG','B_rtn_phi_MAG'};
MAGdataUnits = {'year.fracYear','day of year','nT','nT','nT','deg.','deg.'};

%----------------------------------------------
fpYearReq = datenum2fpYear([startTime,endTime]);

%% get data

[MAGdata,MAGdataName] = loadACEhdf(hdfFN,fpYearReq,MAGdataFields);

disp(['loaded data from ',MAGdataName])

%% plots
h.F = figure;

Nheader = 2;
Nsub = length(MAGdataFields) - Nheader;

yearV = zeros(length(MAGdata{1}),6);
yearV(:,1) = fix(MAGdata{1});

%Calc matlab date
dateV = double(MAGdata{2}(:)) + datenum(yearV);


for i = 1:Nsub
   si(i) = subplot(Nsub,1,i);
   plot(dateV,MAGdata{Nheader+i},'-s')
   ylabel([MAGdataFields{i+Nheader},' [',MAGdataUnits{i+Nheader},']'],'interpreter','none')   
   datetick
end
xlabel('Time [UTC]')
    
title(si(1),['ACE data, from ',datestr(dateV(1)),' to ',datestr(dateV(end))])

end
