% 3. Representando conjuntos con listas sin repeticiones, escribe predicados para las operaciones de intersección y unión de conjuntos dados.
unio([],[],[]):-!.
unio([],L,L):-!.
unio(L,[],L):-!.
unio([X1|L1],L2,[X1|U]):- unio(L1,L2,U), not(conte(X1,U)).
unio([X1|L1],L2,U):-unio(L1,L2,U), conte(X1,U).

interseccio(_,[],[]):-!.
interseccio([],_,[]):-!.
interseccio([X|L1],L2,[X|I]):-interseccio(L1,L2,I), conte(X,L2).
interseccio([X|L1],L2,I):-interseccio(L1,L2,I), not(conte(X,L2)).

conte(X,[X|_]):-!.
conte(X,[_|L]):-conte(X,L).
