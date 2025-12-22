clc, clearvars

x0 = [1; 3];
tSpan = [0, 20];

vanDerPol = @(t, y) [y(2); 4*(1-y(1)^2)*y(2) - y(1)];

[t, sol] = ode45(vanDerPol, tSpan, x0);

plot(t, sol(:, 1))
hold on
plot(t, sol(:, 2))
legend('Posição - x(t)', "Velocidade - x'(t)", 'Location', 'best')
grid on