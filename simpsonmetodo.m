function [ int, intvec, dif, h, potencia2] = simpsonmetodo(f, alpha, beta, TolS, MaxIter)
% simpsonmetodo computes the approximate integral of Y via the Simpson method 
% TolS - distance between consecutive integrals: stopping criteria
%           |S_h-S_{h/2}| < TolS
% MaxIter - Maximum number of iterations
% The function returns
% INT - approximate integral value
% INTVEC - Iteration sequence of integrals
% DIF - distance between consecutive iterates
% H - sequence of sub-interval lengths (h0, h0/2, h0/2^2,...)
% POTENCIA2 - power relative to the last length of the subintervals, 2^{potencia2}
%
   h(1) = (beta-alpha)/2;
   x = alpha:h(1):beta;
   y = feval(f,x);
   n = length(x)-1;
   t(1) = h(1)/3*(y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+y(end));
   for k = 2:MaxIter
      h(k) = h(k-1)/2;
      x = alpha:h(k):beta;
      y = feval(f,x);
      n = length(x)-1;
      t(k) = h(k)/3*(y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+y(end));
      dif(k-1) = abs(t(k)-t(k-1));
      if dif(k-1) < TolS
         break
      elseif k == MaxIter
         disp('Foi excedido o número máximo de iterações (iter_max)');
         break
      end 
   end
   int = t(k);
   intvec = t';
   potencia2 = k;
   h = h';
   dif = dif';
end

    
