close all; 
%clear all; 
clc;
%global k m J c

%% Constantes:

t = sym("t", "positive");

% Propriedades da cabeça
syms m_c J_c positive;
syms x_c(t);
syms y_c(t);
syms theta_c(t);

% Propriedades do torço
syms m_t J_t L_t positive;
syms x_t(t);
syms y_t(t);
syms theta_t(t);
syms L_t real;

% Propriedades dos membros inferiores
syms x_i(t);
syms m_i positive;

% Interação air bag-cabeça;
syms k_ab c_ab positive;

% Propriedades do pescoço;
% Deformação do pescoço;
syms x_p(t);
% Mola linear;
syms k_p c_p positive;
% Mola de torção;
syms k_rp c_rp positive;

% Propriedades do cinto de segurança;
syms k_s c_s positive;

% Propriedades do braço;
syms k_b c_b positive;

% Interação air_bag-torso;
syms k_ab c_ab positive;

% Ligamento torço-membros inferiores;
syms k_ri c_ri positive;

% Interações de amortecimento dos membros inferiores;
syms k_i c_i positive;

% Desaceleração do carro;
a = sym("a", "real");

g = sym("g", "positive");

A = Corpo(m_c, J_c, x_c(t), y_c(t), theta_c(t));

%% Partes do modelo
Corpos = [Corpo(m_c, J_c, x_c, y_c, theta_c),
          Corpo(m_t, J_t, L_t*sin(theta_t) + x_i, cos(theta_t)*L_t, theta_t),
          Corpo(m_i, 0, x_i, 0, 0)];
