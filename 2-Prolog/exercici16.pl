p([],[]).
p(L,[X|P]) :- select(X,L,R), p(R,P).
p(L,[X|P]) :- rotatePiece(X, E), select(E,L,R), p(R,P).

dom(L) :- p(L,P), ok(P), write(P), nl.
dom( ) :- write('no hay cadena'), nl.

ok([]):-!.
ok([_]):-!.
ok([A|[B|L]]):- A=f(_,X), B=f(Y,_), X=Y, ok([B|L]).

rotatePiece(P, R):- P = f(A,B), R = f(B,A), !.