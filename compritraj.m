function [c, pontos] = compritraj(f, intx, intu, t0, tn, n)

    NumGrid = 101;
    c = zeros(1, NumGrid^2); % Pré-alocar
    pontos = zeros(NumGrid^2, 2); % Pré-alocar

    if rem(n,2) == 1
      disp('Number of intervals must be even');
      return;
    end

    x = linspace(intx(1), intx(2), NumGrid);
    v = linspace(intu(1), intu(2), NumGrid);
    [xx, vv] = meshgrid(x, v);
    pontos = [xx(:), vv(:)];
    
    dudt = zeros(2, n+1); % Pré-alocar

    for i = 1:NumGrid^2

        [~, sol, t, ~] = rk4rn(f, pontos(i,:), t0, tn, n);
        
        for k = 1:n+1
            dudt(:,k) = f(t(k), sol(k,:)).';
        end

        vNorm = vecnorm(dudt, 2, 1);
        c(i) = simpson(t, vNorm);    
        
    end