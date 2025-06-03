% Limpieza de pantalla
clear all
close all
clc

% Calculamos las matrices de transformación homogénea
H0 = SE3(rotz(-pi/2), [0 0 0]);
H1 = SE3(rotx(pi/2), [0 0 1]);
H2 = SE3(roty(0), [1 0 0]);
H3 = SE3(rotx(0), [1 0 0]);

H0_1 = H0 * H1;
H1_2 = H0_1 * H2;
H2_3 = H1_2 * H3; % Matriz de transformación homogénea global de 3 a 0

% Extraer las posiciones de los orígenes de cada sistema
origins = zeros(3,4);

origins(:,1) = H0.t;    % Origen sistema 0
origins(:,2) = H0_1.t;  % Origen sistema 1
origins(:,3) = H1_2.t;  % Origen sistema 2
origins(:,4) = H2_3.t;  % Origen sistema 3

% Mostrar coordenadas de los orígenes
disp('Posiciones de los orígenes de cada sistema (x,y,z):');
disp(origins');

% Graficamos la estructura de translación y rotación (tu gráfico original)
x = [0 0 0 0  0];
y = [0 0 -1 -2 -3];
z = [0 1 1 1 1];

plot3(x, y, z, 'LineWidth', 1.5); axis([-4 4 -4 6 -1 2]); grid on;
hold on;

% Graficamos los puntos de los orígenes de cada sistema
plot3(origins(1,:), origins(2,:), origins(3,:), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

% Graficamos la trama absoluta o global 
trplot(H0, 'rgb', 'axis', [-1 4 -1 6 -1 2])

pause;
tranimate(H0, H0_1, 'rgb', 'axis', [-1 4 -1 6 -1 2])

pause;
tranimate(H0_1, H1_2, 'rgb', 'axis', [-1 4 -1 6 -1 2])

pause;
tranimate(H1_2, H2_3, 'rgb', 'axis', [-1 4 -1 6 -1 2])
disp(H2_3)




