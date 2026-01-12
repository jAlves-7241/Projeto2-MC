% Script utilizado para gerar o colormap do problema 2d)
clc, clearvars, clf

vanDerPol = @(t, y) [y(2); 4.*(1-y(1).^2).*y(2) - y(1)];

[l, pontos] = compritraj(vanDerPol, [-3,3], [-8,8], 0, 4, 100);


%% Colormap
numGrid = sqrt(length(l)); % Dá 101, em princípio

% Reorganizar em matrizes quadradas para mesh 
% (reverte a operação feita no início de compritraj.m)
X = reshape(pontos(:,1), numGrid, numGrid);
Y = reshape(pontos(:,2), numGrid, numGrid);
Z = reshape(l, numGrid, numGrid);

mesh(X, Y, Z);

shading interp; % Suaviza as cores consoante a altura
colormap jet; colorbar;

title('Distância percorrida em função das condições iniciais');
xlabel('x_0 (m)'), ylabel("x'_0 (m/s)"), zlabel('d (m)'),