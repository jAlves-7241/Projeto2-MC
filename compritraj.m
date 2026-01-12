function [l, pontos] = compritraj(f, intx, intu, t0, tn, n)

    numGrid = 101;
    l = zeros(1, numGrid^2); % Pré-alocar
    pontos = zeros(numGrid^2, 2); % Pré-alocar

    if rem(n,2) == 1
      disp('Number of intervals must be even');
      return;
    end

    x = linspace(intx(1), intx(2), numGrid);
    v = linspace(intu(1), intu(2), numGrid);
    [xx, vv] = meshgrid(x, v);
    pontos = [xx(:), vv(:)];
    
    dudt = zeros(2, n+1); % Pré-alocar

    for i = 1:numGrid^2

        [~, sol, t, ~] = rk4rn(f, pontos(i,:), t0, tn, n);
        
        for k = 1:n+1
            dudt(:,k) = f(t(k), sol(k,:)).';
        end

        vNorm = vecnorm(dudt, 2, 1);
        l(i) = simpson(t, vNorm);    
        
    end