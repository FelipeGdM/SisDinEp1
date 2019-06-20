close all; 
clear all; 
clc;

%% Constantes

m_i = 5.5;
m_c = 6.1;
J_c = 0.3;
m_t = 44.5;
J_t = 1.5;
L_t = 0.35;
L_p = 0.5;
k_ab = 104;
c_ab = 50.4;
k_p = 20200;
c_p = 266;
k_rp = 915;
c_rp = 34;
k_s = 1815;
c_s = 568;
k_b = 0;
c_b = 0;
k_ri = 200;
c_ri = 724;
k_i = 1815;
c_i = 200;
a = 90;
g = 9.8;


%% Equa��o

%dYdt = Equations_4(t,Y,m_i,m_c,J_c,m_t,J_t,L_t,L_p,k_ab,c_ab,k_p,c_p,k_rp,c_rp,k_s,c_s,k_b,c_b,k_ri,c_ri,k_i,c_i,a,g)

tspan = 0:0.05:2;
%options = odeset('RelTol',1e-5); 
Y0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
% x_i: Y(1) Y(2)
% x_t: Y(3) Y(4)
% theta_t: Y(5) Y(6)
% x_c: Y(7) Y(8)
% y_c: Y(9) Y(10)
% theta_c: Y(11) Y(12)

sistema = @(t,Y)[(Y(2));
          ((1/m_i)*(m_i*a - c_i*Y(2) - k_i*Y(1)));
          (Y(4));
          ((1/m_t)*(m_t*a - (c_s + c_ab)*Y(4) - (k_s + k_ab)*Y(3) - k_p*(Y(7) - Y(3) + (L_p - L_t)*sin(Y(5)) ) ));
          (Y(6));
          ((1/J_t)*( -k_ri*Y(5) - k_rp*(Y(5) - Y(11)) - k_p*(Y(7) + Y(9) - Y(3) + (L_p - L_t)*(cos(Y(5))+ sin(Y(5)))) - c_ri*Y(6) -  c_rp*(Y(6) - Y(12))));
          (Y(8));
          ((1/m_c)*(m_c*a -  k_p*(Y(7)- Y(3) + (L_p - L_t)*(sin(Y(5)))) - k_ab*(Y(7)- Y(3)) - c_ab*(Y(8))));
          (Y(10));
          ((1/m_c)*(- k_p*(Y(9) - (L_p - L_t)*(cos(Y(5))))- c_ab*(Y(10)) - m_c*g));
          (Y(12));
          ((1/J_c)*(-k_rp*(Y(11) - Y(5)) - c_ri*(Y(12) - Y(6))))];

[t, Y] = ode45(sistema, tspan, [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]);

figure(1)
plot(t, Y)
grid on
str = {'$$ x_i (m) $$','$$ \dot{x_i} (m/s) $$','$$ x_t (m) $$','$$ \dot{x_t} (m/s) $$', '$$ \theta _t (rad) $$', '$$ \dot{\theta _t} (rad/s) $$','$$ x_c (m) $$','$$ \dot{x_c} (m/s) $$','$$ y_c (m) $$','$$ \dot{y_c} (m/s) $$', '$$ \theta _c (rad) $$', '$$ \dot{\theta _c} (rad/s) $$'};
legend(str, 'Interpreter','latex', 'Location','NW');
title('An�lise do movimento do dummy em uma colis�o');
