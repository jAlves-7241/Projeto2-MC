clc, clearvars

vanDerPol = @(t, y) [y(2); 4.*(1-y(1).^2).*y(2) - y(1)];

[l, pontos] = compritraj(vanDerPol, [-3,3], [-8,8], 0, 4, 100);

%% Gráfico

plot3(pontos(:,1), pontos(:,2), l)
