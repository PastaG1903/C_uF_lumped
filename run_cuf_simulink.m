% START OF THE CL SCRIPT

load_system('C_uF_lib.slx');
load_system('untitled_repl.slx');


% MODEL PARAMETERS

set_param('untitled_repl','Decimation','100000');
set_param('untitled_repl','FixedStep','0.0005');
set_param('untitled_repl','StopTime','50');
set_param('untitled_repl/Signal Editor','Filename','/home/shay/FM_SSD/shay/C_uF_lumped_MATLAB/Velocity profiles/linear_inc.mat');

set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Extrapolation');
% set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Holding final value');
% set_param('untitled_repl/Signal Editor','OutputAfterFinalValue','Setting to zero');

set_param('untitled_repl/Signal Editor','SampleTime','0.0005');

% VENTED CHAMBER
set_param('untitled_repl/vented_chamber_s','init_fill','1');
set_param('untitled_repl/vented_chamber_s','d','2');
set_param('untitled_repl/vented_chamber_s','w','0.7');
set_param('untitled_repl/vented_chamber_s','InRad','15');
set_param('untitled_repl/vented_chamber_s','OutRad','25.5');
set_param('untitled_repl/vented_chamber_s','theta','pi/2');

% RADIAL CHANNEL
set_param('untitled_repl/n_radial_channel','w','0.745'); % in mm
set_param('untitled_repl/n_radial_channel','d','2'); % in mm
set_param('untitled_repl/n_radial_channel','r_in','25.5');
set_param('untitled_repl/n_radial_channel','r_out','36');
set_param('untitled_repl/n_radial_channel','init_fill','0');
set_param('untitled_repl/n_radial_channel','theta','pi/6');

% ISORADIAL CHANNEL
%set_param('untitled_repl/n_isoradial_channel','w','2'); % in mm
%set_param('untitled_repl/n_isoradial_channel','d','0.04'); % in mm
%set_param('untitled_repl/n_isoradial_channel','anglength','48');
%set_param('untitled_repl/n_isoradial_channel','r','55');
%set_param('untitled_repl/n_isoradial_channel','init_fill','0');
%set_param('untitled_repl/n_isoradial_channel','theta','pi/6');
%set_param('untitled_repl/n_isoradial_channel','dir','-1');

% MEM PNEUM CHAMBER
set_param('untitled_repl/mem_pneum_res_s','init_fill','0');
set_param('untitled_repl/mem_pneum_res_s','d','2'); %mm
set_param('untitled_repl/mem_pneum_res_s','w','3.06'); %mm
set_param('untitled_repl/mem_pneum_res_s','InRad','25.5'); %mm
set_param('untitled_repl/mem_pneum_res_s','OutRad','36'); %mm
set_param('untitled_repl/mem_pneum_res_s','mem_rad','3'); %mm
set_param('untitled_repl/mem_pneum_res_s','mem_thick','220'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('untitled_repl/mem_pneum_res_s','init_stress','60000'); %Pa
set_param('untitled_repl/mem_pneum_res_s','Young','1200000'); %Pa
set_param('untitled_repl/mem_pneum_res_s','Poisson','0.48');
set_param('untitled_repl/mem_pneum_res_s','theta','pi/2');
set_param('untitled_repl/mem_pneum_res_s','mem_num','1'); %please don't make this 0

simOut = sim('untitled_repl.slx');
% runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs();
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(end),'to','file','filename','sdi_export.xlsx');
%export(runnn(runCount));
close_system('untitled_repl.slx',1);
close_system('C_uF_lib.slx',0);
