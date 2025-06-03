%Limpieza de pantalla
clear all
close all
clc

%Calculamos las matrices de transformación homogénea
%H0=SE3;                             %Matriz identidad
H0=SE3((rotz(pi/2)*roty(pi)),[0 0 1]); %posición 1 y 2
H1=SE3(rotx(0), [1 0 1]);
H2=SE3((rotx(-pi/2)*roty(pi/2)), [0 0 0]);
H3=SE3((roty(-pi/2)*rotz(-pi/2)),[0 0 0]);
H4=SE3(rotx(0), [1 0 1]);

H5=SE3(rotz(pi/2),[0 0 0]);
H6=SE3((rotz(pi/2)*rotx(pi/2)),[0 0 0]);
H7=SE3(rotz(0),[0 0 1]);

H0_1= H0*H1;
H1_2= H0_1*H2;
H2_3= H1_2*H3; %Matriz de transformación homogenea global de 3 a 0 
H3_4 = H2_3 * H4;
H4_5 = H3_4 * H5;
H5_6 = H4_5 * H6;
H6_7 = H5_6 * H7;

%Coordenadas de la estructura de translación y rotación
x=[0 0 -1 -1 ];
y=[0 -1 -1 -2 ];
z=[1 -0 -1 -1 ];

plot3(x, y, z,'LineWidth', 1.5); axis([-4 4 -4 6 -4 2]); grid on;
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

pause;
tranimate(H3_4, H4_5,'rgb','axis', [-1 4 -1 6 -1 2])
disp(H4_5)

pause;
tranimate(H4_5, H5_6,'rgb','axis', [-1 4 -1 6 -1 2])
disp(H5_6)

pause;
tranimate(H5_6, H6_7,'rgb','axis', [-1 4 -1 6 -1 2])
disp(H6_7) 
    






% Extraer las posiciones de los orígenes de cada sistema
origins = zeros(3,8); % Para 8 matrices (H0 a H6_7)

% La base H0, que es la identidad o referencia inicial
origins(:,1) = H0.t;          % t es el vector de traslación de SE3

% Las demás transformaciones compuestas (globales)
origins(:,2) = H0_1.t;        % Origen del sistema 1
origins(:,3) = H1_2.t;        % Origen del sistema 2
origins(:,4) = H2_3.t;        % Origen del sistema 3
origins(:,5) = H3_4.t;        % Origen del sistema 4
origins(:,6) = H4_5.t;        % Origen del sistema 5
origins(:,7) = H5_6.t;        % Origen del sistema 6
origins(:,8) = H6_7.t;        % Origen del sistema 7

% Mostrar coordenadas de los orígenes
disp('Posiciones de los orígenes de cada sistema (x,y,z):');
disp(origins');

% Opcional: graficar puntos para los orígenes
hold on
plot3(origins(1,:), origins(2,:), origins(3,:), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k')
