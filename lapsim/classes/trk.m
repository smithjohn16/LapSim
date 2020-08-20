classdef trk < handle
    properties
        track_map
        laps
    end
    
    methods
        function obj = trk(trackname)
            % Loads requested track and precomputes straights
            trk_load = csvread(trackname, 2, 0);   % Read the track file
            % TODO: Preprocessing of track coordinates
            obj.track_map = trk_load;
        end
    end
end

