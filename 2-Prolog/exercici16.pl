% 16. Queremos obtener en Prolog un predicado dom(L) que, dada una lista L de fichas de dominó (en el formato de abajo), escriba una cadena de dominó usando todas las fichas de L, o escriba “no hay cadena” si no es posible. Por ejemplo,
% ?- dom( [ f(3,4), f(2,3), f(1,6), f(2,2), f(4,2), f(2,1) ] ).
% escribe la cadena correcta:
% [ f(2,3), f(3,4), f(4,2), f(2,2), f(2,1), f(1,6) ].
% También podemos girar alguna ficha como f(N,M), reemplazándola por f(M,N). Ası́, para:
% ?- dom ([ f(4,3), f(2,3), f(1,6), f(2,2), f(2,4), f(2,1) ]).
% sólo hay cadena si se gira alguna ficha (por ejemplo, hay la misma cadena que antes).El siguiente programa Prolog aún no tiene en cuenta los posibles giros de fichas, ni tiene implementado el predicado ok(P), que significa: “P es una cadena de dominó correcta (tal cual, sin necesidad ya de girar ninguna ficha)”:
% (a) ¿Qué significa el predicado p(L,P) para una lista L dada?
% (b) Escribe el predicado ok(P) que falta.
% (c) Extiende el predicado p para que el programa también pueda hacer cadenas girando alguna de las fichas de la entrada.

p([],[]).
p(L,[X|P]) :- select(X,L,R), p(R,P).
p(L,[X|P]) :- rotatePiece(X, E), select(E,L,R), p(R,P).

dom(L) :- p(L,P), ok(P), write(P), nl.
dom( ) :- write('no hay cadena'), nl.

ok([]):-!.
ok([_]):-!.
ok([A|[B|L]]):- A=f(_,X), B=f(Y,_), X=Y, ok([B|L]).

rotatePiece(P, R):- P = f(A,B), R = f(B,A), !.