classdef Corpo
    properties
        massa
        mom_inercia
        x
        y
        theta
        y_ponto
        x_ponto
        theta_ponto
        quad_vel_lin
        quad_vel_ang
    end

    methods
        function obj = Corpo(massa, mom_inercia, x, y, theta, t)

            obj.massa = massa;
            obj.mom_inercia = mom_inercia;

            obj.x = x;
            obj.y = y;
            obj.theta = theta;

            obj.x_ponto = diff(x, t);
            obj.y_ponto = diff(y, t);
            obj.theta_ponto = diff(theta, t);

            obj.quad_vel_lin = obj.x_ponto.^2 + obj.y_ponto.^2;
            obj.quad_vel_ang = obj.theta_ponto.^2;
        end
    end
    methods(Static)
        function K = cinetica(self)
        % CINETICA Calcula a energia cinética do corpo
        %
        % K = Corpo.cinetica()
        %
            K = (self.massa*self.quad_vel_lin)/2 + ...
                (self.mom_inercia*self.quad_vel_ang)/2;
        end

        function U = potencial(self, a_x, a_y)
            U = self.massa*(a_x*self.x + a_y*self.y);
        end

        function out = show(self)
            out = [self.massa, self.quad_vel_lin, ...
                   self.mom_inercia, self.quad_vel_ang];
        end
    end
end