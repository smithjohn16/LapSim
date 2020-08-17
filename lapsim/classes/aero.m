classdef aero < handle
    properties
        % Inputs
        battery_data_analysis
        velocity
        cl_profile
        cd_profile
        cop_profile
        
        % Internal variables
        air_density
        Af
        Cr
        Al
        roh;
        area;
                
        % Outputs
        drag_force;
        lift_front_force;
        lift_rear_force;
    end
    
    methods
        function obj = aero(aero_values)
            obj.cl_profile = aero_values(1);
            obj.cd_profile = aero_values(2);
            obj.roh = aero_values(3);           % Air density kg/m^3
            obj.area = aero_values(4);          % m^2
        end
        
        function aero_calc(self, velocity)
            % Lift is 70% forward at 4.5 m/s, lift is 37% forward at 22 m/s
            self.COP = -.0189 * velocity + .785;
            
            % Lift force and balance based on speed
            self.lift_force = self.cl_profile * self.roh * .5 * self.area * velocity ^ 2;
            self.lift_front_force = self.lift_force * self.COP;
            self.lift_rear_force = self.lift_force * (1 - self.COP);
            
            % Drag force based on speed
            self.drag_force = self.cd_profile * self.roh * .5 * self.area * velocity ^ 2;
        end
    end
end

