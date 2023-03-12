% 12. Escribe un predicado diccionario(A,N) que, dado un alfabeto A de sı́mbolos y un natural N, escriba todas las palabras de N sı́mbolos, por orden alfabético (el orden alfabético es según el alfabeto A dado). Por ejemplo, diccionario( [ga,chu,le],2) escribirá: gaga gachu gale chuga chuchu chule lega lechu lele.
diccionario(A,1,X):- contains(X,A).
diccionario(A,N,S):- contains(X, A), N > 1, N2 is N - 1, diccionario(A,N2,L2), concat(X,L2,S).

contains(X,[X|_]).
contains(X,[_|L]):-contains(X,L).