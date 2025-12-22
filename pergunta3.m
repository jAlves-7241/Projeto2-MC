% Adicionar legenda e fazer regressão

clc, clf, clearvars;

TolS = 10^-15;
MaxIter = 50;

f = @(x) x.^20 .* exp(x-1);
vExato = integral(f, 0, 1)

[~, iterSimpson, ~, hSimpson, ~] = simpsonmetodo(f, 0, 1, TolS, MaxIter);
[~, iterTrap, ~, hTrap] = trapezios(f, 0, 1, TolS, MaxIter);

erroSimpson = abs(vExato - iterSimpson);
erroTrap = abs (vExato - iterTrap);


plot(hSimpson, erroSimpson, '*r')
hold on
plot(hTrap, erroTrap, '*y')
grid on, xscale log, yscale log