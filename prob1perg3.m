clc, clf, clearvars;

tolS = 10^-15;
maxIter = 50;

f = @(x) x.^20 .* exp(x-1);
vExato = integral(f, 0, 1);

[vsimpson, iterSimpson, ~, hSimpson, ~] = simpsonmetodo(f, 0, 1, tolS, maxIter);
[vtrap, iterTrap, ~, hTrap] = trapezios(f, 0, 1, tolS, maxIter);
vsimpson
vtrap

erroSimpson = abs(vExato - iterSimpson);
erroTrap = abs(vExato - iterTrap);


plot(hSimpson, erroSimpson, '*r')
hold on
plot(hTrap, erroTrap, '*b')
xscale log, yscale log
hold on

%% Regressões

xSimp = linspace(min(hSimpson), max(hSimpson));
xTrap = linspace(min(hTrap), max(hTrap));

% e ~~ C * h^p
% log(Erro) ~~ log(C) + p*log(h)
regSimp = polyfit(log10(hSimpson), log10(erroSimpson), 1);
regTrap = polyfit(log10(hTrap), log10(erroTrap), 1);

pSimp = regSimp(1)
pTrap = regTrap(1)

ySimp = 10^regSimp(2) * xSimp.^regSimp(1);
yTrap = 10^regTrap(2) * xTrap.^regTrap(1);

loglog(xSimp, ySimp, '--r')
hold on
loglog(xTrap, yTrap, '--b')

% Parte estética
title('Convergência (escala logarítmica)')
xlabel('Passo (h)'), ylabel('Erro Absoluto')
legend(sprintf('Simpson (p ≈ %.3f e C ≈ %.3f)', regSimp(1), 10^regSimp(2)), ...
    sprintf('Trapézios (p ≈ %.3f e C ≈ %.3f)', regTrap(1), 10^regTrap(2)), ...
    'Location', 'best')