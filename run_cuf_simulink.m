load_system('./C_uF_lumped_MATLAB/C_uF_lib.slx');
load_system('./C_uF_lumped_MATLAB/untitled.slx');

% set_param("untitled","DataLogging","on");
% set_param('./C_uF_lumped_MATLAB/untitled.slx/mem_pneum_res1.ssc','mem_rad','5');
% save('Sim_Res.mat','simOut');

simOut = sim('untitled.slx');
runCount = Simulink.sdi.getRunCount();
runnn = Simulink.sdi.getAllRunIDs();
% runID = Simulink.sdi.getRun(runCount);
Simulink.sdi.exportRun(runnn(runCount));
close_system('./C_uF_lumped_MATLAB/C_uF_lib.slx.slx',0);
close_system('./C_uF_lumped_MATLAB/untitled.slx',0);
