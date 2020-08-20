%%%% run_sim.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script parses the configuration file,         %
% sets up classes, and runs the lap simulator with   %
% the GUI                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
current_rev = 1.0;                                                                          % This number must match the configuration file's revision number
max_time = 5;                                                                               % Maximum track time in minutes
%[ae, bat, co, dlne, dr, h, l, mo, sen, tc, ti, v] = load_cfg('init_cfg.csv', current_rev);  % Read the config file and return constructed classes
tk = trk('accel_track.csv');                                                                % Load the requested track

for time = 0:0.1:max_time * 60                                                              % Start looping through the sim

end