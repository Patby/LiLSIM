function [SX, SY, SZ] = Init_Stages()

SZ = ThorlabsZZStage();
SY = ThorlabsZStage();
SX = ThorlabsZStage1();



%serialNumbers = SX.List_Devices();
SX.Home();
SY.Home();
SZ.Home();

end