% 8. Escribe un predicado suma ants(L) que, dada una lista de enteros L, se satisface si existe algún elemento en L que es igual a la suma de los elementos anteriores a él en L, y falla en caso contrario.
suma_ants(L):-sum_ants(0,L).

sum_ants(N,[X|L]):- not(N = X), N2 is N + X, sum_ants(N2,L).
sum_ants(N,[X|_]):- N = X.