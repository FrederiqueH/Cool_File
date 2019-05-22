% game of sailing
% state(pos(X,Y) MaxX, MaxY).


%		  Wind
%         | |
%		  | |		
%		  \ /
%
%      \       / Close hauled 4
%       \     /
%    <---     ---> Beam reach 2
%       /  |  \
%      /   |   \ Broad reach 1
%		Running
%
%             Bow
%            ____
%	    	/    \
%	       |      |
%          |      | 
%   Port   |      | Starboard
%          |      |
%           \    /
%            ----
%            Stern

map(20, 20).
valid(X,Y):- map(MaxX, MaxY), X >= 0, Y >= 0,
			X =< MaxX, Y =< MaxY.

% starboard movements.
mov(running, 1, state(X, Y), state(X, Y2)):- Y2 is Y-1, valid(X, Y2).
mov(stboard_cl_hauled, 4,  state(X,Y), state(X2, Y2)):-
 X2 is X+1, Y2 is Y+1, valid(X2, Y2).
mov(stboard_beam_reach, 2, state(X,Y), state(X2, Y)):-
 X2 is X+1, valid(X2, Y).
mov(stboard_broad_reach, 1, state(X,Y), state(X2, Y2)):-
 X2 is X+1, Y2 is Y-1, valid(X2, Y2).
 
% port movement.
mov(port_cl_hauled, 4, state(X,Y), state(X2, Y2)):-
 X2 is X-1, Y2 is Y+1, valid(X2, Y2).
mov(port_beam_reach, 2, state(X,Y), state(X2, Y)):-
 X2 is X-1, valid(X2, Y).
mov(port_broad_reach, 1, state(X,Y), state(X2, Y2)):-
 X2 is X-1, Y2 is Y-1, valid(X2, Y2).
 
% path(+Ini, Fin, Visited, -Path, -Time).
% it is true if Path unifies with the list of moevements to go to
% from position Ini to position Fin without repeating Visited
% positions. Time unifies with the total path time.

path(Ini, Ini, _, [], 0).

path(Ini, Fin, Visited, [Mov|Path], TotalTime):-
 mov(Mov, TimeMov, Ini, Temp),
 \+ member(Temp, Visited),
 path(Temp, Fin, [Temp|Visited], Path, Time),
 TotalTime is Time + TimeMov. 

 