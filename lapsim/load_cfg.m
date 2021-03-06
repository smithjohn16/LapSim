function [ae, bat, co, dlne, dr, h, l, mo, sen, tc, ti, tk, v] = load_cfg(filename, rev)
%%%% load_cfg.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function loads the requested configuration    %
% file and returns each class with loaded values     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
values = readtable(filename);                       % Load the configuration file into Matlab
csv_rev = table2array(values(1,2));                 % Capture the csv revision
if rev ~= csv_rev                                   % Check the revision numbers
    fprintf("File revisions don't match!\n");       % Let the user know the config/sim is out of date
end
ae = aero(table2array(values(3:end, 2)));           % Convert aero values
bat = battery(table2array(values(3:end, 4)));       % Convert battery values
% co = cooling(table2array(values(3:end, 6)));        % Convert cooling values
% dlne = driveline(table2array(values(3:end, 8)));    % Convert driveline values
% dr = driver(table2array(values(3:end, 10)));        % Convert driver values
% h = hv(table2array(values(3:end, 12)));             % Convert HV values
% l = lv(table2array(values(3:end, 14)));             % Convert LV values
% mo = motor(table2array(values(3:end, 16)));         % Convert motor values
% sen = sensors(table2array(values(3:end, 18)));      % Convert sensor values
% tc = tctv(table2array(values(3:end, 20)));          % Convert TC/TV values
% ti = tires(table2array(values(3:end, 22)));         % Convert tire values
% tk = track(table2array(values(3:end, 24)));         % Convert track values
% v = vd(table2array(values(3:end, 26)));             % Convert vd values
