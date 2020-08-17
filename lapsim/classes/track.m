classdef track < handle
    properties
        track_map
        laps
    end
    
    methods
        function obj = track(trackname)
            % Loads requested track and precomputes straights
            track = csvread(trackname, 2, 0);   % Read the track file
            obj.track_map = track;
        end
    end
end

