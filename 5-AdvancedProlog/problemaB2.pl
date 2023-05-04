main:- EstadoInicial = [3,3,1,0,0,0],     EstadoFinal = [0,0,0,3,3,1],
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

unPaso(1, [M1,C1,1,M2,C2,0], [M3,C1,0,M4,C2,1]):- M3 is M1 - 1, M4 is M2 + 1, (M3 >= C1; M3 == 0), between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2).
unPaso(1, [M1,C1,1,M2,C2,0], [M1,C3,0,M2,C4,1]):- C3 is C1 - 1, C4 is C2 + 1, (M2 >= C4; M2 == 0), between(0,3,M1), between(0,3,M2), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).
unPaso(1, [M1,C1,1,M2,C2,0], [M3,C3,0,M4,C4,1]):- M3 is M1 - 1, M4 is M2 + 1, C3 is C1 - 1, C4 is C2 + 1, (M3 >= C3; M3 == 0), M4 >= C4, between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).
unPaso(1, [M1,C1,1,M2,C2,0], [M3,C1,0,M4,C2,1]):- M3 is M1 - 2, M4 is M2 + 2, (M3 >= C1; M3 == 0), between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2).
unPaso(1, [M1,C1,1,M2,C2,0], [M1,C3,0,M2,C4,1]):- C3 is C1 - 2, C4 is C2 + 2, (M2 >= C4; M2 == 0), between(0,3,M1), between(0,3,M2), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).

unPaso(1, [M1,C1,0,M2,C2,1], [M3,C1,1,M4,C2,0]):- M3 is M1 + 1, M4 is M2 - 1, (M4 >= C2; M4 == 0), between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2).
unPaso(1, [M1,C1,0,M2,C2,1], [M1,C3,1,M2,C4,0]):- C3 is C1 + 1, C4 is C2 - 1, (M1 >= C3; M1 == 0), between(0,3,M1), between(0,3,M2), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).
unPaso(1, [M1,C1,0,M2,C2,1], [M3,C3,1,M4,C4,0]):- M3 is M1 + 1, M4 is M2 - 1, C3 is C1 + 1, C4 is C2 - 1, (M4 >= C4; M4 == 0), M3 >= C3, between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).
unPaso(1, [M1,C1,0,M2,C2,1], [M3,C1,1,M4,C2,0]):- M3 is M1 + 2, M4 is M2 - 2, (M4 >= C2; M4 == 0), between(0,3,M1), between(0,3,M2), between(0,3,M3), between(0,3,M4), between(0,3,C1), between(0,3,C2).
unPaso(1, [M1,C1,0,M2,C2,1], [M1,C3,1,M2,C4,0]):- C3 is C1 + 2, C4 is C2 - 2,(M1 >= C3; M1 == 0), between(0,3,M1), between(0,3,M2), between(0,3,C1), between(0,3,C2), between(0,3,C3), between(0,3,C4).