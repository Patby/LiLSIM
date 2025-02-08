
%function [ch1, ixd1, ch2, ixd2, ch3, ixd3, dq] = Init_DAQ()
function [ch1, ixd1, ch2, ixd2, ch3, dqScanner, dqCamTrigger, dqCamTriggerMonitor, dqLightBulb] = Init_DAQ(LineTime, SampleRate)

daqreset;

d = daqlist;

d{1, "DeviceInfo"}

dqScanner = daq("ni") %#ok<*NOPRT>
dqCamTrigger = daq("ni")
dqCamTriggerMonitor = daq("ni");
dqLightBulb = daq("ni");


[ch1, ixd1] = addoutput(dqScanner, "Dev2", "ao0", "Voltage");
[ch2, ixd2] = addoutput(dqScanner, "Dev2", "ao1", "Voltage");
ch3 = addoutput(dqScanner, "Dev2", "ctr1", "PulseGeneration");  %PFI13/P2.5 (cam)

%ch5 = addoutput(dqScanner, "Dev2", "ctr3", "PulseGeneration");
%%PFI13/P2.5 (rotation mount) only configure this in the rotation function,
%%since this trigger shouldnt be configured in live mode (otherwise, the
%%rotation mount will move after every x images).
%addclock(dqScanner,"ScanClock","PXI1Slot2/ao0","PXI1Slot2/ctr0")

%Cam Trigger Settings
dqScanner.Rate = SampleRate*1000;

%ch4 = addoutput(dqLightBulb, "Dev2", "ctr2", "PulseGeneration"); %PFI14
%addclock(dqScanner,"ScanClock","PXI1Slot2/ao0","PXI1Slot2/ctr0")

%Cam Trigger Settings
dqScanner.Rate = SampleRate*1000;

%Lightbulb
%ch4.Frequency = 0.01;
%ch4.DutyCycle = 0.99;

%Rotation Mount
ch4.Frequency = 0.5;
ch4.DutyCycle = 0.1;









%ch3.Frequency = 1/((296)/1000);   %0.3 ms is the delay that is necessary to synchronize CamTrigger and Galvo Signal. 10 ms Line Time = 100 Hz (will be 103 Hz)
ch3.DutyCycle = 0.25;
%ch4.DutyCycle = 0.25;
%ch3.InitialDelay = 0.135;  %Delay to synchronize Scanner and CamTrigger [s]



end