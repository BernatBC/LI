% 22. Supongamos que N estudiantes (identificados por un número entre 1 y N) se quieren matricular de LI, pero sólo hay espacio para M, con M < N. Además nos dan una lista L de pares de estos estudiantes que son incompatibles entre sı́ (por ejemplo, porque siempre se copian). Queremos obtener un programa Prolog li(N,M,L,S) que, para N, M y L dados, genere un subconjunto S con M de los N estudiantes tal que si [x, y] ∈ L entonces {x, y} ̸⊆ S. Por ejemplo, una solución de li( 20, 16, [[8,11],[8,15],[11,6],[4,9],[18,13],[7,9],[16,8],[18,10],[6,17],[8,20]], S ) es [20,19,17,16,15,14,13,12,11,10,7,5,4,3,2,1] .

li(N,M,L,S):- numlist(1,N,G), liGen(N,M,L,G,S).

liGen(N,M,[],G,G):- N=M, !.
liGen(N,M,[L|LS],G,S):- L=[A,_], removeElement(G,A,G2), N2 is N - 1, liGen(N2,M,LS,G2,S), length(S, R), R=<M.
liGen(N,M,[L|LS],G,S):- L=[A,_], removeElement(G,A,G2), G=G2, liGen(N,M,LS,G2,S), length(S, R), R=<M.
liGen(N,M,[L|LS],G,S):- L=[_,B], removeElement(G,B,G2), N2 is N - 1, liGen(N2,M,LS,G2,S), length(S, R), R=<M.
liGen(N,M,[L|LS],G,S):- L=[_,B], removeElement(G,B,G2), G=G2, liGen(N,M,LS,G2,S), length(S, R), R=<M.

removeElement([],_,[]):-!. 
removeElement([L|LS],E,LS):- E=L, !.
removeElement([L|LS],E,[L|S]):- not(E=L), removeElement(LS,E,S), !.