%% CASE 1: m3=0;C1=0

close all; clear all; clc
global k m Gap Nmass Nspring Force

%% Dados de entrada
Nmass=2;   % # de massas --- NÃO MODIFICAR ---
Nspring=2; % # de molas  --- NÃO MODIFICAR ---
k=[100; 200]; % Rigidez [N/m]
m=[10;20];   % Massa [Kg]
Gap=[0.5; 0];  % Gap [m]
%
Deltas=[40; 40];  % Comprimento de trabalho. NÃO CONSIDERADO NESSE PROGRAMA. [m]

% Condições iniciais (i.c.)
Y0=[0;0]; % initial displacement [m]
V0=[0;5]; % initial velocity [m/s]

%Organizando vetor de i.c. para ODE45
y0=[Y0(1);V0(1)];
for Index=2:Nmass
 y0= [ y0 ; Y0(Index); V0(Index)];
end 

% Tempo de simulação do problema
%tspan = 0:0.001:10; % intervalo de tempo [s]
tspan = [0 5];
%% Solução do problema
options = odeset('OutputFcn',@ForceDef);
[T,Y] = ode45(@dydt,tspan,y0,options);

%% Plot resultados
figure(1)
plot(T, [Y Y(:,3)-Y(:,1)])
grid
str = {'$$ x_1 $$','$$ \dot{x}_1 $$', '$$ x_2 $$', '$$ \dot{x}_2 $$','$$ x_2-x_1 $$'};
h=legend(str, 'Interpreter','latex', 'Location', 'best');
set(h,'FontSize',12); 
xlabel('Time [s]')
ylabel('Response')

figure(2)
plot(Force(:,1),Force(:,2)) 
hold on
plot(Force(:,1), Force(:,3)) 
grid
str = {'$$ F_1 $$','$$ F_2 $$'};
h=legend(str, 'Interpreter','latex', 'Location', 'best');
set(h,'FontSize',12); 
xlabel('Time [s]')
ylabel('Force [N]')

%% Armazenamento da resposta
ftime = fopen('Response.dat','wt');
for ii = 1:size(T)
    fprintf(ftime,'%g %g %g \t',T(ii),Y(ii,1),Y(ii,3));
    fprintf(ftime,'\n');
    
end
fclose(ftime)

