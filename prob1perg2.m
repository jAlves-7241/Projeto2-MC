% O mesmo script da pergunta 1, mas adaptado à função trapézios
clc, clearvars;

tolS = 1e-3;
maxIter = 20;
g = @(x) x.^20 .* exp(x-1);
 
vExato = integral(g, 0, 1) % Exato 

[vTrap, ~, numIterTrap, ~] = trapezios(g, 0, 1, tolS, maxIter) % Trapézios

i(1) = exp(-1); % Recorrência
for k = 2:20
    i(k) = 1 - k*i(k-1);  
end
vRec = i(20);

% Comparação
eAbsTrap = abs(vExato - vTrap)
eRelTrap = abs(eAbsTrap/vExato)

eAbsRec = abs(vExato - vRec);
eRelRec = abs(eAbsRec/vExato);