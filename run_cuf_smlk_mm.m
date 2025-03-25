% START OF THE CL SCRIPT

load_system('C_uF_lib.slx');
load_system('titled.slx');


% MODEL PARAMETERS

set_param('titled','Decimation','1000000');
set_param('titled','FixedStep','0.0005');
set_param('titled','StopTime','20');
set_param('titled/Signal Editor','Filename','/mnt/flashMich/shay/C_uF_lumped_MATLAB/Velocity profiles/real_repro.mat');

% set_param('titled/Signal Editor','OutputAfterFinalValue','Extrapolation');
set_param('titled/Signal Editor','OutputAfterFinalValue','Holding final value');
% set_param('titled/Signal Editor','OutputAfterFinalValue','Setting to zero');

set_param('titled/Signal Editor','SampleTime','0.0005');

% VENTED CHAMBER
set_param('titled/vented_chamber','init_fill','1');
set_param('titled/vented_chamber','d','4.04');
set_param('titled/vented_chamber','anglength','160');
set_param('titled/vented_chamber','InRad','15');
set_param('titled/vented_chamber','OutRad','45');
set_param('titled/vented_chamber','theta','pi/2');
set_param('titled/vented_chamber','G','-1'); % -1 when outlet points against direction of rotation

% RADIAL CHANNEL
set_param('titled/n_radial_channel','w','0.475'); % in mm
set_param('titled/n_radial_channel','d','4'); % in mm
set_param('titled/n_radial_channel','r_in','45');
set_param('titled/n_radial_channel','r_out','62');
set_param('titled/n_radial_channel','init_fill','0');
set_param('titled/n_radial_channel','theta','pi/4');

% ISORADIAL CHANNEL
set_param('titled/n_isoradial_channel','w','0.45'); % in mm
set_param('titled/n_isoradial_channel','d','4'); % in mm
set_param('titled/n_isoradial_channel','anglength','20');
set_param('titled/n_isoradial_channel','r','62');
set_param('titled/n_isoradial_channel','init_fill','0');
set_param('titled/n_isoradial_channel','theta','pi/4');
set_param('titled/n_isoradial_channel','dir','-1'); %-1 when the forward flow goes against the direction of rotation

% MEM PNEUM CHAMBER
set_param('titled/multi_mem_res','init_fill','0');
set_param('titled/multi_mem_res','d','4.04'); %mm
set_param('titled/multi_mem_res','anglength','160'); %°
set_param('titled/multi_mem_res','InRad','45'); %mm
set_param('titled/multi_mem_res','OutRad','62'); %mm
set_param('titled/multi_mem_res','theta','pi/2');
set_param('titled/multi_mem_res','G','1'); %1 when flow is opposite to the direction of rotation

%   Membrane 1
set_param('titled/multi_mem_res','mem_rad_1','21'); %mm
set_param('titled/multi_mem_res','mem_thick_1','100'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('titled/multi_mem_res','init_stress_1','933333'); %Pa
set_param('titled/multi_mem_res','Young_1','9800000'); %Pa
set_param('titled/multi_mem_res','Poisson_1','0.01');

%   Membrane 2
set_param('titled/multi_mem_res','mem_rad_2','21'); %mm
set_param('titled/multi_mem_res','mem_thick_2','100'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('titled/multi_mem_res','init_stress_2','933333'); %Pa
set_param('titled/multi_mem_res','Young_2','9800000'); %Pa
set_param('titled/multi_mem_res','Poisson_2','0.01');

%   Membrane 3
set_param('titled/multi_mem_res','mem_rad_3','21'); %mm
set_param('titled/multi_mem_res','mem_thick_3','100'); %um THIS IS THE ONLY VALUE IN MICRONS
set_param('titled/multi_mem_res','init_stress_3','933333'); %Pa
set_param('titled/multi_mem_res','Young_3','9800000'); %Pa
set_param('titled/multi_mem_res','Poisson_3','0.01');


simOut = sim('titled.slx');
% runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs();
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(end),'to','file','filename','sdi_export.xlsx');
%export(runnn(runCount));
save_system('titled.slx');
close_system('titled.slx',1);
close_system('C_uF_lib.slx',0);
