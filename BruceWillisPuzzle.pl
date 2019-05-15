% State Problem

% From 5 and 3 gallons jugs, how can we measure 4 gallons?
%
% state(Gallons5bottle, Gallons3bottle)
%

% initial state
% state(0,0)

% final state
% state(4,_)

% Movements

% mov(Name, StateBefore, StateAfter)
%
% 1. Fill 5 gallons bottle
% 2. Fill 3 gallons bottle
% 3. Empty 3
% 4. Empty 5
% 5. Put 3 in 5
% 6. Put 5 in 3

% 1. Fill 5 gallons bottle
mov(fill5, state(_, G3), state(5, G3)).

% 2. Filla 3 fallons bottle
mov(fill3, state(G5, _), state(G5, 3)).

% 3. Empty 3
mov(emp5, state(_, G3), state(0,G3)).

% 4. Empty 4
mov(empty3, (G5,_), state(G5,0)).

% 5. put 3 in 5
% Option 1: G3 + G5 = < 5
mov(put3in5, state(G5, G3), state(GT, 0)) :- 
	GT is G3 + G5, GT =< 5.

% Option 2: G3 + G5 = > 5
mov(put3in5, state(G5, G3), state(5, G3N)) :-
	GT is G3 + G5, GT > 5, G3N is GT - 5.
	
% 6. Put 5 in 3
% Option 1: G3 + G5 =<3
mov(put5in3, state(G5, G3), state(0, GT)) :-
	GT is G3 + G5, GT =< 3.

% Option 2: G3 + G5 > 3
mov(put5in3, state(G5, G3), state(G5N, 3)) :-
	GT is G3 + G5, GT > 3, G5N is GT - 3.
	
% Creating the path to the solution

% path(+Initial, +Final, +Visited, -Path)
% it is true if Path unify with the list of
% movements needed to go to Initial State
% to Final State without repeating states in
% Visited states.

path(IniState, IniState, _, []).

path(Ini, Final, Visited, [Name|Path]) :-
	mov(Name, Ini, Temp), 
	\+ member(Temp, Visited),
	path(Temp, Final, [Temp|Visited], Path).