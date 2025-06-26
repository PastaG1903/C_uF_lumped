% START OF THE CL SCRIPT

load_system('C_uF_lib.slx');
load_system('untitled_repl.slx');
% load_system('repl_nomem.slx');

% MODEL PARAMETERS

set_param('untitled_repl','Decimation','100000');
set_param('untitled_repl','FixedStep','0.001');
set_param('untitled_repl','StopTime','120');
set_param('untitled_repl/Signal Editor','Filename','/home/shay/FM_SSD/shay/C_uF_lumped_MATLAB/Velocity profiles/100_100_1000.mat');

% set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Extrapolation');
set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Holding final value');
% set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Setting to zero');

set_param('untitled_repl/Signal Editor','SampleTime','0.001');

% VENTED CHAMBER
set_param('untitled_repl/vented_chamber_s','init_vol','0');
set_param('untitled_repl/vented_chamber_s','d','2');
set_param('untitled_repl/vented_chamber_s','w','10');
set_param('untitled_repl/vented_chamber_s','InRad','21.5');
set_param('untitled_repl/vented_chamber_s','OutRad','31.5');
set_param('untitled_repl/vented_chamber_s','theta','pi/2');

% RADIAL CHANNEL
set_param('untitled_repl/n_radial_channel','w','2'); % in mm
set_param('untitled_repl/n_radial_channel','d','2'); % in mm
set_param('untitled_repl/n_radial_channel','r_in','31.5');
set_param('untitled_repl/n_radial_channel','r_out','81.5');
set_param('untitled_repl/n_radial_channel','init_vol','200');
set_param('untitled_repl/n_radial_channel','theta','pi/2');

% ISORADIAL CHANNEL
%set_param('untitled_repl/n_isoradial_channel','w','2'); % in mm
%set_param('untitled_repl/n_isoradial_channel','d','0.04'); % in mm
%set_param('untitled_repl/n_isoradial_channel','anglength','48');
%set_param('untitled_repl/n_isoradial_channel','r','55');
%set_param('untitled_repl/n_isoradial_channel','init_vol','0');
%set_param('untitled_repl/n_isoradial_channel','theta','pi/6');
%set_param('untitled_repl/n_isoradial_channel','dir','-1');

% MEM PNEUM CHAMBER
set_param('untitled_repl/mem_pneum_res_s','init_vol','0');
set_param('untitled_repl/mem_pneum_res_s','d','2'); %mm
set_param('untitled_repl/mem_pneum_res_s','w','5'); %mm
set_param('untitled_repl/mem_pneum_res_s','InRad','31.5'); %mm
set_param('untitled_repl/mem_pneum_res_s','OutRad','81.5'); %mm
set_param('untitled_repl/mem_pneum_res_s','mem_rad','5'); %mm
set_param('untitled_repl/mem_pneum_res_s','mem_thick','100'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('untitled_repl/mem_pneum_res_s','init_stress','0'); %Pa
set_param('untitled_repl/mem_pneum_res_s','Young','9800000'); %Pa
set_param('untitled_repl/mem_pneum_res_s','Poisson','0.01');
set_param('untitled_repl/mem_pneum_res_s','theta','pi/2');

% VENTED CHAMBER AT THE END
% set_param('untitled_repl/vent_end_chamber','init_vol','0');
% set_param('untitled_repl/vent_end_chamber','d','2');
% set_param('untitled_repl/vent_end_chamber','w','5');
% set_param('untitled_repl/vent_end_chamber','InRad','31.5');
% set_param('untitled_repl/vent_end_chamber','OutRad','81.5');
% set_param('untitled_repl/vent_end_chamber','theta','pi/2');

simout = sim('./untitled_repl.slx');
% runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs;
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(end),'to','file','filename','sdi_export.xlsx');
%export(runnn(runCount));
close_system('untitled_repl.slx',1);
close_system('C_uF_lib.slx',0);
