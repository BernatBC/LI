% 11. Escribe un predicado ord(L1,L2) que signifique: “L2 es la lista de enteros L1 ordenada de menor a mayor”. Por ejemplo: si L1 es [4,5,3,3,2] entonces L2 será [2,3,3,4,5]. Hazlo en una lı́nea, usando sólo los predicados permutacion y esta ordenada.
ord(L1,L2):-esta_ordenada(L2), permutation(L1,S), S=L2.

esta_ordenada([]):-!.
esta_ordenada([_|[]]):-!.
esta_ordenada([X|[Y|L]]):- X=<Y, esta_ordenada([Y|L]).