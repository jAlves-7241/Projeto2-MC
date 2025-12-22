%SIMPSON  Simpson numerical integration.
%   Z = SIMPSON(Y) computes an approximation of the integral of Y via
%   the Simson's method (with unit spacing).  To compute the integral
%   for spacing different from one, multiply Z by the spacing increment.
%   Z = SIMPSON(X,Y) computes the integral of Y with respect to X using
%   the Simpson method.  X and Y must be vectors of the same
%   length, or X must be a column vector and Y an array whose first
%   non-singleton dimension is length(X).  SIMPSON operates along this
%   dimension.
%
function z = simpson(x,y)
   if nargin == 1
      y = x;
      x = 1:length(y);
   end
   z = 0;
   n = length(x);
   if n ~= length(y)
      disp('Vectors do not have equal dimensions');
      return;
   end
   n = n - 1;
   if rem(n,2) == 1
      disp('Number of intervals must be even');
      return;
   end
   if n < 2
      disp('Number of intervals must be at least 2');
      return;
   end
   if nargin == 1
      z = (y(1) + y(n+1) + 4 * sum(y(2:2:n)) + 2 * sum(y(3:2:n))) / 3;
      return;
   end
   for i = 2:2:n
      z = z + (x(i+1) - x(i-1)) / 6 * (y(i+1) + y(i-1) + 4 * y(i));
   end
    