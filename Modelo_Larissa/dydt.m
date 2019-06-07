function ydot = dydt(t,y)
% initialize ydot array
 global k m Gap Force
 ydot = zeros(4,1);
%
 F1=k(1)*(y(1)-Gap(1));
 if Gap(1)~=0 && y(1)<=Gap(1)
   F1=0;
 end 
 F2=k(2)*(y(3)-y(1)-Gap(2));
 if Gap(2)~=0 && y(3)<=Gap(2)
   F2=0;
 end 
 ydot(1)=y(2);
 ydot(3)=y(4);
 %
 ydot(2)=1/m(1)*(-F1+F2); 
 ydot(4)=-F2/m(2);
end