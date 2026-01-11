clc, clearvars

x0 = [0; 0];
tSpan = [0, 20];

mu = 4;

vanDerPol = @(t, y) [y(2); mu*(1-y(1)^2)*y(2) - y(1)];

[t1, y1] = ode45(vanDerPol, tSpan, x0);

x0 = [0.000000001; 0];

[t2, y2] = ode45(vanDerPol, tSpan, x0);

subplot(1, 2, 1)
plot(y1(:, 1), y1(:, 2), '.b')
legend('x_0 = (0, 0)^T', 'Location', 'best')
title("Trajetória - (0, 0)^T")
xlabel("x(t)")
ylabel("x'(t)")

subplot(1, 2, 2)
plot(y2(:, 1), y2(:, 2), '-.r')
legend('x_0 = (0.000000001, 0)^T', 'Location', 'best')
title("Trajetória - \approx(0, 0)^T")
xlabel("x(t)")
ylabel("x'(t)")
