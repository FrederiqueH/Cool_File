% natural(N)
% it is true if N is a natural number

natural(1). % 1 is a natural number

% natural(n-1) -> natural(n)
natural(N):- N > 1, N2 is N - 1, natural(N2).