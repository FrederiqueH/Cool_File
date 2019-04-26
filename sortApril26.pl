% reverse(+List, -Result)
% it is true if Result unify with a list
% with the same elements that List have but
% in reverse order
%
% ? reverse([1,2,3,4]. R).
% [4,3,2,1]

myReverse([], []).

myReverse([Head|Tail],R2):- myReverse(Tail, R),
	append(R,[Head],R2).

% myReverse([1,2,3,4]),  ):-  myReverse([2,3,4], [4,3,2]), 

% append([1,2,3], [4,5,6], R).
% R = [1,2,3,4,5,6]


% slow version
%--------------------------------------
% sort_bubble (+List, -ListR).
% is true when ListR unifies with a list that
% contains the same elements as List sort
% from lowest to highest.
%--------------------------------------
sort_bubble(List, List):- sort(List).
sort_bubble(List, RT) :-
	append(Ini,[E2,E1|end], List),
	E1>E2,
	append(Ini, [E2,E1|end],R),
	sort_bubble(R,RT).
%--------------------------------------
% sort(+List)
% is true when List unifies with a list
% that contains her elements sorted from lowest
% to highest.
%--------------------------------------
sort([]).
sort([_]).
sort([Cab1, Cab2|Rest]):-
	Cab1 =< Cab2,
	sort([Cab2|Rest]).
	
	
	
	
%--------------------------------------
% insert_in_list_sort(+Elem, +List, -ListR).
% it is true when ListR unifies with a list
% that contains the elements of de sorted list
% List, with the element Elem inserted in 
% an sorted form.
%--------------------------------------
insert_in_list_sort(Elem, [], [Elem]).
insert_in_list_sort(Elem, [Cab|Rest], [Elem,Cab|Rest]):-
	Elem =< Cab.
	
insert_in_list_sort(Elem, [Cab|Rest], [Cab|R]):-
	Elem > Cab,
	insert_in_list_sort(Elem, Rest, R).
	
	
	
% faster version
%--------------------------------------
% sort_incertion (+Lista, -ListaR).
% is true when ListR unifies with a list that
% contains the same elements as sorted List
% from lowest to highest.
%--------------------------------------
sort_incertion([],[]).
sort_incertion([Cab|Rest], RT):-
	sort_incertion(Rest, R),
	insert_in_list_sort(Cab,R, RT).
	
	
% fastest version
%----------------------------------------
% divide(+Elem, +List, -Lowest, -Highest)
% it is true when Lowest unifies with a list that
% contains the elements of the list that are lowest
% or equal to Elem and the Highest unifies with a list
% that contains the elements of the list that are 
% higher than Elem.
%-----------------------------------------
divide(_,[],[],[]).
divide(Elem, [Cab|Rest], Lowest, [Cab|Highest]):-
	Cab > Elem,
	divide(Elem, Rest, Lowest, Highest).
divide(Elem, [Cab|Rest], [Cab|Lowest], Highest):-
	Cab =< Elem,
	divide(Elem, Rest, Lowest, Highest).
%------------------------------------------
% sort_quick (List+, -ListR).
% is true when ListR unifies with the list that
% containts he same elements as the sorted List
% from the Lowest to the Highest.
%------------------------------------------
sort_quick([],[]).
sort_quick([Cab|Rest], R):-
	divide(Cab, Rest, Low, High),
	sort_quick(Low, RLow),
	sort_quick(High, RHigh),
	append(RLow, [Cab|RHigh], R).
	

% find the element that appears more often in a list	
%------------------------------------------
% more_often (+List, -Elem, -Num)
% it is true when Elem inifies with the element
% that repeatedly appears in the list List
% and Num unifies with how many times this nummer
% appears in the list.
%-------------------------------------------
more_often([],_,0).
more_often([Ca|Co], Ca, N2):-
	more_often(Co,El,N),
	Ca=El,
	N2 is N+1.
more_often([Ca|Co], El, N):-
	more_often(Co,El,N),
	Ca\=El.
