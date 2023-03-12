% 10. Escribe un predicado esta ordenada(L) que signifique: “la lista L de números enteros está ordenada de menor a mayor”. Por ejemplo, a la consulta:
% ?-esta ordenada([3,45,67,83]). el intérprete responde yes, y a la consulta:
%?-esta ordenada([3,67,45]). responde no.

esta_ordenada([]):-!.
esta_ordenada([_|[]]):-!.
esta_ordenada([X|[Y|L]]):- X=<Y, esta_ordenada([Y|L]).