:- use_module(library(pce)).

draw_square(X, Y, Len) :-
	new(Window, picture('my window')),
	send(Window, size, size(400,400)),
	send(Window, open),
X1 is X + Len,
Y1 is Y - Len,
my_fractal(Windows, N, point(X,Y), Len).

send(Window, display, new(Pa, path)),
		(
		send(Pa, append, point(X, Y)),
		send(Pa, append, point(X1, Y)),
		send(Pa, append, point(X1, Y1)),
		send(Pa, append, point(X, Y1)),
		send(Pa, closed, @on),
		send(Pa, fill_pattern, colour(@default, 0, 0, 0)
		)
).

my_fractal_(Window, N, point(X,Y), Len):-

send(Window, display, new(Pa, path)),
		(
		send(Pa, append, point(X, Y)),
		send(Pa, append, point(X1, Y)),
		send(Pa, append, point(X1, Y1)),
		send(Pa, append, point(X, Y1)),
		send(Pa, closed, @on),
		send(Pa, fill_pattern, colour(@default, 0, 0, 0)
		)

 N2 is N-1,
 X1 is X + (Len div 2) - (Len div 8),
 Y1 is Y - (Len div 2) + (Len div 8), 
 Len2 is Len div 4,
 my_fractal(Window, N2, point(X1, Y1), Len2).