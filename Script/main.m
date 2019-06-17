close all; 
%clear all; 
clc;
%global k m J c

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

tspan = [0 5];
options = odeset('RelTol',1e-5,'AbsTol',1e-10); 
Yi = [0 0 0 0 0 0 0 0];
Sol = ode45(@(t,Y) Equations_4(t,Y,m_i,m_c,J_c,m_t,J_t,L_t,L_p,k_ab,c_ab,k_p,c_p,k_rp,c_rp,k_s,c_s,k_b,c_b,k_ri,c_ri,k_i,c_i,a,g), tspan, Yi, options);

             
             
             
             
             
             
             
             
             