% 6. Escribe un predicado dados(P,N,L) que signifique: “la lista L expresa una manera de sumar P puntos lanzando N dados”. Por ejemplo: si P es 5 y N es 2, una solución serı́a [1,4] (nótese que la longitud de L es N). Tanto P como N vienen instanciados. El predicado debe ser capaz de generar todas las soluciones posibles.
dados(0,0,[]).
dados(P,N,[X|L]):- contains(X, [1,2,3,4,5,6]), N > 0, B is N - 1, A is P - X, A >= 0, dados(A,B,L).

contains(X,[X|_]).
contains(X,[_|L]):-contains(X,L).