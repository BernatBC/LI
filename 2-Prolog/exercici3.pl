% 3. Representando conjuntos con listas sin repeticiones, escribe predicados para las operaciones de intersección y unión de conjuntos dados.
union([],[],[]):-!.
union([],L,L):-!.
union(L,[],L):-!.
union([X1|L1],L2,[X1|U]):- union(L1,L2,U), not(contains(X1,U)).
union([X1|L1],L2,U):-union(L1,L2,U), contains(X1,U).

intersection(_,[],[]):-!.
intersection([],_,[]):-!.
intersection([X|L1],L2,[X|I]):-intersection(L1,L2,I), contains(X,L2).
intersection([X|L1],L2,I):-intersection(L1,L2,I), not(contains(X,L2)).

contains(X,[X|_]):-!.
contains(X,[_|L]):-contains(X,L).
