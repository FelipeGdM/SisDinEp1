classdef Lagrange
    properties
        L
        D
        var
        dvar
        ddvar
        dL1
        dL2
        dD
    end

    methods (Static)
        function equ = equacao(T, V, D, var, t)           
            L = T - V;
            %self.D = D;
            %var = var;
            dvar = diff(var, t);
            %ddvar = diff(dvar, t);
            
            syms var_tmp dvar_tmp;
            dL1_tmp = diff( subs(L, dvar, dvar_tmp), dvar_tmp, t);
            dL1 = subs(dL1_tmp, dvar_tmp, dvar);
            
            dL2_tmp = diff( subs(L, var, var_tmp), var_tmp );
            dL2 = subs(dL2_tmp, var_tmp, var);
            
            dD_tmp = diff( subs(D, dvar, dvar_tmp), dvar_tmp );
            dD = subs(dD_tmp, dvar_tmp, dvar);
            
            equ = dL1 - dL2 + dD;
        end
    end
end