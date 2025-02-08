classdef GUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        SIMCheckBox                matlab.ui.control.CheckBox
        PhasesDropDown             matlab.ui.control.DropDown
        PhasesDropDownLabel        matlab.ui.control.Label
        SIMLabel                   matlab.ui.control.Label
        RecordSIMageButton         matlab.ui.control.Button
        RecordZStackButton         matlab.ui.control.Button
        FramesEditField            matlab.ui.control.NumericEditField
        FramesEditFieldLabel       matlab.ui.control.Label
        ZStepnmEditField           matlab.ui.control.NumericEditField
        ZStepnmEditFieldLabel      matlab.ui.control.Label
        ZStacksLabel               matlab.ui.control.Label
        RecordImageButton          matlab.ui.control.Button
        StepDropDown               matlab.ui.control.DropDown
        StepDropDownLabel          matlab.ui.control.Label
        ButtonGroup                matlab.ui.container.ButtonGroup
        Button_2                   matlab.ui.control.ToggleButton
        Button                     matlab.ui.control.ToggleButton
        MoveStageLabel             matlab.ui.control.Label
        FOVmDropDown               matlab.ui.control.DropDown
        FOVmDropDownLabel          matlab.ui.control.Label
        ObjectiveDropDown          matlab.ui.control.DropDown
        ObjectiveDropDownLabel     matlab.ui.control.Label
        AveragingDropDown          matlab.ui.control.DropDown
        AveragingDropDownLabel     matlab.ui.control.Label
        ScanStepXnmEditField       matlab.ui.control.NumericEditField
        ScanStepXnmEditFieldLabel  matlab.ui.control.Label
        ScanStepYnmEditField       matlab.ui.control.NumericEditField
        ScanStepYnmEditFieldLabel  matlab.ui.control.Label
        LinetimemsEditField        matlab.ui.control.NumericEditField
        LinetimemsEditFieldLabel   matlab.ui.control.Label
        ImageparametersLabel       matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

    % Load default values

setappdata(0, 'fScan', 20);

  

  % Value changed function: ObjectiveDropDown
        function ObjectiveSelect(app, event)
            Objective = app.ObjectiveDropDown.Value;
            if value == '20x'
            Magn = 20; 
            fObj = fDet/Magn;
            MagnObjTL = fTube/fObj;
            SamplePixelSize = DetPixelSize/MagnObjTL;
            FOV = XScanLens/MagnObjTL*2*1000;
