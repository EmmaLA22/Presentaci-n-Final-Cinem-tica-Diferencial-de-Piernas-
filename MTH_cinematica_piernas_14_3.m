%Limpieza de pantalla
clear all
close all
clc

%Calculamos las matrices de transformación homogénea
%H0=SE3;                             %Matriz identidad
H0=SE3((rotz(pi)*roty(pi/2)*rotx(-pi)*rotx(pi)),[0 0 2]); %posición 1 y 2
H1=SE3(rotx(-pi/2), [0 0 0]);
H2=SE3((rotx(0)), [2 0 0]);
H3=SE3(rotz(-pi/2),[1 0 0]);
H4=SE3(rotx(pi/2), [0 0 0]);

H0_1= H0*H1;
H1_2= H0_1*H2;
H2_3= H1_2*H3; %Matriz de transformación homogenea global de 3 a 0 
H3_4 = H2_3 * H4;


%Coordenadas de la estructura de translación y rotación
x=[0 0 0];
y=[0 0 0];
z=[-2 -1 2];

plot3(x, y, z,'LineWidth', 1.5); axis([-1 4 -1 6 -1 2]); grid on;
hold on;

%Graficamos la trama absoluta o global 
trplot(H0,'rgb','axis', [-1 4 -1 6 -1 2])
% 
% %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H0, H0_1,'rgb','axis', [-1 4 -1 6 -1 2])
% %Realizamos una animación para la siguiente trama
 pause;
 tranimate(H0_1, H1_2,'rgb','axis', [-1 4 -1 6 -1 2])
% % %Realizamos una animación para la siguiente trama
 pause;           
  tranimate(H1_2, H2_3,'rgb','axis', [-1 4 -1 6 -1 2])
  disp(H2_3)

pause;
tranimate(H2_3, H3_4,'rgb','axis', [-1 4 -1 6 -1 2])
disp(H3_4)