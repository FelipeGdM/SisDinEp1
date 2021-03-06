import sympy as sp
import numpy as np
from IPython.display import display

## Felipe Gomes

#display(yourobject)

sp.init_printing()

t = sp.Symbol("t", positive=True)

# Propriedades da cabeça
m_c, J_c = sp.symbols("m_c J_c", positive=True)
x_c = sp.Function("x_c", real=True)(t)
y_c = sp.Function("y_c", real=True)(t)
theta_c = sp.Function("theta_c", real=True)(t)

# Propriedades do torço
m_t, J_t, L_t = sp.symbols("m_t J_t L_t", positive=True)
x_t = sp.Function("x_t", real=True)(t)
y_t = sp.Function("y_t", real=True)(t)
theta_t = sp.Function("theta_t", real=True)(t)
L_t = sp.Symbol("L_t", real=True)
L_p = sp.Symbol("L_p",real=True)

# Propriedades dos membros inferiores
x_i = sp.Function("x_i", real=True)(t)
m_i = sp.Symbol("m_i", positive=True)

# Interação air bag-cabeça
k_ab, c_ab = sp.symbols("k_ab c_ab", positive=True)

# Propriedades do pescoço
## Deformação do pescoço
x_p = sp.Function("x_p", positive=True)(t)
## Mola linear
k_p, c_p = sp.symbols("k_p c_p", positive=True)
## Mola de torção
k_rp, c_rp = sp.symbols("k_rp c_rp", positive=True)

# Propriedades do cinto de segurança
k_s, c_s = sp.symbols("k_s c_s", positive=True)

# Propriedades do braço
k_b, c_b = sp.symbols("k_b c_b", positive=True)

# Interação air_bag-torso
k_ab, c_ab = sp.symbols("k_ab c_ab", positive=True)

# Ligamento torço-membros inferiores
k_ri, c_ri = sp.symbols("k_ri c_ri", positive=True)

# Interações de amortecimento dos membros inferiores
k_i, c_i = sp.symbols("k_i c_i", positive=True)

# Desaceleração do carro
a = sp.Symbol("a", real=True)

g = sp.Symbol("g", positive=True)

class Corpo():
    def __init__(self, massa, mom_inercia, x, y, theta):
        self.massa        = massa
        self.mom_inercia  = mom_inercia

        self.x = x
        self.y = y
        self.theta = theta

        try:
            self.y_ponto = y.diff(t)
        except:
            self.y_ponto = 0

        try:
            self.x_ponto = x.diff(t)
        except:
            self.x_ponto = 0

        try:
            self.theta_ponto = theta.diff(t)
        except:
            self.theta_ponto = 0

        self.quad_vel_lin = self.x_ponto**2+self.y_ponto**2
        self.quad_vel_ang = self.theta_ponto**2

    def cinetica(self):
        return (self.massa*self.quad_vel_lin)/2 \
                + (self.mom_inercia*self.quad_vel_ang)/2

    def potencial(self, a_x, a_y):
        return self.massa*(a_x*self.x + a_y*self.y)

    def show(self):
        return (self.massa, self.quad_vel_lin,
                self.mom_inercia, self.quad_vel_ang)


class Mola:
    def __init__(self, k, c, q):
        self.k = k
        self.c = c
        self.q = q

    def potencial(self):
        return (self.k*self.q**2)/2

    def dissipador(self):
        return (self.c*self.q.diff(t)**2)/2


## Diego Kurashima

class Lagrange():
    def __init__(self, T, V, D, var):
        self.L = T - V
        self.D = D
        self.var = var

        try:
            self.dvar = self.var.diff(t)
        except:
            self.dvar = 0

        try:
            self.ddvar = self.dvar.diff(t)
        except:
            self.ddvar = 0

    def equacao(self):
        dL1 = (self.L.diff(self.dvar)).diff(t)
        dL2 = self.L.diff(self.var)
        dD = self.D.diff(self.dvar)
        return dL1 - dL2 + dD

a = Lagrange(0, 0, 0, sp.cos(theta_t)*L_p + x_p*sp.cos(theta_c))
print(a.dvar)