setappdata(0, 'fScan', 50);
            elseif value == '40x'


            elseif value == '60x'


            elseif value == '100x'



            end
        end
   




        % Create UIFigure and components
        function createComponents(app)


       

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';


             % Create ObjectiveDropDownLabel
            app.ObjectiveDropDownLabel = uilabel(app.UIFigure);
            app.ObjectiveDropDownLabel.HorizontalAlignment = 'right';
            app.ObjectiveDropDownLabel.Position = [62 421 56 22];
            app.ObjectiveDropDownLabel.Text = 'Objective';

            % Create ObjectiveDropDown
            app.ObjectiveDropDown = uidropdown(app.UIFigure);
            app.ObjectiveDropDown.Items = {'20x', '40x', '60x', '100x'};
            app.ObjectiveDropDown.Position = [133 421 100 22];
            app.ObjectiveDropDown.Value = '20x';





            % Create ImageparametersLabel
            app.ImageparametersLabel = uilabel(app.UIFigure);
            app.ImageparametersLabel.FontWeight = 'bold';
            app.ImageparametersLabel.Position = [20 432 177 67];
            app.ImageparametersLabel.Text = 'Image parameters';

            % Create LinetimemsEditFieldLabel
            app.LinetimemsEditFieldLabel = uilabel(app.UIFigure);
            app.LinetimemsEditFieldLabel.HorizontalAlignment = 'right';
            app.LinetimemsEditFieldLabel.Position = [38 392 80 22];
            app.LinetimemsEditFieldLabel.Text = 'Line time [ms]';

            % Create LinetimemsEditField
            app.LinetimemsEditField = uieditfield(app.UIFigure, 'numeric');
            app.LinetimemsEditField.Position = [133 392 100 22];

            % Create ScanStepYnmEditFieldLabel
            app.ScanStepYnmEditFieldLabel = uilabel(app.UIFigure);
            app.ScanStepYnmEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanStepYnmEditFieldLabel.Position = [20 334 99 22];
            app.ScanStepYnmEditFieldLabel.Text = 'Scan Step Y [nm]';

            % Create ScanStepYnmEditField
            app.ScanStepYnmEditField = uieditfield(app.UIFigure, 'numeric');
            app.ScanStepYnmEditField.Position = [134 334 100 22];

            % Create ScanStepXnmEditFieldLabel
            app.ScanStepXnmEditFieldLabel = uilabel(app.UIFigure);
            app.ScanStepXnmEditFieldLabel.HorizontalAlignment = 'right';
            app.ScanStepXnmEditFieldLabel.Position = [20 363 98 22];
            app.ScanStepXnmEditFieldLabel.Text = 'Scan Step X [nm]';

            % Create ScanStepXnmEditField
            app.ScanStepXnmEditField = uieditfield(app.UIFigure, 'numeric');
            app.ScanStepXnmEditField.Position = [133 363 100 22];

            % Create AveragingDropDownLabel
            app.AveragingDropDownLabel = uilabel(app.UIFigure);
            app.AveragingDropDownLabel.HorizontalAlignment = 'right';
            app.AveragingDropDownLabel.Position = [60 303 59 22];
            app.AveragingDropDownLabel.Text = 'Averaging';

            % Create AveragingDropDown
            app.AveragingDropDown = uidropdown(app.UIFigure);
            app.AveragingDropDown.Items = {'1x', '8x', '16x'};
            app.AveragingDropDown.Position = [134 303 100 22];
            app.AveragingDropDown.Value = '1x';


            % Create FOVmDropDownLabel
            app.FOVmDropDownLabel = uilabel(app.UIFigure);
            app.FOVmDropDownLabel.HorizontalAlignment = 'right';
            app.FOVmDropDownLabel.Position = [65 273 55 22];
            app.FOVmDropDownLabel.Text = 'FOV [µm]';

            % Create FOVmDropDown
            app.FOVmDropDown = uidropdown(app.UIFigure);
            app.FOVmDropDown.Items = {'20x20', '40x40', '60x60', '100x100'};
            app.FOVmDropDown.Position = [135 273 100 22];
            app.FOVmDropDown.Value = '20x20';

            % Create MoveStageLabel
            app.MoveStageLabel = uilabel(app.UIFigure);
            app.MoveStageLabel.FontWeight = 'bold';
            app.MoveStageLabel.Position = [20 220 177 67];
            app.MoveStageLabel.Text = 'Move Stage';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.UIFigure);
            app.ButtonGroup.BorderType = 'none';
            app.ButtonGroup.Position = [234 205 100 36];

            % Create Button
            app.Button = uitogglebutton(app.ButtonGroup);
            app.Button.Text = '+';
            app.Button.Position = [8 8 36 22];
            app.Button.Value = true;

            % Create Button_2
            app.Button_2 = uitogglebutton(app.ButtonGroup);
            app.Button_2.Text = '-';
            app.Button_2.Position = [52 8 36 22];

            % Create StepDropDownLabel
            app.StepDropDownLabel = uilabel(app.UIFigure);
            app.StepDropDownLabel.HorizontalAlignment = 'right';
            app.StepDropDownLabel.Position = [89 212 31 22];
            app.StepDropDownLabel.Text = 'Step';

            % Create StepDropDown
            app.StepDropDown = uidropdown(app.UIFigure);
            app.StepDropDown.Items = {'1 mm', '100 µm', '1 µm', '200 nm'};
            app.StepDropDown.Position = [135 212 100 22];
            app.StepDropDown.Value = '1 mm';

            % Create RecordImageButton
            app.RecordImageButton = uibutton(app.UIFigure, 'push');
            app.RecordImageButton.Position = [18 25 100 22];
            app.RecordImageButton.Text = 'Record Image';

            % Create ZStacksLabel
            app.ZStacksLabel = uilabel(app.UIFigure);
            app.ZStacksLabel.FontWeight = 'bold';
            app.ZStacksLabel.Position = [20 167 177 67];
            app.ZStacksLabel.Text = 'Z-Stacks';

            % Create ZStepnmEditFieldLabel
            app.ZStepnmEditFieldLabel = uilabel(app.UIFigure);
            app.ZStepnmEditFieldLabel.HorizontalAlignment = 'right';
            app.ZStepnmEditFieldLabel.Position = [49 167 69 22];
            app.ZStepnmEditFieldLabel.Text = 'Z-Step [nm]';

            % Create ZStepnmEditField
            app.ZStepnmEditField = uieditfield(app.UIFigure, 'numeric');
            app.ZStepnmEditField.Position = [133 167 100 22];

            % Create FramesEditFieldLabel
            app.FramesEditFieldLabel = uilabel(app.UIFigure);
            app.FramesEditFieldLabel.HorizontalAlignment = 'right';
            app.FramesEditFieldLabel.Position = [72 138 46 22];
            app.FramesEditFieldLabel.Text = 'Frames';

            % Create FramesEditField
            app.FramesEditField = uieditfield(app.UIFigure, 'numeric');
            app.FramesEditField.Position = [133 138 100 22];

            % Create RecordZStackButton
            app.RecordZStackButton = uibutton(app.UIFigure, 'push');
            app.RecordZStackButton.Position = [135 25 100 22];
            app.RecordZStackButton.Text = 'Record Z-Stack';

            % Create RecordSIMageButton
            app.RecordSIMageButton = uibutton(app.UIFigure, 'push');
            app.RecordSIMageButton.Position = [253 25 100 22];
            app.RecordSIMageButton.Text = 'Record SIMage';

            % Create SIMLabel
            app.SIMLabel = uilabel(app.UIFigure);
            app.SIMLabel.FontWeight = 'bold';
            app.SIMLabel.Position = [20 93 177 67];
            app.SIMLabel.Text = 'SIM';

            % Create PhasesDropDownLabel
            app.PhasesDropDownLabel = uilabel(app.UIFigure);
            app.PhasesDropDownLabel.HorizontalAlignment = 'right';
            app.PhasesDropDownLabel.Position = [73 93 45 22];
            app.PhasesDropDownLabel.Text = 'Phases';

            % Create PhasesDropDown
            app.PhasesDropDown = uidropdown(app.UIFigure);
            app.PhasesDropDown.Items = {'3', '5'};
            app.PhasesDropDown.Position = [133 93 100 22];
            app.PhasesDropDown.Value = '3';

            % Create SIMCheckBox
            app.SIMCheckBox = uicheckbox(app.UIFigure);
            app.SIMCheckBox.Text = '2ω SIM ';
            app.SIMCheckBox.Position = [94 62 65 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end