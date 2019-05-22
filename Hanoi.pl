% Hanoi game

%	|		|		|
%	|		|		|
% -----   -----   -----
%	A		B		C

% The goal of this game is to move N discs from a to c using
% B as auxiliary tower. The restriction of this game is
% that it is not possible to put bigger disc over a smaller disc.

% 1. Move n-1 discs from A to B using c as axiliary tower
% 2. Move 1ste disc from A to C
% 3. Move 1-n discs from B to C using a as auxiliary tower.

% hanoi(+Num, +A, +B, +C, -Result),
% it is true if Result unifies with a lit of movements to 
% translate Num discs from tower A to C using C as auxiliary tower.

hanoi(1, A, _, C, [move(A,C)]).

hanoi(N, A, B, C, R):-
 N2 is N-1,
 hanoi(N2, A, C, B, R1),
 hanoi(1, A, _, C, R2),
 hanoi(N2, B, A, C, R3),
 append([R1, R2, R3], R).
 
