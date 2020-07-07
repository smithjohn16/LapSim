function [ vehicle_state, velocity_track ] = state_selection( track_table, corner_count, section_distance, braking_distance, velocity, i, brake_started )

%This function outputs the state of the vehicle for the next iteration of
%the simulation loop

if braking_distance < 0
    braking_distance = 0;
    %account for slight overshoot
end

velocity_track = velocity(i);
remaining_distance = track_table(corner_count, 2) - section_distance; %remaining distance in section
[rows, ~] = size(track_table);

if section_distance > track_table(corner_count, 2)
    vehicle_state = 'finish';
elseif (track_table(corner_count, 2) == 0) && (rows == corner_count) %Every track ends with [0, 0, 0, 0] to signify track end
    vehicle_state = 'done';
elseif brake_started == 1
    vehicle_state = 'straight_brake';
elseif (track_table(corner_count + 1, 2) == 0) && (track_table(corner_count, 1) == 0) %last accel when past last corner
    vehicle_state = 'last_straight';
elseif (track_table(corner_count, 1) == 0) && (remaining_distance > braking_distance)
    vehicle_state = 'straight_accel';
elseif (remaining_distance <= (braking_distance))
    vehicle_state = 'straight_brake';
elseif (track_table(corner_count, 1) == 1) && (velocity(i) < floor(track_table(corner_count, 4)))
    vehicle_state = 'corner_accel';
elseif (track_table(corner_count, 1) == 1) && (round(velocity(i)) < (track_table(corner_count, 4) + 1)) && (round(velocity(i)) > (track_table(corner_count, 4) - 1)) %(floor(velocity(i)) == floor(track_table(corner_count, 4)))
    velocity_track = track_table(corner_count, 4);
    vehicle_state = 'corner_constant';
elseif (track_table(corner_count, 1) == 0) &&  (braking_distance == 0)
    vehicle_state = 'straight_accel';
else
    %this is the error case
    fprintf('\nTrack section: ')
    track_table(corner_count, :)
    fprintf('\n')
    fprintf('\nVelocity: %d\n', velocity(i))
    fprintf('\nSection distance: %d\n', remaining_distance)
    fprintf('\nCorner count: %d\n', corner_count)
    vehicle_state = 'error';
end %end if statement
end %end function
