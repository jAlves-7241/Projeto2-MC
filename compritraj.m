function [l, pontos] = compritraj(f, intx, intu, t0, tn, n)

    % Grelha
    numGrid = 101;

    x = linspace(intx(1), intx(2), numGrid);
    v = linspace(intu(1), intu(2), numGrid);
    [xx, vv] = meshgrid(x, v);
    pontos = [xx(:), vv(:)];
    
    % RK
    dxdu = zeros(2, n+1); % Pré-alocar

    for i = 1:numGrid^2

        [~, sol, t, ~] = rk4rn(f, pontos(i,:), t0, tn, n);
        
        for k = 1:n+1
            dxdu(:,k) = f(t(k), sol(k,:)).';
        end

    vNorm = vecnorm(dxdu, 2, 1);
    l(i) = simpson(t, vNorm);    
    end