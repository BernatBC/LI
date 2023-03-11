% 2. Escribe un predicado pescalar(L1,L2,P) que signifique: “P es el producto escalar de los vectores L1 y L2”, donde los vectores se representan como listas de enteros. El predicado debe fallar si los dos vectores tienen longitudes distintas.
pescalar([],[],0).
pescalar([],_,false):-!.
pescalar(_,[],false):-!.
pescalar([X1|L1],[X2|L2], S):-pescalar(L1,L2,R), S is X1*X2+R.