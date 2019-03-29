% peano arithmetic
%
% 0 - 0 
% 1 - n(0)
% 2 - n(n(0))
% 3 - n(n(n(0)))

% sum(?X, ?Y, ?Z)
% it is true if Z is X + Y using Peano
% Arithmetic

sum(0, Y, Y). 

% n		:-		n-1
sum(n(X), Y, n(Z)) :- sum(X, Y, Z).