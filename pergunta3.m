clc, clf, clearvars;

TolS = 10^-15;
MaxIter = 50;

f = @(x) x.^20 .* exp(x-1);
vExato = integral(f, 0, 1);

[~, iterSimpson, ~, hSimpson, ~] = simpsonmetodo(f, 0, 1, TolS, MaxIter);
[~, iterTrap, ~, hTrap] = trapezios(f, 0, 1, TolS, MaxIter);

erroSimpson = abs(vExato - iterSimpson);
erroTrap = abs (vExato - iterTrap);


plot(hSimpson, erroSimpson, '*r')
hold on
plot(hTrap, erroTrap, '*y')
xscale log, yscale log
hold on

%% Regressões

x = linspace(min([hSimpson; hTrap]), max([hSimpson; hTrap]));

% e ~~ C + h^p
% log(Erro) ~~ log(C) * p*log(h)
regSimp = polyfit(log10(hSimpson), log10(erroSimpson), 1);
regTrap = polyfit(log10(hTrap), log10(erroTrap), 1);

pSimp = regSimp(1)
pTrap = regTrap(1)

ySimp = 10^regSimp(2) * x.^regSimp(1);
yTrap = 10^regTrap(2) * x.^regTrap(1);

plot(x, ySimp, '--r')
hold on
plot(x, yTrap, '--y')


title('Convergência (escala logarítimica)')
xlabel('Passo (h)'), ylabel('Erro Absoluto')
legend(sprintf('Simpson (p ≈ %.3f e C ≈ %.3f)', regSimp(1), 10^regSimp(2)), ...
    sprintf('Trapézios (p ≈ %.3f e C ≈ %.3f)', regTrap(1), 10^regTrap(2)), ...
    'Location', 'best')