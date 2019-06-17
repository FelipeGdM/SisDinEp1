classdef Mola
    properties
        k
        c
        q
    end

    methods
        function obj = Mola(k, c, q)
            obj.k = k;
            obj.c = c;
            obj.q = q;
        end

        function U = potencial(self)
            U = (self.k*self.q.^2)/2;
        end

        function D = dissipador(self)
            D = (self.c*self.q.diff(t).^2)/2;
        end

    end
end