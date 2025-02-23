% This script was taken from the following URL and further modified
% https://www.mathworks.com/help/simulink/ug/migrate-from-signal-builder-block-to-signal-editor-block.html#mw_2d3cac9b-b311-4b99-bd3a-941c83058a78
% newSignal(n) = timeseries(data', time');
datas = [0,15,15,2,2,0.5,0.5,0];
times = [0,15,20,33,50,51.5,120,120.5];
newSignal = timeseries(datas', times');

fileName = "real_repro.mat";
signalName = "Signal 1";
ds = Simulink.SimulationData.Dataset;
element = Simulink.SimulationData.Signal;
element.Name = signalName;
element.Values = newSignal;
ds = addElement(ds,element);
assignin('caller', ActiveScenario, ds);
% Save MAT-file using append mode.
save(fileName, ActiveScenario, '-append');
