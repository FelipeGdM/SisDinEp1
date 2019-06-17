classdef Mola
    properties
        k
        c
        q
        q_ponto
    end

    methods
        function obj = Mola(k, c, q, dq)
            obj.k = k;
            obj.c = c;
            obj.q = q;
            obj.q_ponto = dq; 
        end
    end
    
    methods(Static)
        function U = potencial(self)
            U = (self.k*self.q.^2)/2;
        end

        function D = dissipador(self)
            D = (self.c*self.q_ponto.^2)/2;
        end
    end
end