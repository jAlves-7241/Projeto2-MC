% O mesmo script da pergunta 1, mas adaptado à função trapézios
% Nota: ocultei os outputs da fórmula de recorrência pq são iguais aos da
% pergunta anterior, mas é só tirar o ; para voltarem a aparecer

clc, clearvars;

TolS = 1e-3;
MaxIter = 20;
g = @(x) x.^20 .* exp(x-1); % Integranda

% Exato 
vExato = integral(g, 0, 1)

% Simpson
[vTrap, ~, ~, ~] = trapezios(g, 0, 1, TolS, MaxIter)

% Recorrência
i(1) = exp(-1);
for k = 2:20
    i(k) = 1 - k*i(k-1);  
end
vRec = i(20);

% Comparação
eAbsTrap = abs(vExato - vTrap)
eRelTrap = abs(eAbsTrap/vExato)

eAbsRec = abs(vExato - vRec);
eRelRec = abs(eAbsRec/vExato);