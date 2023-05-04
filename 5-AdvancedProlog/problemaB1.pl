main:- EstadoInicial = [0,0],     EstadoFinal = [0,4],
    between(1,1000,CosteMax),            % Buscamos solución de coste 0; si no, de 1, etc.
    camino( CosteMax, EstadoInicial, EstadoFinal, [EstadoInicial], Camino ),
    reverse(Camino, Camino1), write(Camino1), write(' con coste '), write(CosteMax), nl, halt.

camino( 0, E,E, C,C ).              % Caso base: cuando el estado actual es el estado final.
camino( CosteMax, EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
    CosteMax>0,
    unPaso( CostePaso, EstadoActual, EstadoSiguiente ),  % En B.1 y B.2, CostePaso es 1.
    \+member( EstadoSiguiente, CaminoHastaAhora ),
    CosteMax1 is CosteMax-CostePaso,
    camino( CosteMax1, EstadoSiguiente, EstadoFinal, [EstadoSiguiente|CaminoHastaAhora], CaminoTotal ).

unPaso(1, [A1,_], [A1,8]).
unPaso(1, [_,A1], [5,A1]).
unPaso(1, [A1,_], [A1,0]).
unPaso(1, [_,A1], [0,A1]).
unPaso(1, [A1,A2], [B1,B2]):- min_list([8,A2+A1],B2), B1 is A1+A2-B2.
unPaso(1, [A1,A2], [B1,B2]):- min_list([5,A2+A1],B1), B2 is A1+A2-B1.