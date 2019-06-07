clear all
close all
clc

filename = 'Response.dat';
delimiterIn = ' ';
A = importdata(filename,delimiterIn);

length=size(A);

figure(1)
h = animatedline;
t=A(:,1);
y1=A(:,2);
y2=A(:,3);
% a parte a seguir foi uma tentativa frustrada de plotar o gráfico da
% resposta em cada instante em paraleo com a aninação :(
%curve=animatedline;
%set(gca,'Xlim',[0 100],'Ylim',[-5 5]);
% for ii=1:length
%  addpoints(curve,t(ii),y1(ii));
%  pause(0.001)
% end

figure(2)
for ii=1:length
  pX1=-A(ii,2);
  pX2=-A(ii,3);

  X_1=[pX1+5-1 pX1+5+1; pX1+5-1 pX1+5+1];
  Y_1=[2 2; 0 0];
  Z_1=[4 4; 4 4];


  X_2=[pX2+15-1 pX2+15+1; pX2+15-1 pX2+15+1];
  Y_2=[2 2; 0 0];
  Z_2=[14 14; 14 14];

  X_3=[0 1; 0 1];
  Y_3=[2 2; 0 0];
  Z_3=[0 0; 0 0];

  plot3([0 pX1+5],[1 1],[1 1]);
  hold all
  plot3([pX1+5 pX2+15],[1 1],[1 1]);
  surface(X_3,Y_3,Z_3);
  surface(X_1,Y_1,Z_1);
  surface(X_2,Y_2,Z_2);
  axis([0 30 0 5 0 15]);
  az = 0;
  el = 90;
  view(az, el);
%   set(gca,'XTick',[],'XTickLabel',[])
%   set(gca,'YTick',[],'YTickLabel',[])
  set(gca,'Visible','off')
%
% Store the frame
  M(ii)=getframe(gcf); % leaving gcf out crops the frame in the movie.
  hold off
 end
 movie2avi(M,'WaveMovie.avi');