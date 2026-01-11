clc, clearvars

x0 = [2; 0];
tSpan = [0, 20];

vanDerPol = @(t, y) [y(2); 4*(1-y(1)^2)*y(2) - y(1)];

[t1, y1] = ode45(vanDerPol, tSpan, x0);

x0 = [1; 1];

[t2, y2] = ode45(vanDerPol, tSpan, x0);

subplot(1, 2, 1)
plot(y1(:, 1), y1(:, 2))
legend('x_0 = (2, 0)^T', 'Location', 'best')
title("Trajetória - (2, 0)^T")
xlabel("x(t)")
ylabel("x'(t)")

subplot(1, 2, 2)
plot(y2(:, 1), y2(:, 2), '-r')
legend('x_0 = (1, 1)^T', 'Location', 'best')
title("Trajetória - (1, 1)^T")
xlabel("x(t)")
ylabel("x'(t)")
