clc, clearvars

x0 = [1; 3];
tSpan = linspace(0, 20, 501); % Nota: o número de intervalos (não instantes) tem de ser par

vanDerPol = @(t, y) [y(2); 4*(1-y(1)^2)*y(2) - y(1)];
[~, sol] = ode45(vanDerPol, tSpan, x0);

x = sol(:, 1).';
v = sol(:, 2).';

f = [v; 4.*(1-x.^2).*v-x];

% g = arrayfun(@(i) norm(f(:, i)), 1:length(f));
% Alternativa, mas o de baixo é mais clean e melhor
vNorm = vecnorm(f, 2, 1);

simpson(tSpan, vNorm)