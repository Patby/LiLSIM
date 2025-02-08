function figCloseAndStopScan(dqScanner, dqCamTrigger, hFig)
    % This callback function runs when the scan figure window closes.
    % The purpose of this function is to stop the acquisition gracefully
    % and to then close the figure window.
    fprintf('Shutting down DAQ connection and zeroing scanners\n')
    stop(dqCamTrigger);
    stop(dqScanner);
    % Zero the scanners so the beam is pointing down the middle of the objective.
    % This is useful for alignment. "Real" 2-photon software will usually attempt
    % to park the beam outside of the sample to remove the possibility of bleaching
    % or burning  the sample.
    flush(dqScanner);
    dqScanner.write([-4,-4]); %Queue zero volts on each channel
    delete(hFig) %close the figure
 

end %close figCloseAndStopScan