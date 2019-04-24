% peano arithmetic
%
% 0 - 0 
% 1 - n(0)
% 2 - n(n(0))
% 3 - n(n(n(0)))

% sum(?X, ?Y, ?Z)
% it is true if Z is X + Y using Peano
% Arithmetic

sum(0, Y, Y):- peano(Y).
% n		:-		n-1
sum(n(X), Y, n(Z)) :- sum(X, Y, Z).

% p2d (+P, -D)
% it is true if D unity with a
% decimal number equivalent to the 
% peano representation of P

p2d(0, 0).
p2d(n(P), Number2):- var(Number2),
 p2d(P, Number),
 Number2 is Number + 1.
 
% d2p(+D, -P)
% it is true if P unify with a
% Peano representation equivalent to the
% decimal number D 

d2p(0, 0).
d2p(D, n(P)):- D > 0, D2 is D-1, d2p(D2, P).
 
% substr(?X, ?Y, ?Z)
% it is true if Z is X - Y in using 
% Peano arithmetic

substr(X, 0, X).
substr(X, n(Y), Z):- substr(X, Y, n(Z)).

% multiply(?X, ?Y, ?Z)
% it is true if Z unify with X * Y in Peano Arithmetic
% it is true if Z unify with  a Peano number
% equivalernt to X, Y times

multiply(X, 0, 0):- peano(X).
multiply(X, n(Y), Z2):- multiply(X, Y, Z), 
 greater(Z, X), greater(Z, Y), 
 sum(X, Z, Z2).

% greater(+X, +Y)
% it is true if X is greater than Y

greater(n(X,0):- peano(X)
greater(X, X): - peano(X)
greater(n(X), n(Y)):- greater(X, Y).

% Peano(+X)
% it is true if X is a Peano number

peano(0).
peano(n(X)):- peano(X).

% divide(X?, Y?, Z?)
% it is true if Z is the integer division
% of X divided by Y. Equivalent to div using
% Peano arithemtic. how many times is possible 
% to delete Y to X.

division(X, Y, 0) :- greater(Y, X).
division(X, Y, n(Z)):- substr(X, Y, X2). division,
  division(X2, Y, Z).





