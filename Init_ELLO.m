function ELLO = Init_ELLO()

% 143360 counts / rev 
MinStep = 360/143360;

NET.addAssembly('C:\Program Files\Thorlabs\Elliptec\Thorlabs.Elliptec.ELLO_DLL.dll');

ELLO = serialport('COM6', 9600);

disp("Rotation mount init sucessful!");
 
% 
% %get device data 
% motorinfo1 = query(s, '0i1');
% motorinfo2 = query(s, '0i2');
% 
% %Frequencies of motor 1
% ForwardFreq1 = round(14740000/hex2dec(motorinfo1(18:21)), 0);
% BackwardFreq1 = round(14740000/hex2dec(motorinfo1(22:25)), 0);
% 
% %Frequencies of motor 2
% ForwardFreq2 = round(14740000/hex2dec(motorinfo2(18:21)), 0);
% BackwardFreq2 = round(14740000/hex2dec(motorinfo2(22:25)), 0);
% 
% % read jogstepsize
% tempvar = query(s,'0gj');
% tempvar = (tempvar(4:13));
% GetJogStepSize = hex2dec(tempvar)*MinStep;
% clear tempvar

%home stage
% query(s, '0ho1');

%set jogstepsize to x deg 
% JogSize = 5; %JogStep in degrees [make variable for that] %%%%%%%%%%%%%%%%%%%
% if JogSize <= 360
% tempvar = round(JogSize/MinStep, 0);
% tempvar = dec2hex(tempvar, 4);
% tempvar = append('0sj0000', num2str(tempvar));  %makes variable to set jogstepsize to specific amount
% else
% disp('JogSize too big..');
% end
% 
% query(s,tempvar); % the hexadezimal number corresponds to 23893 device units (1 DU = 0.0251119°);
% %specced in Thorlabs manual: 143360 counts / rev --> 0.00251116° / count
% 
% clear tempvar


%jog (for SIM script)
% query(s, '0fw');
% pause(1)
% query(s, '0fw');
% pause(1);
% query(s, '0fw');
% pause(1);
% query(s, '0ho1');

% Optimize motors

% query(s, '0s1');
% query(s, '0s2');


end