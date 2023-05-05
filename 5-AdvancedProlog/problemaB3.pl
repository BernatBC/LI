main:- EstadoInicial = [1,2,5,8,1,0,0,0,0,0],     EstadoFinal = [0,0,0,0,0,1,1,2,5,8],
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

unPaso(Cost,[P1,P2,P5,P8,1,0,P1b,P2b,P5b,P8b],[P1c,P2c,P5c,P8c,0,1,P1d,P2d,P5d,P8d]):- selectOne([P1,P2,P5,P8],Cost), removeMan(Cost, [P1,P2,P5,P8], [P1c,P2c,P5c,P8c]), addMan(Cost, [P1b,P2b,P5b,P8b], [P1d,P2d,P5d,P8d]).

unPaso(Cost,[P1,P2,P5,P8,1,0,P1b,P2b,P5b,P8b],[P1c,P2c,P5c,P8c,0,1,P1d,P2d,P5d,P8d]):- selectTwo([P1,P2,P5,P8],[M1,M2]), removeMan(M1, [P1,P2,P5,P8], [P1aux,P2aux,P5aux,P8aux]), addMan(M1, [P1b,P2b,P5b,P8b], [P1aux2,P2aux2,P5aux2,P8aux2]), removeMan(M2, [P1aux,P2aux,P5aux,P8aux], [P1c,P2c,P5c,P8c]), addMan(M2, [P1aux2,P2aux2,P5aux2,P8aux2], [P1d,P2d,P5d,P8d]), max_list([M1,M2],Cost).

unPaso(Cost,[P1,P2,P5,P8,0,1,P1b,P2b,P5b,P8b],[P1c,P2c,P5c,P8c,1,0,P1d,P2d,P5d,P8d]):- selectOne([P1b,P2b,P5b,P8b],Cost), addMan(Cost, [P1,P2,P5,P8], [P1c,P2c,P5c,P8c]), removeMan(Cost, [P1b,P2b,P5b,P8b], [P1d,P2d,P5d,P8d]).

unPaso(Cost,[P1,P2,P5,P8,0,1,P1b,P2b,P5b,P8b],[P1c,P2c,P5c,P8c,1,0,P1d,P2d,P5d,P8d]):- selectTwo([P1b,P2b,P5b,P8b],[M1,M2]), addMan(M1, [P1,P2,P5,P8], [P1aux,P2aux,P5aux,P8aux]), removeMan(M1, [P1b,P2b,P5b,P8b], [P1aux2,P2aux2,P5aux2,P8aux2]), addMan(M2, [P1aux,P2aux,P5aux,P8aux], [P1c,P2c,P5c,P8c]), removeMan(M2, [P1aux2,P2aux2,P5aux2,P8aux2], [P1d,P2d,P5d,P8d]), max_list([M1,M2],Cost).


selectOne(L,X):- filterDifZero(L,L2), member(X,L2).

selectTwo(L,[X,Y]):- filterDifZero(L,L2), member(X,L2), member(Y,L2), X \= Y.

filterDifZero([],[]):-!.
filterDifZero([X|XS],YS):- X == 0, filterDifZero(XS,YS),!.
filterDifZero([X|XS],[X|YS]):- filterDifZero(XS,YS),!.

removeMan(1,[1,P2,P5,P8],[0,P2,P5,P8]).
removeMan(2,[P1,2,P5,P8],[P1,0,P5,P8]).
removeMan(5,[P1,P2,5,P8],[P1,P2,0,P8]).
removeMan(8,[P1,P2,P5,8],[P1,P2,P5,0]).

addMan(1,[0,P2,P5,P8],[1,P2,P5,P8]).
addMan(2,[P1,0,P5,P8],[P1,2,P5,P8]).
addMan(5,[P1,P2,0,P8],[P1,P2,5,P8]).
addMan(8,[P1,P2,P5,0],[P1,P2,P5,8]).