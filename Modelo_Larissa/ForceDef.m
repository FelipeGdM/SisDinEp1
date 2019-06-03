function status = ForceDef(t,y,flag)
% 'OutputFnc' is an option in ODE45 and it has a closed format:
% input variables: time(t), output of ODE45(y), and state information (flag) 
% = 'init' in the first step (initialization state), 
% = 'done' in the last step (final state), 
% = [ ] in all other steps)

%Here, the 'OutputFnc' is used to calculate plastic deformation of the springs
%and store it in the variable yy
 global k Gap Force
 switch(flag) %flag — Current status of the algorithm
   case 'init'   % 'init' — Initialization state
     fprintf('start\n');
     Force = [0, 0, 0];
   case 'done'   % 'done' — Final state
     fprintf('done\n');
   case ''    % [] - empty flag
     F1=k(1)*(y(1)-Gap(1));
     if Gap(1)~=0 && y(1)<=Gap(1)
      F1=0;
     end 
     F2=k(2)*(y(3)-y(1)-Gap(2));
     if Gap(2)~=0 && y(3)<=Gap(2)
       F2=0;
     end
     Force=[Force; [t(end), F1, F2]];
     status = 0;
 end
 end
