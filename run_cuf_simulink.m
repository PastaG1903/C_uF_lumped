% START OF THE CL SCRIPT

load_system('C_uF_lib.slx');
load_system('untitled.slx');

% set_param("untitled","DataLogging","on");
% set_param('./C_uF_lumped_MATLAB/untitled.slx/mem_pneum_res1.ssc','mem_rad','5');
% save('Sim_Res.mat','simOut');

% MODEL PARAMETERS

set_param('untitled','Decimation','100000');
set_param('untitled','FixedStep','0.0005');
set_param('untitled','StopTime','15')
set_param('untitled/Signal Editor','Filename','/mnt/flashMich/shay/C_uF_lumped_MATLAB/Velocity profiles/10-10.mat');
set_param('untitled/Signal Editor','SampleTime','0.0005')

% VENTED CHAMBER
set_param('untitled/vented_chamber','init_fill','1');
set_param('untitled/vented_chamber','d','4.04');
set_param('untitled/vented_chamber','anglength','160');
set_param('untitled/vented_chamber','InRad','15');
set_param('untitled/vented_chamber','OutRad','45');
set_param('untitled/vented_chamber','theta','pi/2');

% RADIAL CHANNEL
set_param('untitled/n_radial_channel','w','0.8'); % in mm
set_param('untitled/n_radial_channel','d','4'); % in mm
set_param('untitled/n_radial_channel','r_in','45');
set_param('untitled/n_radial_channel','r_out','62');
set_param('untitled/n_radial_channel','init_fill','0');
set_param('untitled/n_radial_channel','theta','pi/6');

% ISORADIAL CHANNEL
set_param('untitled/n_isoradial_channel','w','0.6'); % in mm
set_param('untitled/n_isoradial_channel','d','4'); % in mm
set_param('untitled/n_isoradial_channel','anglength','20');
set_param('untitled/n_isoradial_channel','r','62');
set_param('untitled/n_isoradial_channel','init_fill','0');
set_param('untitled/n_isoradial_channel','theta','pi/6');
set_param('untitled/n_isoradial_channel','dir','-1');

% MEM PNEUM CHAMBER
set_param('untitled/mem_pneum_res1','init_fill','0');
set_param('untitled/mem_pneum_res1','d','4.04'); %mm
set_param('untitled/mem_pneum_res1','anglength','160'); %°
set_param('untitled/mem_pneum_res1','InRad','45'); %mm
set_param('untitled/mem_pneum_res1','OutRad','62'); %mm
set_param('untitled/mem_pneum_res1','mem_rad','13'); %mm
set_param('untitled/mem_pneum_res1','mem_thick','80'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('untitled/mem_pneum_res1','init_stress','225000'); %Pa
set_param('untitled/mem_pneum_res1','Young','6000000'); %Pa
set_param('untitled/mem_pneum_res1','Poisson','0.63');
set_param('untitled/mem_pneum_res1','theta','0');
set_param('untitled/mem_pneum_res1','mem_num','2'); %please don't make this 0


simOut = sim('untitled.slx');
% runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs();
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(end),'to','file','filename','sdi_export.xlsx');
%export(runnn(runCount));
close_system('C_uF_lib.slx',0);
close_system('untitled.slx',0);
