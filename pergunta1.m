clc, clearvars;

TolS = 1e-3;
MaxIter = 20;
g = @(x) x.^20 .* exp(x-1); % Integranda

% Exato 
vExato = integral(g, 0, 1)

% Simpson
[vSimpson, ~, ~, ~, numIterSimp] = simpsonmetodo(g, 0, 1, TolS, MaxIter)

% Recorrência
i(1) = exp(-1);
for k = 2:20
    i(k) = 1 - k*i(k-1);  
end
vRec = i(20) % Fórmula instável, provavelmente o objetivo para o relatório

% Comparação
eAbsSimpson = abs(vExato - vSimpson)
eRelSimpson = abs(eAbsSimpson/vExato)

eAbsRec = abs(vExato - vRec)
eRelRec = abs(eAbsRec/vExato)