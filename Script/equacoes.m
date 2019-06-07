function xp = x(t,x)
% initialize ydot array
 global m J k c a_carro
 xp = zeros(12,1);
 
 F1 = m(1)*a_carro;
 F2 = m(2)*a_carro;
 F3 = m(3)*a_carro;
 
 t_impacto = 0.3;
 
 if t > 0 && t < t_impacto 
     F1 = 0;
     F2 = 0;
     F3 = 0;

%definindo os estados
 %x(1) : x.inferior
 %x(2) : vel.inferior
 %x(3) : x.tronco
 %x(4) : vel.tronco
 %x(5) : thetha.tronco
 %x(6) : vel.ang.tronco
 %x(7) : x.cabeça
 %x(8) : vel.cabeça
 %x(9) : y.cabeça
 %x(10) : vel.y.cabeça
 %x(11) : thetha.cabeça
 %x(12) : vel.ang.cabeça
 %
 
 xp(1)=x(2);
 xp(2)=(1/m(1))*(F1 - c(1)*x(2) - k(1)*x(1));
 %
 xp(3)=x(4);
 xp(4)=(1/m(2))*(F2);
 %
 xp(5)=x(6);
 xp(6)=(1/J(1));
 %
 xp(7)=x(8);
 xp(8)=(1/m(3));
 %
 xp(9)=x(10);
 xp(10)=(1/m(3));
 %
 xp(11)=x(12);
 xp(12)=(1/J(2));
 %
 
 
end