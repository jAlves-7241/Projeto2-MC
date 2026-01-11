clc, clearvars

vanDerPol = @(t, y) [y(2); 4.*(1-y(1).^2).*y(2) - y(1)];

[c, pontos] = compritraj(vanDerPol, [-3,3], [-8,8], 0, 4, 100);

plot3(pontos(:,1), pontos(:,2), c)
title('Distância percorrida em função das condições iniciais')
xlabel('x_0 (m)'), ylabel("x'_0 (m/s)"), zlabel('d (m)')