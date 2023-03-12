% 7. Escribe un predicado suma demas(L) que, dada una lista de enteros L, se satisface si existe algún elemento en L que es igual a la suma de los demás elementos de L, y falla en caso contrario.
suma_demas(L):- sum_eq(0,L).

sum_eq(N,[X|L]):-addition(L,R), S is N+R, S=X.
sum_eq(N,[X|L]):-addition(L,R), S is N+R, not(S=X), N2 is N + X, sum_eq(N2,L).

addition([],0):-!.
addition([X|L],R):- addition(L,S), R is X + S.