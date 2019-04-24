% reverse(+List, -Result)
% it is true if Result unify with a list
% with the same leements that List have but
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