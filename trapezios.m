function [ int, intvec, potencia2, h] = trapezios(f, alpha, beta, epsilon, iter_max)
   h(1) = (beta-alpha)/2;
   x = alpha:h(1):beta;
   y = feval(f,x);
   t(1) = h(1) * trapz(y);
   for k = 2:iter_max
      h(k) = h(k-1) / 2;
      x = alpha:h(k):beta;
      y = feval(f,x);
      t(k) = h(k) * trapz(y);
      dif = abs(t(k) - t(k-1));
      if dif < epsilon
         break
      elseif k == iter_max
         disp('Foi excedido o número máximo de iterações (iter_max)');
         break
      end 
   end
   int = t(k);
   intvec = t';
   potencia2 = k;
   h = h';
end