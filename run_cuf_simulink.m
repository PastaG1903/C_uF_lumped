% START OF THE CL SCRIPT

load_system('C_uF_lib.slx');
load_system('untitled_repl.slx');


% MODEL PARAMETERS

set_param('untitled','Decimation','100000');
set_param('untitled','FixedStep','0.0005');
set_param('untitled','StopTime','50');
set_param('untitled/Signal Editor','Filename','/home/shay/FM_SSD/shay/C_uF_lumped_MATLAB/Velocity profiles/linear_inc.mat');

set_param('untitled/Signal Editor','OutputAfterFinalValue','Extrapolation');
% set_param('untitled/Signal Editor','OutputAfterFinalValue','Holding final value');
% set_param('untitled/Signal Editor','OutputAfterFinalValue','Setting to zero');

set_param('untitled/Signal Editor','SampleTime','0.0005');

% VENTED CHAMBER
set_param('untitled/vented_chamber','init_fill','1');
set_param('untitled/vented_chamber','d','2');
set_param('untitled/vented_chamber','anglength','10');
set_param('untitled/vented_chamber','InRad','15');
set_param('untitled/vented_chamber','OutRad','30');
set_param('untitled/vented_chamber','theta','pi/2');

% RADIAL CHANNEL
set_param('untitled/n_radial_channel','w','2'); % in mm
set_param('untitled/n_radial_channel','d','0.04'); % in mm
set_param('untitled/n_radial_channel','r_in','30');
set_param('untitled/n_radial_channel','r_out','55');
set_param('untitled/n_radial_channel','init_fill','0');
set_param('untitled/n_radial_channel','theta','pi/6');

% ISORADIAL CHANNEL
set_param('untitled/n_isoradial_channel','w','2'); % in mm
set_param('untitled/n_isoradial_channel','d','0.04'); % in mm
set_param('untitled/n_isoradial_channel','anglength','48');
set_param('untitled/n_isoradial_channel','r','55');
set_param('untitled/n_isoradial_channel','init_fill','0');
set_param('untitled/n_isoradial_channel','theta','pi/6');
set_param('untitled/n_isoradial_channel','dir','-1');

% MEM PNEUM CHAMBER
set_param('untitled/mem_pneum_res1','init_fill','0');
set_param('untitled/mem_pneum_res1','d','2.04'); %mm
set_param('untitled/mem_pneum_res1','anglength','6'); %°
set_param('untitled/mem_pneum_res1','InRad','16'); %mm
set_param('untitled/mem_pneum_res1','OutRad','45'); %mm
set_param('untitled/mem_pneum_res1','mem_rad','6'); %mm
set_param('untitled/mem_pneum_res1','mem_thick','80'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('untitled/mem_pneum_res1','init_stress','100000'); %Pa
set_param('untitled/mem_pneum_res1','Young','9800000'); %Pa
set_param('untitled/mem_pneum_res1','Poisson','0.1');
set_param('untitled/mem_pneum_res1','theta','pi/2');
set_param('untitled/mem_pneum_res1','mem_num','1'); %please don't make this 0

simOut = sim('untitled.slx');
% runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs();
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(end),'to','file','filename','sdi_export.xlsx');
%export(runnn(runCount));
close_system('untitled.slx',1);
close_system('C_uF_lib.slx',0);
