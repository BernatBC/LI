% 9. Escribe un predicado card(L) que, dada una lista de enteros L, escriba la lista que, para cada elemento de L, dice cuántas veces aparece este elemento en L. Por ejemplo, si hacemos la consulta card( [1,2,1,5,1,3,3,7] ) el intérprete escribirá: [[1,3],[2,1],[5,1],[3,2],[7,1]].
card([],[]):-!.
card([X|L],[[X,N]|S]):- count(X,[X|L],N), remove(X,L,L2), card(L2,S).

count(_,[],0):-!.
count(N,[X|L],S):- not(N=X), count(N,L,S).
count(N,[X|L],S):- N=X, count(N,L,R), S is R + 1.

remove(_,[],[]):-!.
remove(N,[X|L],[X|L2]):- not(N=X), remove(N,L,L2).
remove(N,[X|L],L2):- N=X, remove(N,L,L2).