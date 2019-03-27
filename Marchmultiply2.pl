%multiply(?X, ?Y, ?Z)
%it is true if Z is X * Y.
%it is true if Z is the reslt of sum X, Y times.
multiply(_, 0, 0)

%multiply(n-1, ....) -> multiply(n, ...)
----------------------------------------
%	n					n-1
multiply(X, n(Y), Z2):- multiply(X, Y, Z), zum(Z, X, Z2).